<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>

<body>
    <section class="account-section bg_img" data-background="assets/images/account/account-bg.jpg">
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
							<li><a href="#"
								onclick="showContent('vouchers'); return false;">Vouchers</a></li>
							<li><a href="#"
								onclick="showContent('coupons'); return false;">Coupons</a></li>
							<li><a
								href="${pageContext.request.contextPath}/userTransaction?personId=${person.perID}">
									Transaction History </a></li>
						</ul>
					</div>
                </div>

                <!-- Main Content Area -->
                <div class="col-md-9">

                    <!-- Account Details Content -->
                    <div id="account-details" class="content-section">
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

                    <!-- Vouchers Content -->
                    <div id="vouchers" class="content-section">
                        <h3>Vouchers</h3>
                        <p>Your vouchers information goes here.</p>
                    </div>

                    <!-- Coupons Content -->
                    <div id="coupons" class="content-section">
                        <h3>Coupons</h3>
                        <p>Your coupons information goes here.</p>
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
    </script>

    <!-- Scripts -->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/modernizr-3.6.0.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/isotope.pkgd.min.js"></script>
    <script src="assets/js/magnific-popup.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/countdown.min.js"></script>
    <script src="assets/js/odometer.min.js"></script>
    <script src="assets/js/viewport.jquery.js"></script>
    <script src="assets/js/nice-select.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>
