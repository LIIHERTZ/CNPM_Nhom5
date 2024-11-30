package com.cinema.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieDAO;
import com.cinema.entity.Cinema;
import com.cinema.entity.Movie;
import com.cinema.entity.NewsOrDiscount;
import com.cinema.entity.Movie;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class MovieDAOImpl implements IMovieDAO {

	@Override
	public List<Movie> getAllMovie() {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies = null;
		try {
			movies = em.createQuery("FROM Movie", Movie.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return movies;
	}

	@Override
	public Movie getOneMovie(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		Movie movie = new Movie();
		try {
			movie = em.find(Movie.class, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return movie;
	}

	@Override
	public boolean insertMovie(Movie movie) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu giao dịch
			em.persist(movie); // Chèn bản ghi
			em.getTransaction().commit(); // Commit giao dịch
			return true; // Trả về true nếu thành công
		} catch (Exception e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback nếu có lỗi
			}
			System.err.println("Error inserting movie: " + e.getMessage());
		} finally {
			em.close(); // Đóng EntityManager
		}
		return false; // Trả về false nếu có lỗi
	}

	@Override
    public boolean updateMovie(Movie movie) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();

            // Kiểm tra nếu movie tồn tại
            Movie existingMovie = em.find(Movie.class, movie.getMovieID());
            if (existingMovie != null) {
                // Cập nhật các trường cần thiết
                existingMovie.setMovieName(movie.getMovieName());
                existingMovie.setCategory(movie.getCategory());
                existingMovie.setDescription(movie.getDescription());
                existingMovie.setMovieDuration(movie.getMovieDuration());
                existingMovie.setMovieTrailer(movie.getMovieTrailer());
                existingMovie.setReleaseDay(movie.getReleaseDay());
                existingMovie.setStatus(movie.isStatus());
                existingMovie.setImage(movie.getImage());
                em.merge(existingMovie); // Merge vào database
            } else {
                return false; // Không tìm thấy movie
            }

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

	@Override
	public boolean deleteMovie(int movieID) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu giao dịch

			// Tìm đối tượng Movie dựa trên movieID
			Movie movie = em.find(Movie.class, movieID);
			if (movie != null) {
				em.remove(movie); // Xóa đối tượng Movie
				em.getTransaction().commit(); // Commit giao dịch
				return true; // Trả về true nếu xóa thành công
			} else {
				System.err.println("Movie with ID " + movieID + " not found.");
			}
		} catch (Exception e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback giao dịch nếu có lỗi
			}
			System.err.println("Error deleting movie: " + e.getMessage());
		} finally {
			em.close(); // Đóng EntityManager để giải phóng tài nguyên
		}
		return false; // Trả về false nếu có lỗi
	}

	@Override
	public List<Movie> getMovies(int offset, int noOfRecords) {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies = new ArrayList<>();
		try {
			// JPQL để truy vấn danh sách phim
			String jpql = "SELECT m FROM Movie m";
			TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);

			// Thiết lập phân trang
			query.setFirstResult(offset); // Bắt đầu từ bản ghi nào
			query.setMaxResults(noOfRecords); // Lấy bao nhiêu bản ghi

			// Lấy kết quả
			movies = query.getResultList();
		} catch (Exception e) {
			System.err.println("Error retrieving movies with pagination: " + e.getMessage());
		} finally {
			em.close(); // Đóng EntityManager để giải phóng tài nguyên
		}
		return movies;
	}

	@Override
	public int getNoOfRecords() {
		EntityManager em = JPAConfig.getEntityManager();
		int noOfRecords = 0;
		try {
			// Truy vấn đếm số bản ghi trong bảng Movie
			String jpql = "SELECT COUNT(m) FROM Movie m"; // Thay "Cinema" thành "Movie"
			TypedQuery<Long> query = em.createQuery(jpql, Long.class);
			noOfRecords = query.getSingleResult().intValue(); // Chuyển đổi Long -> int
		} catch (Exception e) {
			System.err.println("Error retrieving number of movie records: " + e.getMessage());
		} finally {
			em.close(); // Đảm bảo đóng EntityManager
		}
		return noOfRecords;
	}

	@Override
	public Movie getMovieById(int movieID) {
		EntityManager em = JPAConfig.getEntityManager();
		Movie movie = null;
		try {
			// Tìm đối tượng Movie dựa trên movieID
			movie = em.find(Movie.class, movieID);
		} catch (Exception e) {
			System.err.println("Error retrieving movie with ID " + movieID + ": " + e.getMessage());
		} finally {
			em.close(); // Đóng EntityManager để giải phóng tài nguyên
		}
		return movie; // Trả về đối tượng Movie hoặc null nếu không tìm thấy
	}

	@Override
	public List<Movie> searchMovies(String keyword, int offset, int limit) {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies;

		try {
			// Xây dựng câu truy vấn tìm kiếm
			StringBuilder queryStr = new StringBuilder("SELECT m FROM Movie m WHERE 1=1");

			// Thêm điều kiện nếu từ khóa không rỗng
			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			TypedQuery<Movie> query = em.createQuery(queryStr.toString(), Movie.class);

			// Set tham số cho từ khóa nếu có
			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			// Thiết lập phân trang
			query.setFirstResult(offset);
			query.setMaxResults(limit);

			// Lấy kết quả
			movies = query.getResultList();
		} finally {
			em.close();
		}

		return movies;
	}

	@Override
	public int getNoOfSearchResults(String keyword) {
		EntityManager em = JPAConfig.getEntityManager();
		Long noOfRecords;

		try {
			// Xây dựng câu truy vấn đếm số lượng kết quả tìm kiếm
			StringBuilder queryStr = new StringBuilder("SELECT COUNT(m) FROM Movie m WHERE 1=1");

			// Thêm điều kiện nếu từ khóa không rỗng
			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			TypedQuery<Long> query = em.createQuery(queryStr.toString(), Long.class);

			// Set tham số cho từ khóa nếu có
			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			// Lấy kết quả đếm
			noOfRecords = query.getSingleResult();
		} finally {
			em.close();
		}

		return noOfRecords.intValue();
	}

	@Override
	public List<Movie> searchMovies(String keyword, String category, int offset, int limit) {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies;

		try {
			StringBuilder queryStr = new StringBuilder("SELECT m FROM Movie m WHERE 1=1");

			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			if (category != null && !"All".equalsIgnoreCase(category)) {
				queryStr.append(" AND LOWER(m.category) LIKE :category");
			}

			TypedQuery<Movie> query = em.createQuery(queryStr.toString(), Movie.class);

			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			if (category != null && !"All".equalsIgnoreCase(category)) {
				query.setParameter("category", "%" + category.toLowerCase() + "%");
			}

			query.setFirstResult(offset);
			query.setMaxResults(limit);

			movies = query.getResultList();
		} finally {
			em.close();
		}

		return movies;
	}

	@Override
	public int getNoOfSearchResults(String keyword, String category) {
		EntityManager em = JPAConfig.getEntityManager();
		int count = 0;

		try {
			StringBuilder queryStr = new StringBuilder("SELECT COUNT(m) FROM Movie m WHERE 1=1");

			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			if (category != null && !"All".equalsIgnoreCase(category)) {
				queryStr.append(" AND LOWER(m.category) LIKE :category");
			}

			TypedQuery<Long> query = em.createQuery(queryStr.toString(), Long.class);

			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			if (category != null && !"All".equalsIgnoreCase(category)) {
				query.setParameter("category", "%" + category.toLowerCase() + "%");
			}

			count = query.getSingleResult().intValue();
		} finally {
			em.close();
		}

		return count;
	}

	@Override
	public List<Movie> searchMovies(String keyword, String[] categories, int offset, int limit) {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies;

		try {
			StringBuilder queryStr = new StringBuilder("SELECT m FROM Movie m WHERE 1=1");

			// Thêm điều kiện cho từ khóa tìm kiếm
			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			// Thêm điều kiện cho danh sách thể loại
			if (categories != null && categories.length > 0 && !categories[0].equalsIgnoreCase("All")) {
				queryStr.append(" AND (");
				for (int i = 0; i < categories.length; i++) {
					queryStr.append("LOWER(m.category) LIKE :category").append(i);
					if (i < categories.length - 1) {
						queryStr.append(" OR ");
					}
				}
				queryStr.append(")");
			}

			// Tạo TypedQuery từ chuỗi truy vấn
			TypedQuery<Movie> query = em.createQuery(queryStr.toString(), Movie.class);

			// Gán giá trị cho từ khóa tìm kiếm
			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			// Gán giá trị cho các thể loại
			if (categories != null && categories.length > 0 && !categories[0].equalsIgnoreCase("All")) {
				for (int i = 0; i < categories.length; i++) {
					query.setParameter("category" + i, "%" + categories[i].toLowerCase() + "%");
				}
			}

			// Thiết lập phân trang
			query.setFirstResult(offset);
			query.setMaxResults(limit);

			// Lấy danh sách kết quả
			movies = query.getResultList();
		} finally {
			em.close();
		}

		return movies;
	}

	@Override
	public int getNoOfSearchResults(String keyword, String[] categories) {
		EntityManager em = JPAConfig.getEntityManager();
		int noOfRecords;

		try {
			StringBuilder queryStr = new StringBuilder("SELECT COUNT(m) FROM Movie m WHERE 1=1");

			// Điều kiện tìm kiếm từ khóa
			if (keyword != null && !keyword.trim().isEmpty()) {
				queryStr.append(" AND LOWER(m.movieName) LIKE :keyword");
			}

			// Điều kiện tìm kiếm theo danh sách thể loại
			if (categories != null && categories.length > 0 && !categories[0].equalsIgnoreCase("All")) {
				queryStr.append(" AND (");
				for (int i = 0; i < categories.length; i++) {
					queryStr.append("LOWER(m.category) LIKE :category").append(i);
					if (i < categories.length - 1) {
						queryStr.append(" OR ");
					}
				}
				queryStr.append(")");
			}

			// Tạo TypedQuery từ chuỗi truy vấn
			TypedQuery<Long> query = em.createQuery(queryStr.toString(), Long.class);

			// Gán giá trị cho từ khóa tìm kiếm
			if (keyword != null && !keyword.trim().isEmpty()) {
				query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
			}

			// Gán giá trị cho các thể loại
			if (categories != null && categories.length > 0 && !categories[0].equalsIgnoreCase("All")) {
				for (int i = 0; i < categories.length; i++) {
					query.setParameter("category" + i, "%" + categories[i].toLowerCase() + "%");
				}
			}

			// Lấy tổng số bản ghi phù hợp
			noOfRecords = query.getSingleResult().intValue();
		} finally {
			em.close();
		}

		return noOfRecords;
	}

	@Override
	public List<Movie> getAllMovieActive() {
		EntityManager em = JPAConfig.getEntityManager();
		List<Movie> movies = null;
		try {
			movies = em.createQuery("FROM Movie WHERE status = :status", Movie.class)
					.setParameter("status", true) // Hoặc `1` nếu kiểu `bit`
					.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return movies;
	}

	@Override
	public List<Movie> searchMoviesByName(String movieName) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT m FROM Movie m WHERE m.movieName LIKE :movieName";
			TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
			query.setParameter("movieName", "%" + movieName + "%");
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Movie> getMoviesShowing() {
		EntityManager em = JPAConfig.getEntityManager(); // Kết nối EntityManager từ cấu hình JPA
		try {
			String jpql = "SELECT m FROM Movie m " + "WHERE m.status = true AND m.releaseDay <= CURRENT_DATE";
			TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
			List<Movie> movies = query.getResultList();
			System.out.println("Currently Showing Movies Size: " + movies.size()); // Log kích thước danh sách
			return movies;
		} finally {
			em.close(); // Đóng EntityManager sau khi truy vấn
		}
	}

	@Override
	public List<Movie> getMoviesComingSoon() {
		EntityManager em = JPAConfig.getEntityManager(); // Kết nối EntityManager từ cấu hình JPA
		try {
			String jpql = "SELECT m FROM Movie m " + "WHERE m.status = true AND m.releaseDay > CURRENT_DATE";
			TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
			List<Movie> movies = query.getResultList();
			System.out.println("Coming Soon Movies Size: " + movies.size()); // Log kích thước danh sách
			return movies;
		} finally {
			em.close(); // Đóng EntityManager sau khi truy vấn
		}
	}
	public boolean updateMovieRating(int movieId, float rating) {
	    EntityManager em = JPAConfig.getEntityManager();
	    EntityTransaction transaction = em.getTransaction();
	    try {
	        transaction.begin();

	        // Kiểm tra nếu movie tồn tại
	        Movie movie = em.find(Movie.class, movieId);
	        if (movie != null) {
	            // Chỉ cập nhật cột rating
	            movie.setRating(rating);

	            // Merge vào database để cập nhật
	            em.merge(movie); 
	        } else {
	            return false; // Không tìm thấy movie
	        }

	        transaction.commit();
	        return true;
	    } catch (Exception e) {
	        if (transaction.isActive()) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	        return false;
	    } finally {
	        em.close();
	    }
	}



}