package com.cinema.controllers.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.cinema.configs.PaymentConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/paymentstatus")
public class PaymentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 // Lấy tất cả các tham số từ URL
        Map<String, String> vnp_Params = new HashMap<>();
        req.getParameterMap().forEach((key, value) -> {
            vnp_Params.put(key, value[0]);
        });

        // Kiểm tra chữ ký hash (bảo mật)
        String vnp_SecureHash = vnp_Params.remove("vnp_SecureHash");
        String generatedHash = PaymentConfig.hashAllFields(vnp_Params); // Sử dụng hàm hashAllFields đã xây dựng trước đó
        // Kiểm tra mã phản hồi từ VNPay
        String responseCode = vnp_Params.get("vnp_ResponseCode");
        if ("00".equals(responseCode)) {
            // Thanh toán thành công
            String orderId = vnp_Params.get("vnp_TxnRef");
            String transactionNo = vnp_Params.get("vnp_TransactionNo");
            String bankCode = vnp_Params.get("vnp_BankCode");
            String amount = vnp_Params.get("vnp_Amount");
            String payDate = vnp_Params.get("vnp_PayDate");

            // Lưu vào cơ sở dữ liệu (ví dụ với JDBC hoặc Hibernate)
//            saveTransactionToDB(orderId, transactionNo, bankCode, amount, payDate);

            // Chuyển hướng tới JSP hiển thị kết quả
            req.setAttribute("vnp_Params", vnp_Params);
            req.getRequestDispatcher("/views/user/payment-status.jsp").forward(req, resp);
        } else {
            // Thanh toán thất bại
            req.setAttribute("errorMessage", "Payment failed with Response Code: " + responseCode);
            req.getRequestDispatcher("/views/user/payment-status.jsp").forward(req, resp);
        }
	}
	
}
