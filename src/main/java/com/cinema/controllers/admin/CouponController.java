package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.cinema.entity.Coupon;
import com.cinema.entity.Person;
import com.cinema.entity.PopCorn;
import com.cinema.services.ICouponService;
import com.cinema.services.impl.CouponServiceImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CouponController", urlPatterns = {"/admin/coupons", "/admin/coupons/save", "/admin/coupons/add",
        "/admin/coupons/edit", "/admin/coupons/update", "/admin/coupons/delete"})
public class CouponController extends HttpServlet {
    ICouponService couponService = new CouponServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("person") != null) {
            Person person = (Person) session.getAttribute("person");

            if (person.getRole().toLowerCase().contains("admin")) {
                String action = request.getServletPath();
                switch (action) {
                    case "/admin/coupons/add":
                        request.getRequestDispatcher("/views/admin/coupon/coupon-add.jsp").forward(request, response);
                        break;
                    case "/admin/coupons/edit":
                        loadCouponForEdit(request, response); // Load category data for edit
                        break;
                    default:
                        // Lấy thông tin phân trang từ tham số yêu cầu
                        //int page = Integer.parseInt(request.getParameter("page"));
                        int page = 1;
                        int pageSize = 5;
                        String searchValue = request.getParameter("searchQuery");
                        if (request.getParameter("pageNumber") != null && request.getParameter("pageSize") != null) {
                            page = Integer.parseInt(request.getParameter("pageNumber"));
                            pageSize = Integer.parseInt(request.getParameter("pageSize"));
                        }


                        // Lấy danh sách sản phẩm và tổng số trang
                        List<Coupon> coupons = couponService.getCoupons(page, pageSize, searchValue);
                        Long totalPages = couponService.getTotalPages(pageSize, searchValue);
                        Long couponTotal = couponService.countTotalCoupons(searchValue);
                        // Đưa dữ liệu vào request để hiển thị ở JSP
                        request.setAttribute("couponTotal", couponTotal);
                        request.setAttribute("coupons", coupons);
                        request.setAttribute("currentPage", page);
                        request.setAttribute("totalPages", totalPages);
                        request.setAttribute("pageSize", pageSize);
                        request.setAttribute("pageNumber", page);
                        request.setAttribute("searchQuery", searchValue);

                        // Forward đến JSP
                        request.getRequestDispatcher("/views/admin/coupon/coupon-list.jsp").forward(request, response);
                        break;
                }
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/signin");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();

        switch (action) {
            case "/admin/coupons/save":
                addCoupon(req, resp);
                break;
            case "/admin/coupons/update":
                updateCoupon(req, resp);
                break;
            case "/admin/coupons/delete":
                deleteCoupon(req, resp);
                break;
            default:
                resp.sendRedirect("admin/coupons");
                break;
        }
    }


    private void addCoupon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Coupon coupon = new Coupon();
        coupon.setCouponName(request.getParameter("couponName"));
        coupon.setCouponType(request.getParameter("couponType"));
        coupon.setCouponValue(Double.parseDouble(request.getParameter("couponValue")));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;
        try {
            startDate = formatter.parse(request.getParameter("startDate"));
            endDate = formatter.parse(request.getParameter("endDate"));
            coupon.setStartDate(startDate);
            coupon.setEndDate(endDate);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        couponService.insertCoupon(coupon);
        response.sendRedirect(request.getContextPath() + "/admin/coupons");
    }

    private void updateCoupon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int couponId = Integer.parseInt(request.getParameter("couponID"));
        Coupon coupon = couponService.getOneCoupon(couponId);

        if (coupon != null) {
            coupon.setCouponName(request.getParameter("couponName"));
            coupon.setCouponType(request.getParameter("couponType"));
            coupon.setCouponValue(Double.parseDouble(request.getParameter("couponValue")));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate;
            Date endDate;
            try {
                startDate = formatter.parse(request.getParameter("startDate"));
                endDate = formatter.parse(request.getParameter("endDate"));
                coupon.setStartDate(startDate);
                coupon.setEndDate(endDate);
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        couponService.updateCoupon(coupon);

        response.sendRedirect(request.getContextPath() + "/admin/coupons");

    }

    private void loadCouponForEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String couponIdParam = request.getParameter("couponID");
        int couponId = Integer.parseInt(couponIdParam);
        Coupon coupon = couponService.getOneCoupon(couponId);

        if (coupon != null) {
            request.setAttribute("coupon", coupon);
            request.getRequestDispatcher("/views/admin/coupon/coupon-edit.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/coupons");
        }
    }

    private void deleteCoupon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String couponIdParam = request.getParameter("couponID");
        int couponId = Integer.parseInt(couponIdParam);
        Coupon coupon = couponService.getOneCoupon(couponId);
        try {
            couponService.deleteCoupon(coupon);
            // Trả về phản hồi cho client
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\": \"success\"}");
            response.sendRedirect(request.getContextPath() + "/admin/coupons");

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Có lỗi xảy ra khi xóa coupon.\"}");
            e.printStackTrace();
        }
    }
}