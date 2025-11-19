<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Register - Travela</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    </head>

    <body>

        <%@include file="./inc/header.jsp" %>

        <div class="container py-5" style="min-height: 60vh;">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow border-0">
                        <div class="card-body p-4 p-lg-5">
                            <h3 class="mb-4 text-center text-primary">Đăng ký</h3>
                            <form method="post" action="${pageContext.request.contextPath}/register">
                                <div class="mb-3">
                                    <label for="fullname" class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" id="fullname" name="fullname" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 rounded-pill py-2">Đăng ký</button>
                            </form>
                            <hr class="my-4">
                            <p class="mb-0 text-center">Đã có tài khoản? <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- Footer Start -->
                <%@include file="./inc/footer.jsp" %>
                <!-- Footer End -->

                <!-- Copyright Start -->
                <div class="container-fluid copyright text-body py-4">
                    <div class="container">
                        <div class="row g-4 align-items-center">
                            <div class="col-md-6 text-center text-md-end mb-md-0">
                                <i class="fas fa-copyright me-2"></i><a class="text-white" href="#">Your Site Name</a>, All right reserved.
                            </div>
                            <div class="col-md-6 text-center text-md-start">
                                <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                                <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                                <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                Designed By <a class="text-white" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Copyright End -->

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i class="fa fa-arrow-up"></i></a>


        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>

</html>

