package com.cinema.controllers.user;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import com.cinema.entity.Person;
import com.cinema.services.IPersonService;
import com.cinema.services.impl.PersonServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/userProfile","/userProfile/update" })
public class UserProfileController extends HttpServlet{
	private static final long serialVersionUID = 4317368494648713183L;
	
	 private final IPersonService personService = new PersonServiceImpl();

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			if (session != null && session.getAttribute("person") != null) {

				Person person = (Person) session.getAttribute("person");

				if (!person.getRole().toLowerCase().contains("admin")) {

					if (session != null && session.getAttribute("person") != null) {
						// Lấy thông tin người dùng từ session
						person = (Person) session.getAttribute("person");
						if (person.getBirthDate() != null) {
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							String formattedBirthDate = sdf.format(person.getBirthDate());
							request.setAttribute("formattedBirthDate", formattedBirthDate);
						}


						// Gán thông tin người dùng vào request
						request.setAttribute("person", person);

						// Chuyển hướng đến trang User Profile
						request.getRequestDispatcher("/views/user/userprofile.jsp").forward(request, response);
					} else {
						// Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
						response.sendRedirect(request.getContextPath() + "/signin");
					}
					return;
				}
			}
			response.sendRedirect(request.getContextPath() + "/signin");
		}


	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	 HttpSession session = request.getSession(false);

	    	    if (session != null && session.getAttribute("person") != null) {
	    	        // Lấy thông tin người dùng từ session
	    	        Person person = (Person) session.getAttribute("person");

	    	        try {
	    	            // Lấy thông tin cập nhật từ form
	    	            String fullName = request.getParameter("fullName");
	    	            String email = request.getParameter("email");
	    	            String phone = request.getParameter("phone");
	    	            String genderParam = request.getParameter("gender");
	    	            String birthDateParam = request.getParameter("birthDate");

	    	            // Kiểm tra dữ liệu hợp lệ
	    	            if (fullName == null || !fullName.matches("^[\\p{L}\\s]+$")) {
	    	                throw new IllegalArgumentException("Tên không được chứa số hoặc ký tự đặc biệt.");
	    	            }

	    	            if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
	    	                throw new IllegalArgumentException("Email không hợp lệ.");
	    	            }
	    	            if (phone == null || !phone.matches("^[0-9]+$")) {
	    	                throw new IllegalArgumentException("Số điện thoại chỉ được chứa chữ số.");
	    	            }

	    	            // Cập nhật thông tin vào đối tượng person
	    	            person.setFullName(fullName);
	    	            person.setEmail(email);
	    	            person.setPhone(phone);
	    	            person.setGender("1".equalsIgnoreCase(genderParam) ? 1 : 0);
	    	            if (birthDateParam != null && !birthDateParam.isEmpty()) {
	    	                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	                person.setBirthDate(sdf.parse(birthDateParam));
	    	            }

	    	            // Gọi service để cập nhật thông tin trong database
	    	            personService.updatePerson(person);

	    	            // Cập nhật lại session với thông tin mới
	    	            session.setAttribute("person", person);
	    	            session.setAttribute("successMessage", "Cập nhật thông tin thành công!");
	    	            // Chuyển hướng về trang User Profile
	    	            response.sendRedirect(request.getContextPath() + "/userProfile");
	    	        } catch (IllegalArgumentException e) {
	    	            request.setAttribute("error", e.getMessage());
	    	            request.getRequestDispatcher("/views/user/userprofile.jsp").forward(request, response);
	    	        } catch (Exception e) {
	    	            e.printStackTrace();
	    	            // Thông báo lỗi và quay lại trang cập nhật
	    	            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật thông tin!");
	    	            request.getRequestDispatcher("/views/user/userprofile.jsp").forward(request, response);
	    	        }
	    	    } else {
	    	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	    	        response.sendRedirect(request.getContextPath() + "/signin");
	    	    }
	    }

}
