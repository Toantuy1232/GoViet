<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Đặt Tour - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="keywords" content="du lịch, đặt tour, ưu đãi, GoViet">
    <meta name="description" content="Đặt tour du lịch với ưu đãi hấp dẫn tại GoViet">

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
        /* Ensure the html and body take up full height */
        html {
            height: 100%;
        }
        
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        
        /* Main content should take up available space */
        main {
            flex: 1 0 auto;
            width: 100%;
            padding-bottom: 2rem;
        }
        
        /* Footer styles */
        .footer {
            flex-shrink: 0;
            width: 100%;
            background-color: #f8f9fa;
            padding: 1rem 0;
            margin-top: auto;
        }
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
        }
        main {
            flex: 1;
            padding-bottom: 60px; /* Space for footer */
        }
        .footer {
            margin-top: auto;
            width: 100%;
            position: relative;
            bottom: 0;
        }
        /* Dropdown styles */
        .dropdown-menu {
            display: block !important;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            margin-top: 0;
        }
        .show > .dropdown-menu {
            opacity: 1;
            visibility: visible;
            margin-top: 0.5rem;
        }
        .dropdown-item {
            padding: 0.5rem 1.5rem;
            display: flex;
            align-items: center;
            white-space: nowrap;
        }
        .dropdown-item i {
            width: 20px;
            margin-right: 10px;
            text-align: center;
        }
        .dropdown-divider {
            margin: 0.5rem 0;
        }
        .dropdown-header {
            padding: 0.5rem 1.5rem;
            font-size: 0.875rem;
            color: #6c757d;
            white-space: nowrap;
        }
        .dropdown-toggle::after {
            display: inline-block;
            margin-left: 0.255em;
            vertical-align: 0.255em;
            content: "";
            border-top: 0.3em solid;
            border-right: 0.3em solid transparent;
            border-bottom: 0;
            border-left: 0.3em solid transparent;
        }
        /* Ensure dropdowns appear above other content */
        .dropdown-menu {
            z-index: 1060;
        }
    </style>
</head>

<body>
    <%@include file="./inc/header.jsp" %>

    <%-- Check login status --%>
    <%
    HttpSession session = request.getSession(false);
    boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
    String username = isLoggedIn ? (String) session.getAttribute("username") : "";
    String email = isLoggedIn ? (String) session.getAttribute("email") : "";
    %>

    <!-- Main Content -->
    <main>
        <!-- Booking Section -->
        <div class="container-fluid booking py-5">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <h5 class="section-booking-title pe-3">Đặt Tour</h5>
                        <h1 class="text-white mb-4">Đặt Tour Trực Tuyến</h1>
                        <p class="text-white mb-4">Chào mừng bạn đến với dịch vụ đặt tour trực tuyến của GoViet. Chúng tôi cung cấp các gói du lịch chất lượng với giá cả hợp lý nhất.</p>
                        <p class="text-white mb-4">Để đặt tour, vui lòng điền đầy đủ thông tin vào biểu mẫu bên cạnh. Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận đơn đặt tour của bạn.</p>
                        <a href="tours.jsp" class="btn btn-light text-primary rounded-pill py-3 px-5 mt-2">Xem Các Tour</a>
                    </div>
                    
                    <div class="col-lg-6">
                        <h1 class="text-white mb-3">Đặt Tour Ưu Đãi</h1>
                        <p class="text-white mb-4">Nhận <span class="text-warning">Ưu Đãi 50%</span> Cho Chuyến Du Lịch Đầu Tiên Của Bạn Với GoViet.</p>
                        
                        <% if (isLoggedIn) { %>
                            <form id="bookingForm" action="BookingServlet" method="POST">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control bg-white border-0" id="name" name="name" 
                                                placeholder="Họ và tên" value="<%= username %>" required>
                                            <label for="name">Họ và tên</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control bg-white border-0" id="email" name="email" 
                                                placeholder="Email" value="<%= email %>" required>
                                            <label for="email">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="tel" class="form-control bg-white border-0" id="phone" name="phone" 
                                                placeholder="Số điện thoại" required>
                                            <label for="phone">Số điện thoại</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="date" class="form-control bg-white border-0" id="departureDate" 
                                                name="departureDate" min="<%= java.time.LocalDate.now() %>" required>
                                            <label for="departureDate">Ngày khởi hành</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select bg-white border-0" id="tourId" name="tourId" required>
                                                <option value="">Chọn tour</option>
                                                <!-- Tours will be loaded via AJAX -->
                                            </select>
                                            <label for="tourId">Chọn Tour</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" class="form-control bg-white border-0" id="adult" 
                                                name="adult" min="1" value="1" required>
                                            <label for="adult">Số người lớn</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" class="form-control bg-white border-0" id="children" 
                                                name="children" min="0" value="0">
                                            <label for="children">Số trẻ em (dưới 12 tuổi)</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select bg-white border-0" id="paymentMethod" name="paymentMethod" required>
                                                <option value="bank">Chuyển khoản ngân hàng</option>
                                                <option value="cod">Thanh toán khi nhận vé</option>
                                                <option value="momo">Ví điện tử MoMo</option>
                                            </select>
                                            <label for="paymentMethod">Hình thức thanh toán</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control bg-white border-0" placeholder="Yêu cầu đặc biệt" 
                                                id="specialRequest" name="specialRequest" style="height: 100px"></textarea>
                                            <label for="specialRequest">Yêu cầu đặc biệt (nếu có)</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="terms" required>
                                            <label class="form-check-label text-white" for="terms">
                                                Tôi đồng ý với <a href="#" class="text-warning">điều khoản và điều kiện</a> của GoViet
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary text-white w-100 py-3">Đặt Tour Ngay</button>
                                    </div>
                                </div>
                            </form>
                        <% } else { %>
                            <div class="alert alert-warning">
                                <h5 class="alert-heading">Vui lòng đăng nhập để đặt tour</h5>
                                <p>Bạn cần đăng nhập để có thể đặt tour. Nếu chưa có tài khoản, vui lòng đăng ký.</p>
                                <hr>
                                <div class="d-flex justify-content-between">
                                    <a href="login.jsp" class="btn btn-outline-primary">Đăng nhập</a>
                                    <a href="register.jsp" class="btn btn-primary">Đăng ký tài khoản mới</a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <!-- Booking Section End -->

        <!-- Why Choose Us Section -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto" style="max-width: 800px;">
                    <h5 class="section-title">Tại sao chọn GoViet?</h5>
                    <h1 class="mb-5">Dịch vụ du lịch tốt nhất dành cho bạn</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <div class="service-img">
                                <img src="${pageContext.request.contextPath}/assets/img/icon/icon-1.png" class="img-fluid" alt="">
                            </div>
                            <h5>Giá cả hợp lý</h5>
                            <p class="mb-0">Giá tour cạnh tranh với nhiều ưu đãi hấp dẫn</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <div class="service-img">
                                <img src="${pageContext.request.contextPath}/assets/img/icon/icon-2.png" class="img-fluid" alt="">
                            </div>
                            <h5>Đặt tour dễ dàng</h5>
                            <p class="mb-0">Quy trình đặt tour đơn giản, nhanh chóng</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <div class="service-img">
                                <img src="${pageContext.request.contextPath}/assets/img/icon/icon-3.png" class="img-fluid" alt="">
                            </div>
                            <h5>Hỗ trợ 24/7</h5>
                            <p class="mb-0">Đội ngũ tư vấn viên luôn sẵn sàng hỗ trợ</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Why Choose Us End -->
    </main>

    <!-- Footer -->
    <footer class="footer mt-auto py-3 bg-light">
        <div class="container">
            <%@include file="./inc/footer.jsp" %>
        </div>
    </footer>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top">
        <i class="fa fa-arrow-up"></i>
    </a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <!-- Initialize dropdowns -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize all dropdowns
            var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
            // Initialize all dropdowns with proper configuration
            dropdownElementList.forEach(function(dropdownToggleEl) {
                try {
                    new bootstrap.Dropdown(dropdownToggleEl, {
                        popperConfig: function(defaultBsPopperConfig) {
                            return {
                                ...defaultBsPopperConfig,
                                placement: 'bottom-end'
                            };
                        }
                    });
                } catch (e) {
                    console.error('Error initializing dropdown:', e);
                }
            });
            
            // Close dropdown when clicking outside
            document.addEventListener('click', function(event) {
                if (!event.target.closest('.dropdown')) {
                    var dropdowns = document.querySelectorAll('.dropdown-menu.show');
                    dropdowns.forEach(function(dropdown) {
                        var bsDropdown = bootstrap.Dropdown.getInstance(dropdown.previousElementSibling);
                        if (bsDropdown) {
                            bsDropdown.hide();
                        }
                    });
                }
            });
        });
    </script>
    
    <!-- Custom Scripts -->
    <script>
        $(document).ready(function() {
            // Set minimum date to today
            const today = new Date().toISOString().split('T')[0];
            $('#departureDate').attr('min', today);
            
            // Load available tours
            function loadTours() {
                $.ajax({
                    url: 'api/tours',
                    type: 'GET',
                    dataType: 'json',
                    success: function(tours) {
                        const $select = $('#tourId');
                        $select.empty().append('<option value="">Chọn tour</option>');
                        
                        tours.forEach(function(tour) {
                            $select.append(`<option value="${tour.id}">${tour.name} - ${new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(tour.price)}</option>`);
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error loading tours:', error);
                        alert('Có lỗi xảy ra khi tải danh sách tour. Vui lòng thử lại sau.');
                    }
                });
            }
            
            // Load tours on page load
            loadTours();
            
            // Form submission
            $('#bookingForm').on('submit', function(e) {
                e.preventDefault();
                
                if (!this.checkValidity()) {
                    e.stopPropagation();
                    this.classList.add('was-validated');
                    return false;
                }
                
                const formData = $(this).serialize();
                
                $.ajax({
                    url: 'BookingServlet',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            alert('Đặt tour thành công! Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.');
                            window.location.href = 'my-bookings.jsp';
                        } else {
                            alert('Có lỗi xảy ra: ' + (response.message || 'Vui lòng thử lại sau.'));
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Booking error:', error);
                        alert('Có lỗi xảy ra khi đặt tour. Vui lòng thử lại sau.');
                    }
                });
            });
            
            // Update price when tour or number of people changes
            function updatePrice() {
                const tourId = $('#tourId').val();
                const adults = parseInt($('#adult').val()) || 0;
                const children = parseInt($('#children').val()) || 0;
                
                if (tourId && (adults > 0 || children > 0)) {
                    // In a real app, you would fetch the tour price from the server
                    // This is just a placeholder
                    const adultPrice = 2000000; // Example price
                    const childPrice = 1500000; // Example price
                    const total = (adults * adultPrice) + (children * childPrice);
                    
                    $('#totalPrice').text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(total));
                } else {
                    $('#totalPrice').text('0 VNĐ');
                }
            }
            
            $('#tourId, #adult, #children').on('change', updatePrice);
            
            // Initialize tooltips
            $('[data-bs-toggle="tooltip"]').tooltip();
        });
    </script>
</body>
</html>