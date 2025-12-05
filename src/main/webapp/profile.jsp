<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Hồ sơ cá nhân - GoViet</title>
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
    <style>
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #f8f9fa;
            --text-color: #202124;
            --border-color: #dadce0;
        }
        
        body {
            background-color: #f8f9fa;
            color: var(--text-color);
            font-family: 'Roboto', sans-serif;
        }
        
        .profile-container {
            max-width: 1000px;
            margin: 30px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            border: 1px solid #e9ecef;
        }
        
        .profile-header {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            color: #212529;
            padding: 40px 20px;
            text-align: center;
            position: relative;
            border-bottom: 1px solid #e9ecef;
        }
        
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
            margin: 0 auto 20px;
            display: block;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .profile-name {
            font-size: 28px;
            font-weight: 700;
            margin: 15px 0 10px;
            color: #212529;
        }
        
        .profile-role {
            background: #e9ecef;
            color: #495057;
            display: inline-block;
            padding: 6px 18px;
            border-radius: 20px;
            font-size: 15px;
            font-weight: 500;
            margin-top: 10px;
            border: 1px solid #dee2e6;
        }
        
        .profile-body {
            padding: 40px;
        }
        
        @media (max-width: 768px) {
            .profile-body {
                padding: 25px 15px;
            }
        }
        
        .profile-section {
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #343a40;
            margin-bottom: 25px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e9ecef;
            position: relative;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 50px;
            height: 2px;
            background: #1a73e8;
        }
        
        .info-item {
            display: flex;
            margin-bottom: 18px;
            padding: 12px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
            background: #f8f9fa;
            border-left: 3px solid #1a73e8;
        }
        
        .info-item:hover {
            background: #f1f3f5;
            transform: translateX(5px);
        }
        
        .info-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .info-label {
            min-width: 180px;
            font-weight: 600;
            color: #495057;
            display: flex;
            align-items: center;
        }
        
        .info-label i {
            margin-right: 10px;
            color: #1a73e8;
            width: 20px;
            text-align: center;
        }
        
        .info-value {
            flex: 1;
            color: #212529;
            font-weight: 500;
        }
        
        .btn-edit-profile {
            background-color: #1a73e8;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
            width: 100%;
            margin-bottom: 12px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-edit-profile i {
            margin-right: 8px;
        }
        
        .btn-edit-profile:hover {
            background-color: #1557b0;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin: 25px 0;
        }
        
        .stat-item {
            padding: 20px 15px;
            border-radius: 10px;
            background: #f8f9fa;
            transition: all 0.3s;
            border: 1px solid #e9ecef;
            text-align: center;
        }
        
        .stat-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-color: #dee2e6;
        }
        
        .stat-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .stat-value {
            font-size: 28px;
            font-weight: 700;
            color: #1a73e8;
            margin: 5px 0;
            line-height: 1.2;
        }
        
        .stat-label {
            font-size: 14px;
            color: #6c757d;
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            .profile-container {
                margin: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Profile Start -->
    <div class="container-xxl py-5">
        <div class="profile-container">
            <div class="profile-header">
                <c:choose>
                    <c:when test="${not empty user.avatar_url}">
                        <img src="${user.avatar_url}" alt="Avatar" class="profile-avatar">
                    </c:when>
                    <c:otherwise>
                        <div class="profile-avatar d-flex align-items-center justify-content-center bg-light text-primary" style="font-size: 48px;">
                            <i class="fas fa-user"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
                <h1 class="profile-name">${not empty user.fullname ? user.fullname : 'Chưa cập nhật'}</h1>
                <div class="profile-role">${user.role}</div>
            </div>
            
            <div class="profile-body">
                <div class="row">
                    <div class="col-md-8">
                        <div class="profile-section">
                            <h3 class="section-title">Thông tin cá nhân</h3>
                            <div class="info-item">
                                <div class="info-label"><i class="fas fa-id-card me-2"></i>Họ và tên</div>
                                <div class="info-value">${not empty user.fullname ? user.fullname : 'Chưa cập nhật'}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label"><i class="fas fa-envelope me-2"></i>Email</div>
                                <div class="info-value">${user.email}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label"><i class="fas fa-phone me-2"></i>Số điện thoại</div>
                                <div class="info-value">${not empty user.phone ? user.phone : 'Chưa cập nhật'}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label"><i class="fas fa-user-tag me-2"></i>Vai trò</div>
                                <div class="info-value">
                                    <span class="badge bg-primary">
                                        ${user.role}
                                    </span>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-label"><i class="fas fa-calendar-plus me-2"></i>Ngày tạo tài khoản</div>
                                <div class="info-value">
                                    <fmt:formatDate value="${user.created_at}" pattern="dd/MM/yyyy HH:mm" />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="profile-section">
                            <h3 class="section-title">Hành động</h3>
                            <div class="d-grid gap-2">
                                <a href="${pageContext.request.contextPath}/account/edit" class="btn btn-primary btn-edit-profile mb-2">
                                    <i class="fas fa-user-edit me-2"></i>Chỉnh sửa hồ sơ
                                </a>
                                <a href="${pageContext.request.contextPath}/account/change-password" class="btn btn-outline-primary mb-2">
                                    <i class="fas fa-key me-2"></i>Đổi mật khẩu
                                </a>
                                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                                </a>
                            </div>
                        </div>
                        
                        <div class="profile-section">
                            <h3 class="section-title">Thống kê</h3>
                            <div class="stats-container">
                                <div class="stat-item">
                                    <div class="stat-value">0</div>
                                    <div class="stat-label">Tour đã đặt</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-value">0</div>
                                    <div class="stat-label">Đánh giá</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Profile End -->

    <!-- Footer Start -->
    <%@include file="./inc/footer.jsp" %>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Back to top button
        var backToTopButton = document.querySelector('.back-to-top');
        if (backToTopButton) {
            window.addEventListener('scroll', function() {
                if (window.pageYOffset > 300) {
                    backToTopButton.style.display = 'block';
                } else {
                    backToTopButton.style.display = 'none';
                }
            });
            
            backToTopButton.addEventListener('click', function(e) {
                e.preventDefault();
                window.scrollTo({top: 0, behavior: 'smooth'});
            });
        }
    </script>
</body>
</html>