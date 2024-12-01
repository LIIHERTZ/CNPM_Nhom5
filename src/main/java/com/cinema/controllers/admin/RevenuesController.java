package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cinema.services.*;
import com.cinema.entity.*;
import com.cinema.services.impl.*;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/admin/revenues-statics")
public class RevenuesController extends HttpServlet {
    IMovieService movieService = new MovieServiceImpl();
    ICinemaService cinemaService = new CinemaServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("person") != null) {
            Person person = (Person) session.getAttribute("person");

            if (person.getRole().toLowerCase().contains("admin")) {
                String dateValue = request.getParameter("dateValue");
                String dateType = request.getParameter("dateType");
                IPaymentService payService = new PaymentServiceImpl();
                if (dateValue != null && !dateValue.isEmpty() && dateType != null && !dateType.isEmpty()) {
                    List<Object[]> movieResults = payService.getMovieStatisticsByDate(dateValue, dateType);
                    List<Object[]> popcornResults = payService.getPopCornStatisticsByDate(dateValue, dateType);
                    //lay data cho chart
                    List<String> movieNameList = new ArrayList<>();
                    List<Double> movieNameRevenueList = new ArrayList<>();
                    List<Double> movieNameAmountList = new ArrayList<>();
                    for (Object[] result : movieResults) {
                        String movieName = (String) result[0]; // Cột tên movie
                        Double revenue = (Double) result[2];   // Cột doanh thu
                        Double amount = (Double) result[1];

                        // Thêm movie và doanh thu vào danh sách
                        movieNameList.add(movieName);
                        movieNameRevenueList.add(revenue);
                        movieNameAmountList.add(amount);
                    }
                    String jsonChartData = new Gson().toJson(Map.of(
                            "movieNameList", movieNameList,
                            "movieNameRevenueList", movieNameRevenueList,
                            "movieNameAmountList", movieNameAmountList
                    ));
                    List<String> popcornNameList = new ArrayList<>();
                    List<Double> popcornNameRevenueList = new ArrayList<>();
                    List<Double> popcornNameAmountList = new ArrayList<>();
                    for (Object[] result : popcornResults) {
                        String popcornName = (String) result[0]; // Cột tên movie
                        Double revenue = (Double) result[2];   // Cột doanh thu
                        Double amount = (Double) result[1];

                        // Thêm movie và doanh thu vào danh sách
                        popcornNameList.add(popcornName);
                        popcornNameRevenueList.add(revenue);
                        popcornNameAmountList.add(amount);
                    }
                    String jsonChartDataPopcorn = new Gson().toJson(Map.of(
                            "popcornNameList", popcornNameList,
                            "popcornNameRevenueList", popcornNameRevenueList,
                            "popcornNameAmountList", popcornNameAmountList
                    ));
                    System.out.println("jsonChartDataPopcorn : " + jsonChartDataPopcorn);
                    System.out.println("popcornResults : " + popcornResults);


                    //set data cho chart movie, chart popcorn bên tab theo thoi gian
                    request.setAttribute("dateValue", dateValue);
                    request.setAttribute("dateType", dateType);
                    request.setAttribute("chartDataPopCorn", jsonChartDataPopcorn);
                    request.setAttribute("chartDataMovie", jsonChartData);
                    request.setAttribute("movieRevenues", movieResults);
                    request.setAttribute("popcornRevenues", popcornResults);

                }

                //Tab Movies
                String movieID = request.getParameter("movieID");

                List<Movie> movies = movieService.getAllMovie();
                request.setAttribute("movies", movies);
                String tab = request.getParameter("tab");

                if (movieID != null && !movieID.isEmpty() && tab != null && !tab.isEmpty()) {
                    // load danh sach movie len cho truong select (option-movie)

                    System.out.println("movieID" + movieID);
                    List<Object[]> CinemaRevenuesByMovieID = payService.getCinemaRevenuesByMovieID(movieID);
                    List<String> cinemaNameList = new ArrayList<>();
                    List<Double> revenueOfCinemaByMovieList = new ArrayList<>();
                    System.out.println("CinemaRevenuesByMovieID" + CinemaRevenuesByMovieID);
                    for (Object[] result : CinemaRevenuesByMovieID) {
                        String cinemaName = (String) result[0]; // Cột tên cinema
                        Double revenueOfCinemaByMovie = (Double) result[1];   // Cột doanh thu

                        // Thêm movie và doanh thu vào danh sách
                        cinemaNameList.add(cinemaName);
                        revenueOfCinemaByMovieList.add(revenueOfCinemaByMovie);
                    }
                    String jsonChartDataMovies = new Gson().toJson(Map.of(
                            "cinemaNameList", cinemaNameList,
                            "revenueOfCinemaByMovieList", revenueOfCinemaByMovieList
                    ));
                    request.setAttribute("movieID", movieID);
                    request.setAttribute("jsonChartDataMovies", jsonChartDataMovies);
                    request.setAttribute("CinemaRevenuesByMovieID", CinemaRevenuesByMovieID);
                }
                //Tab Regions
                String cinemaID = request.getParameter("cinemaID");
                List<Cinema> cinemas = cinemaService.getAllCinema();
                request.setAttribute("cinemas", cinemas);
                if (cinemaID != null && !cinemaID.isEmpty() && tab != null && !tab.isEmpty()) {
                    // load danh sach movie len cho truong select (option-movie)

                    List<Object[]> CustomerAmountAllCinema = payService.getCustomerAmountAllCinema();
                    List<String> cinemaNameList = new ArrayList<>();
                    List<Long> customerAmountList = new ArrayList<>();
                    System.out.println("CustomerAmountAllCinema" + CustomerAmountAllCinema);
                    for (Object[] result : CustomerAmountAllCinema) {
                        String cinemaName = (String) result[1]; // Cột tên cinema
                        Long customerAmount = (Long) result[2];   // Cột số lượng
                        System.out.println("cinemaName" + cinemaName);
                        System.out.println("customerAmount" + customerAmount);
                        // Thêm movie và doanh thu vào danh sách
                        cinemaNameList.add(cinemaName);
                        customerAmountList.add(customerAmount);

                    }
                    String jsonChartDataCinemas = new Gson().toJson(Map.of(
                            "cinemaNameList", cinemaNameList,
                            "customerAmountList", customerAmountList
                    ));
                    System.out.println("jsonChartDataCinemas" + jsonChartDataCinemas);
                    request.setAttribute("cinemaID", cinemaID);
                    request.setAttribute("jsonChartDataCinemas", jsonChartDataCinemas); // ve do thi
                    request.setAttribute("CustomerAmountAllCinema", CustomerAmountAllCinema);//data  hien thi cho table
                }

                // Forward đến JSP
                request.getRequestDispatcher("/views/admin/revenues/revenue-statics.jsp").forward(request, response);

                return;
            }
        }
		response.sendRedirect(request.getContextPath() + "/signin");
    }
}
