package com.cinema.controllers.admin;

import com.cinema.entity.Person;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.List;

import com.cinema.entity.NewsOrDiscount;
import com.cinema.services.*;
import com.cinema.services.impl.NewsOrDiscountServiceImpl;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/adminnewsOrDiscounts", "/adminnewsOrDiscountadd", "/adminnewsOrDiscountinsert",
		"/adminnewsOrDiscountedit", "/adminnewsOrDiscountupdate", "/adminnewsOrDiscountdelete",
		"/adminnewsOrDiscountsearch" })
public class NewsOrDiscountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	INewsOrDiscountService newsOrDiscountService = new NewsOrDiscountServiceImpl();

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

	private void handleImageUpload(HttpServletRequest req, NewsOrDiscount newsOrDiscount, String uploadPath) {
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
				newsOrDiscount.setImages(fname);
			} else {
				// Nếu không upload ảnh, giữ ảnh cũ hoặc đặt ảnh mặc định
				newsOrDiscount.setImages(
						"https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("person") != null) {
			Person person = (Person) session.getAttribute("person");

			if (person.getRole().toLowerCase().contains("admin")) {
				String url = req.getRequestURI();

				if (url.contains("newsOrDiscounts")) {

					String searchKeyword = req.getParameter("search");
					int page = 0;
					int pageSize = 5; // Số item trên mỗi trang, có thể tùy chỉnh

					try {
						page = Integer.parseInt(req.getParameter("page"));
					} catch (NumberFormatException e) {
						// Mặc định page = 0 nếu không truyền hoặc lỗi định dạng
					}

					if (searchKeyword != null && !searchKeyword.isEmpty()) {
						// Tìm kiếm
						List<NewsOrDiscount> searchResults = newsOrDiscountService.findByNewsOrDiscountname(searchKeyword, page, pageSize);

						// Tính số trang
						int totalItems = newsOrDiscountService.countBySearch(searchKeyword); // Phương thức đếm kết quả tìm kiếm
						int totalPages = (int) Math.ceil((double) totalItems / pageSize);

						req.setAttribute("listNewsOrDiscount", searchResults);
						req.setAttribute("totalPages", totalPages);
						req.setAttribute("currentPage", page);
					} else {
						// Phân trang
						List<NewsOrDiscount> pagedResults = newsOrDiscountService.findAll(page, pageSize);
						int totalItems = newsOrDiscountService.count();
						int totalPages = (int) Math.ceil((double) totalItems / pageSize);

						req.setAttribute("listNewsOrDiscount", pagedResults);
						req.setAttribute("totalPages", totalPages);
						req.setAttribute("currentPage", page);
					}


					req.getRequestDispatcher("/views/admin/newsordiscount.jsp").forward(req, resp);
				} else if (url.contains("newsOrDiscountadd")) {
					req.getRequestDispatcher("/views/admin/newsordiscount-add.jsp").forward(req, resp);
				} else if (url.contains("newsOrDiscountedit")) {
					int id = Integer.parseInt(req.getParameter("id"));
					NewsOrDiscount newsOrDiscount = newsOrDiscountService.findById(id);
					req.setAttribute("newsOrDiscount", newsOrDiscount);
					req.getRequestDispatcher("/views/admin/newsordiscount-edit.jsp").forward(req, resp);
				} else if (url.contains("newsOrDiscountdelete")) {
					String id = req.getParameter("id");
					try {
						newsOrDiscountService.delete(Integer.parseInt(id));
					} catch (Exception e) {
						e.printStackTrace();
					}
					resp.sendRedirect(req.getContextPath() + "/adminnewsOrDiscounts");
				}
				return;
			}
		}
		resp.sendRedirect(req.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String uploadPath = "D:/images";

		if (url.contains("newsOrDiscountinsert")) {
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String detail = req.getParameter("detail");
			String author = req.getParameter("author");
			String dateString = req.getParameter("date");
			Date date = null;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
			} catch (Exception e) {
				e.printStackTrace();
			}

			NewsOrDiscount newsOrDiscount = new NewsOrDiscount();
			newsOrDiscount.setTitle(title);
			newsOrDiscount.setDescription(description);
			newsOrDiscount.setDetail(detail);
			newsOrDiscount.setAuthor(author);
			newsOrDiscount.setDate(date);

			String oldFile = newsOrDiscount.getImages();
			handleImageUpload(req, newsOrDiscount, uploadPath);
			if (newsOrDiscount.getImages() == null || newsOrDiscount.getImages().isEmpty() || newsOrDiscount.getImages().equals("https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")) {
                newsOrDiscount.setImages(oldFile);
            }
			
			newsOrDiscountService.insert(newsOrDiscount);
			resp.sendRedirect(req.getContextPath() + "/adminnewsOrDiscounts");

		} else if (url.contains("update")) {
			int newsOrDiscountId = Integer.parseInt(req.getParameter("newsID"));
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String detail = req.getParameter("detail");
			String author = req.getParameter("author");
			String dateString = req.getParameter("date");
			Date date = null;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
			} catch (Exception e) {
				e.printStackTrace();
			}

			NewsOrDiscount newsOrDiscount = new NewsOrDiscount();
			newsOrDiscount.setNewsID(newsOrDiscountId);
			newsOrDiscount.setTitle(title);
			newsOrDiscount.setDescription(description);
			newsOrDiscount.setDetail(detail);
			newsOrDiscount.setAuthor(author);
			newsOrDiscount.setDate(date);

			String oldFile = req.getParameter("oldImage");
			
			try {
		        Part part = req.getPart("images");
		        if (part != null && part.getSize() > 0) {
		            // Người dùng đã chọn ảnh mới
		            handleImageUpload(req, newsOrDiscount, uploadPath);
		        } else {
		            // Người dùng không chọn ảnh mới, giữ lại ảnh cũ
		            newsOrDiscount.setImages(oldFile);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
						
			newsOrDiscountService.update(newsOrDiscount);
			resp.sendRedirect(req.getContextPath() + "/adminnewsOrDiscounts");
		}
	}
}