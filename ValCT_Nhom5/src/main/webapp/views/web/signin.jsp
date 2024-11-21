<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<section class="account-section bg_img" data-background="${URL}assets/images/account/account-bg.jpg">
        <div class="container">
            <div class="padding-top padding-bottom">
                <div class="account-area">
                    <div class="section-header-3">
                        <span class="cate">hello</span>
                        <h2 class="title">welcome back</h2>
                    </div>
                    <form action="/ValCT_Nhom5/signin" method="post" class="account-form">
                        <div class="form-group">
                            <label for="email2">Email<span>*</span></label>
                            <input type="text" placeholder="Enter Your Email" id ="email2" value="${email}" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="pass3">Password<span>*</span></label>
                            <input type="password" placeholder="Password" id="pass3" value="${password}" name="password" required>
                        </div>
                        <div class="form-group checkgroup">
                            <input type="checkbox" id="bal2" required checked>
                            <label for="bal2">remember password</label>
                            <a href="${pageContext.request.contextPath}/forgetpass" class="forget-pass">Forget Password</a>
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" value="log in">
                        </div>
                    </form>
                    <div class="option">
                        Don't have an account? <a href="/FurSPS_Nhom5/signup">sign up now</a>
                    </div>
                    <div class="or"><span>Or</span></div>
                    <ul class="social-icons">
                        <li>
                            <a href="#0">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#0" class="active">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#0">
                                <i class="fab fa-google"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- ==========Sign-In-Section========== -->


    <script src="${URL}assets/js/jquery-3.3.1.min.js"></script>
    <script src="${URL}assets/js/modernizr-3.6.0.min.js"></script>
    <script src="${URL}assets/js/plugins.js"></script>
    <script src="${URL}assets/js/bootstrap.min.js"></script>
    <script src="${URL}assets/js/isotope.pkgd.min.js"></script>
    <script src="${URL}assets/js/magnific-popup.min.js"></script>
    <script src="${URL}assets/js/owl.carousel.min.js"></script>
    <script src="${URL}assets/js/wow.min.js"></script>
    <script src="${URL}assets/js/countdown.min.js"></script>
    <script src="${URL}assets/js/odometer.min.js"></script>
    <script src="${URL}assets/js/viewport.jquery.js"></script>
    <script src="${URL}assets/js/nice-select.js"></script>
    <script src="${URL}assets/js/main.js"></script>
</body>
</html>