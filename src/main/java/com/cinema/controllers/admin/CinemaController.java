package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;
import com.cinema.entity.Cinema;
import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.services.ICinemaService;
import com.cinema.services.impl.CinemaServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/admin/addCinema", "/admin/showAddCinema", "/admin/editCinema", "/admin/deleteCinema",
		"/admin/searchCinema", "/admin/cinemas" })
public class CinemaController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ICinemaService cinemaService;

	@Override
	public void init() throws ServletException {
		super.init();
		cinemaService = new CinemaServiceImpl(); // Assume CinemaServiceImpl is the implementation class for handling
													// business logic
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getServletPath();

		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("person") != null) {
			Person person = (Person) session.getAttribute("person");

		    if (person.getRole().toLowerCase().contains("admin")) {

		    	switch (action) {
				case "/admin/editCinema":
					showEditCinemaForm(req, resp);
					break;
				case "/admin/deleteCinema":
					deleteCinema(req, resp);
					break;
				case "/admin/searchCinema":
					searchCinemas(req, resp);
					break;
				case "/admin/cinemas":
				default:
					listCinemas(req, resp);
					break;
				}
				return;
		    }
		}
		resp.sendRedirect(req.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getServletPath();
		switch (action) {
		case "/admin/addCinema":
			addCinema(req, resp);
			break;
		case "/admin/editCinema":
			editCinema(req, resp);
			break;
		case "/admin/deleteCinema":
			deleteCinema(req, resp); // Thêm dòng này để xử lý xóa bằng POST
			break;
		}
	}

//    private void showAddCinemaForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("showAddModal", true);
//        listCinemas(req, resp);
//    }

	private void showEditCinemaForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cinemaIDParam = req.getParameter("id");
		if (cinemaIDParam != null && !cinemaIDParam.isEmpty()) {
			try {
				int cinemaID = Integer.parseInt(cinemaIDParam);
				Cinema cinema = cinemaService.getCinemaById(cinemaID);
				if (cinema != null) {
					req.setAttribute("cinema", cinema);
					RequestDispatcher rd = req.getRequestDispatcher("/views/admin/EditCinema.jsp");
					rd.forward(req, resp);
				} else {
					resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=notfound");
				}
			} catch (NumberFormatException e) {
				resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
		}
	}

	private void addCinema(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("cinema_name");
		String address = req.getParameter("address");
		String location = req.getParameter("location"); // Lấy giá trị location
		int numRooms = Integer.parseInt(req.getParameter("num_rooms"));
		boolean status = Boolean.parseBoolean(req.getParameter("status"));

		Cinema cinema = new Cinema();
		cinema.setCinemaName(name);
		cinema.setAddress(address);
		cinema.setLocation(location); // Gán giá trị location
		cinema.setRoomCount(numRooms);
		cinema.setStatus(status);

		boolean isAdded = cinemaService.addCinema(cinema);
		if (isAdded) {
			resp.sendRedirect(req.getContextPath() + "/admin/cinemas");
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/showAddCinema?error=true");
		}
	}

	private void editCinema(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String cinemaIDParam = req.getParameter("id");
		if (cinemaIDParam != null && !cinemaIDParam.isEmpty()) {
			try {
				int cinemaID = Integer.parseInt(cinemaIDParam);
				String name = req.getParameter("cinema_name");
				String address = req.getParameter("address");
				String location = req.getParameter("location"); // Lấy giá trị location
				int numRooms = Integer.parseInt(req.getParameter("num_rooms"));
				boolean status = Boolean.parseBoolean(req.getParameter("status"));

				Cinema cinema = new Cinema();
				cinema.setCinemaID(cinemaID);
				cinema.setCinemaName(name);
				cinema.setAddress(address);
				cinema.setLocation(location); // Gán giá trị location
				cinema.setRoomCount(numRooms);
				cinema.setStatus(status);

				boolean isUpdated = cinemaService.updateCinema(cinema);
				if (isUpdated) {
					resp.sendRedirect(req.getContextPath() + "/admin/cinemas");
				} else {
					resp.sendRedirect(req.getContextPath() + "/admin/editCinema?id=" + cinemaID + "&error=true");
				}
			} catch (NumberFormatException e) {
				resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
		}
	}

	private void deleteCinema(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String cinemaIDParam = req.getParameter("id");
		if (cinemaIDParam != null && !cinemaIDParam.isEmpty()) {
			try {
				int cinemaID = Integer.parseInt(cinemaIDParam);
				boolean isDeleted = cinemaService.deleteCinema(cinemaID);
				if (isDeleted) {
					resp.sendRedirect(req.getContextPath() + "/admin/cinemas");
				} else {
					resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=deletefailed");
				}
			} catch (NumberFormatException e) {
				resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/cinemas?error=invalidid");
		}
	}

//    private void searchCinemas(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String keyword = req.getParameter("keyword");
//        List<Cinema> cinemas = cinemaService.searchCinemas(keyword);
//        req.setAttribute("cinemas", cinemas);
//        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Cinema.jsp");
//        rd.forward(req, resp);
//    }
//
//    private void listCinemas(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int page = 1;
//        int recordsPerPage = 5;
//        if (req.getParameter("page") != null) {
//            page = Integer.parseInt(req.getParameter("page"));
//        }
//        List<Cinema> cinemas = cinemaService.getCinemas((page - 1) * recordsPerPage, recordsPerPage);
//        int noOfRecords = cinemaService.getNoOfRecords();
//        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
//
//        req.setAttribute("cinemas", cinemas);
//        req.setAttribute("noOfPages", noOfPages);
//        req.setAttribute("currentPage", page);
//        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Cinema.jsp");
//        rd.forward(req, resp);
//    }
	private void searchCinemas(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String location = req.getParameter("location");
		System.out.println("Location from request: " + location);

		int page = 1;
		int recordsPerPage = 10;

		// Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}

//        // Tìm kiếm các cinemas với từ khóa và phân trang
//        List<Cinema> cinemas = cinemaService.searchCinemas(location , (page - 1) * recordsPerPage, recordsPerPage);
//        
//        // Lấy tổng số records để tính số trang
//        int noOfRecords = cinemaService.getNoOfSearchResults(location );

		List<Cinema> cinemas;
		int noOfRecords;

		// Nếu location là "All" hoặc không có giá trị, tìm kiếm tất cả các rạp
		if (location == null || location.equals("All")) {
			cinemas = cinemaService.getAllCinemas((page - 1) * recordsPerPage, recordsPerPage);
			noOfRecords = cinemaService.getTotalNumberOfCinemas();
		} else {
			// Tìm kiếm các cinemas với vị trí cụ thể và phân trang
			cinemas = cinemaService.searchCinemasByLocation(location, (page - 1) * recordsPerPage, recordsPerPage);
			noOfRecords = cinemaService.getNoOfSearchResults(location);
		}

		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

		// Đặt các thuộc tính vào request để truyền đến JSP
		req.setAttribute("cinemas", cinemas);
		req.setAttribute("noOfPages", noOfPages);
		req.setAttribute("currentPage", page);
		req.setAttribute("location", location); // Để giữ lại từ khóa tìm kiếm
		req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi

		// Chuyển tiếp đến trang Cinema.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Cinema.jsp");
		rd.forward(req, resp);
	}

	private void listCinemas(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int recordsPerPage = 10;

		// Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}

		// Lấy danh sách cinemas với phân trang
		List<Cinema> cinemas = cinemaService.getCinemas((page - 1) * recordsPerPage, recordsPerPage);

		// Lấy tổng số records để tính số trang
		int noOfRecords = cinemaService.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

		// Đặt các thuộc tính vào request để truyền đến JSP
		req.setAttribute("cinemas", cinemas);
		req.setAttribute("noOfPages", noOfPages);
		req.setAttribute("currentPage", page);
		req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi

		// Chuyển tiếp đến trang Cinema.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Cinema.jsp");
		rd.forward(req, resp);
	}

}
