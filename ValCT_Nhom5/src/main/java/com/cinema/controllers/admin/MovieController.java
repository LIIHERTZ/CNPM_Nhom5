package com.cinema.controllers.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Formatter;
import java.util.List;

import com.cinema.entity.Movie;
import com.cinema.services.impl.CinemaServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.cinema.services.IMovieService;
import com.cinema.services.impl.MovieServiceImpl;

@WebServlet(urlPatterns = {"/admin/movies","/admin/addMovie", "/admin/showAddMovie", "/admin/editMovie", "/admin/deleteMovie", "/admin/searchMovie"})
@MultipartConfig
public class MovieController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IMovieService movieService = new MovieServiceImpl();
	String uploadPath = "D:/images";
	
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/editMovie":
            	showEditMovieForm(req, resp);
                break;
            case "/admin/addMovie":
            	showAddMovieForm(req, resp);
                break;
            case "/admin/deleteMovie":
                deleteMovie(req, resp);
                break;
            case "/admin/searchMovie":
                searchMovies(req, resp);
                break;
            case "/admin/Movies":
            default:
                listMovies(req, resp);
                break;
        }
	}
	

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/addMovie":
                addMovie(req, resp);
                break;
            case "/admin/editMovie":
                editMovie(req, resp);
                break;
            case "/admin/deleteMovie":
                deleteMovie(req, resp); // Thêm dòng này để xử lý xóa bằng POST
                break;
        }
    }


	private void showAddMovieForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/AddMovie.jsp");
		rd.forward(req, resp);
	}

    private void showEditMovieForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String MovieIDParam = req.getParameter("id");
        if (MovieIDParam != null && !MovieIDParam.isEmpty()) {
            try {
                int MovieID = Integer.parseInt(MovieIDParam);
                Movie Movie = movieService.getMovieById(MovieID);
                if (Movie != null) {
                    req.setAttribute("Movie", Movie);
                    RequestDispatcher rd = req.getRequestDispatcher("/views/admin/EditMovie.jsp");
                    rd.forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/movies?error=notfound");
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
        }
    }

    private void addMovie(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("movie_name");
        String category = req.getParameter("category");
        String movieDuration = req.getParameter("movie_duration");
        String description = req.getParameter("description");
        String dateString = req.getParameter("release_day");
        boolean status = Boolean.parseBoolean(req.getParameter("status"));
        
        Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
		} catch (Exception e) {
			e.printStackTrace();
		}

        Movie Movie = new Movie();
        Movie.setMovieName(name);
        Movie.setCategory(category);  // Gán chuỗi thể loại đã nối vào
        Movie.setMovieDuration(movieDuration); // Gán giá trị location
        Movie.setDescription(description);
        Movie.setStatus(status);
        Movie.setReleaseDay(date);

        String oldFile = Movie.getImage();
		handleImageUpload(req, Movie, uploadPath);
		if (Movie.getImage() == null || Movie.getImage().isEmpty() || Movie.getImage().equals("https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")) {
            Movie.setImage(oldFile);
        }
        boolean isAdded = movieService.insertMovie(Movie);
        if (isAdded) {
            resp.sendRedirect(req.getContextPath() + "/admin/movies");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/showAddMovie?error=true");
        }
    }

    private void editMovie(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String MovieIDParam = req.getParameter("movieID");
        if (MovieIDParam != null && !MovieIDParam.isEmpty()) {
            try {
                int MovieID = Integer.parseInt(MovieIDParam);
                String name = req.getParameter("movie_name");
                String category = req.getParameter("category");
                String movieDuration = req.getParameter("movie_duration");
                String description = req.getParameter("description");
                String dateString = req.getParameter("release_day");
                boolean status = Boolean.parseBoolean(req.getParameter("status"));
                Date date = null;
        		try {
        			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        		} catch (Exception e) {
        			e.printStackTrace();
        		}

                Movie Movie = new Movie();
                Movie.setMovieID(MovieID);
                Movie.setMovieName(name);
                Movie.setCategory(category);
                Movie.setMovieDuration(movieDuration); // Gán giá trị location
                Movie.setDescription(description);
                Movie.setStatus(status);
                Movie.setReleaseDay(date);
                String oldFile = req.getParameter("oldImage");
    			
    			try {
    		        Part part = req.getPart("images");
    		        if (part != null && part.getSize() > 0) {
    		            // Người dùng đã chọn ảnh mới
    		            handleImageUpload(req, Movie, uploadPath);
    		        } else {
    		            // Người dùng không chọn ảnh mới, giữ lại ảnh cũ
    		            Movie.setImage(oldFile);
    		        }
    		    } catch (Exception e) {
    		        e.printStackTrace();
    		    }

                boolean isUpdated = movieService.updateMovie(Movie);
                if (isUpdated) {
                    resp.sendRedirect(req.getContextPath() + "/admin/movies");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/editMovie?id=" + MovieID + "&error=true");
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
        }
    }

    private void deleteMovie(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String MovieIDParam = req.getParameter("id");
        if (MovieIDParam != null && !MovieIDParam.isEmpty()) {
            try {
                int MovieID = Integer.parseInt(MovieIDParam);
                boolean isDeleted = movieService.deleteMovie(MovieID);
                if (isDeleted) {
                    resp.sendRedirect(req.getContextPath() + "/admin/movies");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/movies?error=deletefailed");
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/movies?error=invalidid");
        }
    }


//    private void searchMovies(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String keyword = req.getParameter("keyword");
//        String category = req.getParameter("category");
//        int page = 1;
//        int recordsPerPage = 4;
//        
//        // Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
//        if (req.getParameter("page") != null) {
//            page = Integer.parseInt(req.getParameter("page"));
//        }
//        
//        // Tìm kiếm các Movies với từ khóa, thể loại và phân trang
//        List<Movie> movies = movieService.searchMovies(keyword, category, (page - 1) * recordsPerPage, recordsPerPage);
//        
//        // Lấy tổng số records để tính số trang
//        int noOfRecords = movieService.getNoOfSearchResults(keyword, category);
//        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
//
//        // Đặt các thuộc tính vào request để truyền đến JSP
//        req.setAttribute("movies", movies);
//        req.setAttribute("noOfPages", noOfPages);
//        req.setAttribute("currentPage", page);
//        req.setAttribute("keyword", keyword);  // Để giữ lại từ khóa tìm kiếm
//        req.setAttribute("category", category); // Để giữ lại thể loại tìm kiếm
//        req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi
//
//        // Chuyển tiếp đến trang Movie.jsp
//        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Movie.jsp");
//        rd.forward(req, resp);
//    }

    private void searchMovies(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String[] categories = req.getParameterValues("category");  // Lấy danh sách các thể loại từ request
        int page = 1;
        int recordsPerPage = 4;

        // Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        // Nếu categories không được chọn (null hoặc chỉ có 'All'), tìm kiếm tất cả
        List<Movie> movies;
        int noOfRecords;
        if (categories == null || Arrays.asList(categories).contains("All")) {
            movies = movieService.searchMovies(keyword, (page - 1) * recordsPerPage, recordsPerPage);
            noOfRecords = movieService.getNoOfSearchResults(keyword);
        } else {
            movies = movieService.searchMovies(keyword, categories, (page - 1) * recordsPerPage, recordsPerPage);
            noOfRecords = movieService.getNoOfSearchResults(keyword, categories);
        }

        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        // Đặt các thuộc tính vào request để truyền đến JSP
        req.setAttribute("movies", movies);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        req.setAttribute("keyword", keyword);  // Để giữ lại từ khóa tìm kiếm
        req.setAttribute("category", categories != null ? String.join(",", categories) : "All");  // Để giữ lại thể loại tìm kiếm
        req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi

        // Chuyển tiếp đến trang Movie.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Movie.jsp");
        rd.forward(req, resp);
    }


    
    
    private void listMovies(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 4;
        
        // Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        
        // Lấy danh sách Movies với phân trang
        List<Movie> Movies = movieService.getMovies((page - 1) * recordsPerPage, recordsPerPage);
        
        // Lấy tổng số records để tính số trang
        int noOfRecords = movieService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        // Đặt các thuộc tính vào request để truyền đến JSP
        req.setAttribute("movies", Movies);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi


        // Chuyển tiếp đến trang Movie.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Movie.jsp");
        rd.forward(req, resp);
    }
    private String getChecksum(InputStream inputStream) throws IOException, NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] byteArray = new byte[1024];
		int bytesCount = 0;

		while ((bytesCount = inputStream.read(byteArray)) != -1) {
			digest.update(byteArray, 0, bytesCount);
		}

		byte[] bytes = digest.digest();
		Formatter formatter = new Formatter();
		for (byte b : bytes) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}
	
	private String getFileChecksum(File file) throws IOException, NoSuchAlgorithmException {
		try (FileInputStream fis = new FileInputStream(file)) {
			return getChecksum(fis);
		}
	}

	private String getInputStreamChecksum(InputStream inputStream) throws IOException, NoSuchAlgorithmException {
		return getChecksum(inputStream);
	}

	private void handleImageUpload(HttpServletRequest req, Movie Movie, String uploadPath) {
		String fname = "";
		File uploadDir = new File(uploadPath);
		System.out.print(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			Part part = req.getPart("images");
			if (part.getSize() > 0) {
				String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				File existingFile = new File(uploadPath + "/" + filename);

				if (existingFile.exists()) {
					// Ảnh đã tồn tại, kiểm tra nội dung
					String existingFileHash = getFileChecksum(existingFile);
					String newFileHash = getInputStreamChecksum(part.getInputStream());

					if (existingFileHash.equals(newFileHash)) {
						// Nội dung giống nhau, ghi đè
						fname = filename;
					} else {
						// Nội dung khác nhau, đổi tên ảnh mới
						fname = System.currentTimeMillis() + "_" + filename;
					}
				} else {
					// Ảnh chưa tồn tại, dùng tên gốc
					fname = filename;
				}
				// Lưu trữ ảnh
				part.write(uploadPath + "/" + fname);
				Movie.setImage(fname);
			} else {
				// Nếu không upload ảnh, giữ ảnh cũ hoặc đặt ảnh mặc định
				Movie.setImage(
						"https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
