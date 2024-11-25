<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>

<body>
<section class="account-section bg_img" data-background="assets/images/account/account-bg.jpg">
 <style>
        body {
    background-color: #0b112b; /* Nền tối */
    color: #ffffff; /* Màu chữ mặc định */
}

.account-section {
    padding: 50px 0;
    background-color: transparent; /* Giữ trong suốt để phù hợp với background */
}

.sidebar {
    background: rgba(15, 15, 35, 0.9); /* Nền sidebar xanh đen với độ trong suốt */
    color: #dcdcdc; /* Màu chữ xám nhạt */
    border-radius: 10px;
    padding: 20px;
}

.sidebar h2 {
    font-size: 20px;
    color: #fbc531; /* Màu nhấn vàng */
}

.sidebar ul {
    padding: 0;
    list-style: none;
}

.sidebar ul li a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #dcdcdc; /* Màu chữ xám nhạt */
    transition: background-color 0.3s, color 0.3s;
    border-radius: 5px;
}

.sidebar ul li a:hover,
.sidebar ul li a.active {
    background: #fbc531; /* Nền vàng nhấn khi hover */
    color: #0b112b; /* Chữ xanh đen để tương phản */
}

.content-section {
    display: none;
    background: rgba(15, 15, 35, 0.9); /* Màu xanh đen nhẹ trong suốt */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Đổ bóng mềm */
}

.content-section.active {
    display: block;
}

.form-group label {
    font-weight: bold;
    color: #fbc531; /* Nhấn label màu vàng */
}

.form-control {
    background-color: #1e233b; /* Nền ô nhập màu xanh đậm */
    color: #ffffff; /* Chữ trắng */
    border: 1px solid #2c3e50; /* Viền màu xanh đen */
}

.form-control:focus {
    border-color: #fbc531; /* Viền nhấn màu vàng khi focus */
    background-color: #1e233b; /* Giữ nền khi focus */
    color: #ffffff;
}

.btn-primary {
    background-color: #fbc531;
    border-color: #fbc531;
    color: #0b112b; /* Chữ tương phản */
}

.btn-primary:hover {
    background-color: #e1a800; /* Vàng đậm khi hover */
    border-color: #e1a800;
}

.alert {
    margin-bottom: 20px;
    padding: 15px;
    border-radius: 5px;
}
.alert-success {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}
.alert-danger {
    color: #721c24;
    background-color: #f8d7da;
    border-color: #f5c6cb;
}
 </style>
 
    
        <div class="container mt-5">
            <div class="row">
                <!-- Sidebar Navigation -->
                <div class="col-md-3">
                    <div class="sidebar">
                        <h2 style="visibility: hidden;">dhsau</h2>
                        <h2>Account</h2>
						<ul class="nav flex-column">
							<li><a href="#"
								onclick="showContent('account-details'); return false;">Account
									Details</a></li>
							<li><a
								href="${pageContext.request.contextPath}/userTransaction?personId=${person.perID}">
									Transaction History </a></li>
							
						</ul>
					</div>
                </div>

                <!-- Main Content Area -->
                <div class="col-md-9">

                    <!-- Display Success or Error Message -->
                    <c:if test="${not empty sessionScope.successMessage}">
                        <div class="alert alert-success" role="alert">
                            ${sessionScope.successMessage}
                        </div>
                        <c:remove var="successMessage" scope="session" />
                    </c:if>

                    <c:if test="${not empty requestScope.error}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                        </div>
                    </c:if>

                    <!-- Account Details Content -->
                    <div id="account-details" class="content-section active">
                    	<h2 style="visibility: hidden;">dhsau</h2>
                        <h3>Account Details</h3>
                        <form id="account-details-form" method="post" action="${pageContext.request.contextPath}/userProfile/update">
                            <input type="hidden" name="action" value="updateProfile">
                            <input type="hidden" name="id" value="${person.perID}">

                            <!-- User Name -->
                            <div class="form-group">
                                <label for="user-name"><i class="fas fa-user"></i> User Name</label>
                                <input type="text" class="form-control icon-input" id="fullName" name="fullName" value="${person.fullName}">
                            </div>

                            <!-- Date of Birth -->
                            <div class="form-group">
                                <label for="user-dob"><i class="fas fa-birthday-cake"></i> Date of Birth</label>
                                <input type="date" class="form-control icon-input" id="birthDate" name="birthDate" value="${formattedBirthDate}">
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label for="user-email"><i class="fas fa-envelope"></i> Email</label>
                                <input type="email" class="form-control icon-input" id="email" name="email" value="${person.email}">
                            </div>

                            <!-- Phone Number -->
                            <div class="form-group">
                                <label for="user-phone"><i class="fas fa-phone-alt"></i> Phone Number</label>
                                <input type="tel" class="form-control icon-input" id="phone" name="phone" value="${person.phone}">
                            </div>

                            <!-- Role -->
                            <div class="form-group">
                                <label for="user-role"><i class="fas fa-user-tag"></i> Role</label>
                                <input type="text" class="form-control icon-input" id="role" name="role" value="${person.role}">
                            </div>

                            <!-- Gender -->
                            <div class="form-group">
                                <label for="user-gender"><i class="fas fa-venus-mars"></i> Gender</label>
                                <select class="form-control icon-input" id="gender" name="gender">
                                    <option value="1" ${person.gender == 1 ? 'selected' : ''}>Male</option>
                                    <option value="0" ${person.gender == 0 ? 'selected' : ''}>Female</option>
                                </select>
                            </div>

                            <!-- Update Button -->
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>

                    <!-- Transaction History Content -->
                    <div id="transaction-history" class="content-section">
                        <c:if test="${param.action == 'transaction'}">
                            <li><a
								href="${pageContext.request.contextPath}/userTransaction">Booking History</a>
							</li>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- JavaScript -->
    <script>
        // Function to show content based on the contentId
        function showContent(contentId) {
            const sections = document.querySelectorAll('.content-section');
            sections.forEach(section => {
                section.style.display = 'none';
            });

            const selectedSection = document.getElementById(contentId);
            if (selectedSection) {
                selectedSection.style.display = 'block';
            }

            const links = document.querySelectorAll('.sidebar ul li a');
            links.forEach(link => {
                link.classList.remove('active');
            });
            event.target.classList.add('active');
        }

        document.addEventListener('DOMContentLoaded', () => {
            showContent('account-details');
        });

        document.getElementById('account-details-form').addEventListener('submit', function(event) {
            let isValid = true;

            // Kiểm tra tên (không chứa số)
            const nameInput = document.getElementById('fullName');
            const nameRegex = /^[\p{L}\s]+$/u; // Chỉ chứa chữ Unicode và khoảng trắng
            if (!nameRegex.test(nameInput.value)) {
                alert("Tên không được chứa số hoặc ký tự đặc biệt.");
                isValid = false;
            }

            // Kiểm tra email (phải có ký tự '@')
            const emailInput = document.getElementById('email');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Kiểm tra email định dạng
            if (!emailRegex.test(emailInput.value)) {
                alert("Vui lòng nhập địa chỉ email hợp lệ.");
                isValid = false;
            }

            // Kiểm tra số điện thoại (không có chữ)
            const phoneInput = document.getElementById('phone');
            const phoneRegex = /^[0-9]+$/; // Chỉ chứa số
            if (!phoneRegex.test(phoneInput.value)) {
                alert("Số điện thoại chỉ được chứa chữ số.");
                isValid = false;
            }

            // Ngăn không cho form gửi nếu không hợp lệ
            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modernizr-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/odometer.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/viewport.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/nice-select.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>
