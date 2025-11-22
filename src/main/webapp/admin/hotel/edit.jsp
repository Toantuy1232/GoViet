<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chỉnh sửa khách sạn</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fc;
        }
        #wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
        }
        #content-wrapper {
            width: 100%;
            overflow-x: hidden;
            padding: 20px;
        }
        .container-fluid {
            padding: 0 15px;
            margin-left: 0;
            width: 100%;
        }
        .card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 1.5rem;
        }
        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
            padding: 1rem 1.25rem;
        }
        .card-body {
            padding: 1.5rem;
        }
        .form-control, .form-select {
            border-radius: 0.35rem;
            font-size: 0.875rem;
            padding: 0.5rem 0.75rem;
        }
        .form-label {
            margin-bottom: 0.3rem;
            font-size: 0.9rem;
            font-weight: 600;
            color: #4e73df;
        }
        .btn {
            padding: 0.4rem 1rem;
            font-size: 0.9rem;
            border-radius: 0.35rem;
        }
        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }
        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653d4;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        .btn-success {
            background-color: #1cc88a;
            border-color: #1cc88a;
        }
        .btn-success:hover {
            background-color: #17a673;
            border-color: #169b6b;
        }
        .alert {
            border-radius: 0.35rem;
            padding: 0.75rem 1.25rem;
        }
        .sidebar {
            min-width: 250px;
            max-width: 250px;
            min-height: 100vh;
            transition: all 0.3s;
            position: fixed;
            z-index: 100;
            top: 0;
            left: 0;
            height: 100vh;
            overflow-y: auto;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        #content {
            margin-left: 250px;
            width: calc(100% - 250px);
            min-height: 100vh;
            transition: all 0.3s;
        }
        @media (max-width: 992px) {
            .sidebar {
                margin-left: -250px;
            }
            .sidebar.active {
                margin-left: 0;
            }
            #content {
                width: 100%;
                margin-left: 0;
            }
            #content.active {
                margin-left: 250px;
                width: calc(100% - 250px);
            }
        }
        .form-check-label {
            font-size: 0.9rem;
        }
        .amenities-container {
            background-color: #f8f9fc;
            border-radius: 0.5rem;
            padding: 1rem;
            border: 1px solid #e3e6f0;
        }
        .form-section {
            margin-bottom: 2rem;
            background: white;
            border-radius: 0.5rem;
            padding: 1.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <%@include file="../inc/sidebar.jsp"%>

        <div id="content">
            <%@include file="../inc/navbar.jsp"%>

            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="h4 mb-0 text-gray-800">
                        <i class="fas fa-hotel me-2"></i>Chỉnh sửa khách sạn
                    </h1>
                    <div>
                        <a href="IndexHotelServlet" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                        </a>
                    </div>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${not empty hotel}">
                    <form id="hotelForm" action="EditHotelServlet" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="hotel_id" value="${hotel.hotel_id}">

                        <div class="form-section">
                            <h5 class="text-primary mb-4">
                                <i class="fas fa-info-circle me-2"></i>Thông tin cơ bản
                            </h5>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name" class="form-label">Tên khách sạn <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="name" name="name" value="${hotel.name}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="address" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="address" name="address" value="${hotel.address}" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="price_per_night" class="form-label">Giá mỗi đêm (VND) <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="price_per_night" name="price_per_night"
                                               value="<fmt:formatNumber value="${hotel.price_per_night}" pattern="#,##0"/>" required>
                                        <span class="input-group-text">₫</span>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="stars" class="form-label">Hạng sao <span class="text-danger">*</span></label>
                                    <select class="form-select" id="stars" name="stars" required>
                                        <option value="1" ${hotel.stars == 1 ? 'selected' : ''}>1 sao</option>
                                        <option value="2" ${hotel.stars == 2 ? 'selected' : ''}>2 sao</option>
                                        <option value="3" ${hotel.stars == 3 ? 'selected' : ''}>3 sao</option>
                                        <option value="4" ${hotel.stars == 4 ? 'selected' : ''}>4 sao</option>
                                        <option value="5" ${hotel.stars == 5 ? 'selected' : ''}>5 sao</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="image" class="form-label">Hình ảnh</label>
                                    <input type="file" class="form-control" id="image" name="image" accept="image/*">
                                    <small class="text-muted">Để trống nếu không muốn thay đổi ảnh</small>
                                    <c:if test="${not empty hotel.image_url}">
                                        <div class="mt-2">
                                            <img src="${pageContext.request.contextPath}/assets/images/${hotel.image_url}"
                                                 alt="Ảnh khách sạn" class="img-thumbnail" style="max-width: 150px; max-height: 100px;">
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label class="form-label">Tiện ích</label>
                                    <div class="amenities-container">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="wifi" id="wifi">
                                                    <label class="form-check-label" for="wifi">
                                                        <i class="fas fa-wifi me-1"></i> WiFi miễn phí
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="parking" id="parking">
                                                    <label class="form-check-label" for="parking">
                                                        <i class="fas fa-parking me-1"></i> Bãi đỗ xe
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="pool" id="pool">
                                                    <label class="form-check-label" for="pool">
                                                        <i class="fas fa-swimming-pool me-1"></i> Hồ bơi
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="restaurant" id="restaurant">
                                                    <label class="form-check-label" for="restaurant">
                                                        <i class="fas fa-utensils me-1"></i> Nhà hàng
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="gym" id="gym">
                                                    <label class="form-check-label" for="gym">
                                                        <i class="fas fa-dumbbell me-1"></i> Phòng tập gym
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="spa" id="spa">
                                                    <label class="form-check-label" for="spa">
                                                        <i class="fas fa-spa me-1"></i> Spa
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="aircon" id="aircon">
                                                    <label class="form-check-label" for="aircon">
                                                        <i class="fas fa-wind me-1"></i> Điều hòa
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="breakfast" id="breakfast">
                                                    <label class="form-check-label" for="breakfast">
                                                        <i class="fas fa-coffee me-1"></i> Bữa sáng
                                                    </label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="amenities" value="laundry" id="laundry">
                                                    <label class="form-check-label" for="laundry">
                                                        <i class="fas fa-tshirt me-1"></i> Dịch vụ giặt ủi
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-secondary" onclick="window.history.back()">
                                <i class="fas fa-times me-1"></i> Hủy
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i> Lưu thay đổi
                            </button>
                        </div>
                    </form>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            // Format price input
                            const priceInput = document.getElementById('price_per_night');
                            if (priceInput) {
                                priceInput.addEventListener('input', function(e) {
                                    let value = e.target.value.replace(/\D/g, '');
                                    if (value) {
                                        value = parseInt(value).toLocaleString('vi-VN');
                                    }
                                    e.target.value = value;
                                });
                            }

                            // Initialize amenities checkboxes
                            const amenities = '${hotelAmenities}';
                            if (amenities) {
                                const amenityValues = amenities.split(',');
                                document.querySelectorAll('input[name="amenities"]').forEach(checkbox => {
                                    if (amenityValues.includes(checkbox.value)) {
                                        checkbox.checked = true;
                                    }
                                });
                            }

                            // Form validation
                            const form = document.getElementById('hotelForm');
                            if (form) {
                                form.addEventListener('submit', function(e) {
                                    const price = document.getElementById('price_per_night').value;
                                    if (price && price.trim() !== '') {
                                        const numericValue = price.replace(/\D/g, '');
                                        document.getElementById('price_per_night').value = numericValue;
                                    }
                                    return true;
                                });
                            }
                        });
                    </script>
                </c:if>

                <c:if test="${empty hotel}">
                    <div class="alert alert-warning">
                        <i class="fas fa-exclamation-triangle me-2"></i>Không tìm thấy thông tin khách sạn
                    </div>
                    <a href="IndexHotelServlet" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách
                    </a>
                </c:if>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/sb-admin-2.min.js"></script>

    <script>
        // Toggle sidebar on mobile
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.querySelector('.sidebar');
            const content = document.getElementById('content');

            // Toggle sidebar on button click
            document.querySelector('.sidebar-toggler').addEventListener('click', function() {
                sidebar.classList.toggle('active');
                content.classList.toggle('active');
            });

            // Close sidebar when clicking outside on mobile
            document.addEventListener('click', function(e) {
                if (window.innerWidth <= 992) {
                    if (!sidebar.contains(e.target) && !e.target.closest('.sidebar-toggler')) {
                        sidebar.classList.remove('active');
                        content.classList.remove('active');
                    }
                }
            });
        });
    </script>
</body>
</html>