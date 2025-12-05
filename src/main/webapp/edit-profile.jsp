<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chỉnh sửa hồ sơ - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
        .edit-profile-container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }
        
        .form-header {
            background: linear-gradient(135deg, #1a73e8, #1557b0);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .form-body {
            padding: 40px;
        }
        
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
        }
        
        .form-control {
            border-radius: 8px;
            border: 1px solid #dee2e6;
            padding: 12px 15px;
        }
        
        .form-control:focus {
            border-color: #1a73e8;
            box-shadow: 0 0 0 0.2rem rgba(26, 115, 232, 0.25);
        }
        
        .btn-save {
            background: #1a73e8;
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-save:hover {
            background: #1557b0;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Edit Profile Form Start -->
    <div class="container-xxl py-5">
        <div class="edit-profile-container">
            <div class="form-header">
                <h2 class="mb-0"><i class="fas fa-user-edit me-2"></i>Cập nhật thông tin cá nhân</h2>
            </div>
            
            <div class="form-body">
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <form method="post" action="${pageContext.request.contextPath}/account/edit">
                    <div class="mb-4">
                        <label for="fullname" class="form-label">
                            <i class="fas fa-user me-2 text-primary"></i>Họ và tên
                        </label>
                        <input type="text" class="form-control" id="fullname" name="fullname" 
                               value="${user.fullname}" required>
                    </div>
                    
                    <div class="mb-4">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope me-2 text-primary"></i>Email
                        </label>
                        <input type="email" class="form-control" id="email" name="email" 
                               value="${user.email}" required>
                    </div>
                    
                    <div class="mb-4">
                        <label for="phone" class="form-label">
                            <i class="fas fa-phone me-2 text-primary"></i>Số điện thoại
                        </label>
                        <input type="tel" class="form-control" id="phone" name="phone" 
                               value="${user.phone}" placeholder="Nhập số điện thoại">
                    </div>
                    
                    <div class="d-flex gap-3">
                        <button type="submit" class="btn btn-save flex-fill">
                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                        </button>
                        <a href="${pageContext.request.contextPath}/account" class="btn btn-outline-secondary flex-fill">
                            <i class="fas fa-times me-2"></i>Hủy
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Profile Form End -->

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
</body>
</html>
