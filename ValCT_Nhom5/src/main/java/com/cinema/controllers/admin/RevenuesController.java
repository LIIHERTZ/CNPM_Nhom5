package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cinema.services.IPaymentService;
import com.cinema.services.impl.PaymentServiceImpl;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/admin/revenues-statics")
public class RevenuesController  extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String dateValue = request.getParameter("dateValue");
			String dateType = request.getParameter("dateType");
			System.out.println("loaddddddddddddddd");
			IPaymentService payService = new PaymentServiceImpl();
			if (dateValue != null && !dateValue.isEmpty() && dateType != null && !dateType.isEmpty())
			{
				List<Object[]> movieResults = payService.getMovieStatisticsByDate(dateValue,dateType);
				List<Object[]> popcornResults = payService.getPopCornStatisticsByDate(dateValue,dateType);
				//lay data cho chart
				List<String> movieNameList = new ArrayList<>();
				List<Double> movieNameRevenueList = new ArrayList<>();
				List<Double> movieNameAmountList = new ArrayList<>();
				for (Object[] result : movieResults) {
				    String movieName = (String) result[0]; // Cột tên movie
				    Double revenue = (Double) result[2];   // Cột doanh thu
				    Double amount = (Double)result[1];
				    
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
				    Double amount = (Double)result[1];
				    
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
				
				
				
				 request.setAttribute("chartDataPopCorn", jsonChartDataPopcorn);
				  request.setAttribute("chartDataMovie", jsonChartData);
				    request.setAttribute("movieRevenues", movieResults);
				    request.setAttribute("popcornRevenues", popcornResults);
				    
			}
	        // Forward đến JSP
	        request.getRequestDispatcher("/views/admin/revenues/revenue-statics.jsp").forward(request, response);
		}
}
