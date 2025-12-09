<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Travela</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<body>

<style>
  .password-wrapper {
        position: relative;
    }
    .password-toggle {
        position: absolute;
        left: 75%;
        top: 59.5%;
        transform: translateY(-50%);
        background: none;
        border: none;
        color: #6c757d;
        font-size: 25px;
        cursor: pointer;
        z-index: 3;
        padding: 0 20px;
    }
    /* Add padding to input to make room for the icon */
    .password-wrapper input {
        padding-left: 40px !important;  /* Adjust this value as needed */
    }

</style>

<%@ include file="./inc/header.jsp" %>

<div class="container py-5" style="min-height: 60vh;">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow border-0">
                <div class="card-body p-4 p-lg-5">
                    <h3 class="mb-4 text-center text-primary">Đăng ký</h3>
                    <form method="post" action="${pageContext.request.contextPath}/RegisterServlet">
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="phone" name="phone">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                             <input type="password" class="form-control" id="registerPassword" name="password" placeholder="Mật khẩu" required>
                                <button type="button" class="password-toggle" onclick="togglePassword('registerPassword', this)">
                                    <i class="bi bi-eye"></i>
                                </button>
                        </div>
                        <div class="mb-3">
                            <label for="confirm" class="form-label">Nhập lại mật khẩu</label>
                             <input type="password" class="form-control" id="confirmPassword" name="confirm" placeholder="Xác nhận mật khẩu" required>
                                <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                                    <i class="bi bi-eye"></i>
                                </button>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 rounded-pill py-2">Đăng ký</button>
                    </form>
                    <hr class="my-4">
                    <p class="mb-0 text-center">Đã có tài khoản? <a href="${pageContext.request.contextPath}/LoginServlet">Đăng nhập</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="./inc/footer.jsp" %>

  <script>
          function togglePassword(inputId, button) {
              const input = document.getElementById(inputId);
              const icon = button.querySelector('i');

              if (input.type === 'password') {
                  input.type = 'text';
                  icon.classList.remove('bi-eye');
                  icon.classList.add('bi-eye-slash');
              } else {
                  input.type = 'password';
                  icon.classList.remove('bi-eye-slash');
                  icon.classList.add('bi-eye');
              }
          }
          </script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
