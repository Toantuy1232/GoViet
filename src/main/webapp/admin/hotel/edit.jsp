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
        .form-control, .form-select {
            border-radius: 0.35rem;
            font-size: 0.875rem;
            padding: 0.35rem 0.75rem;
            height: calc(1.5em + 0.5rem + 2px);
        }
        .form-label {
            margin-bottom: 0.25rem;
            font-size: 0.875rem;
            font-weight: 600;
        }
        .card {
            border: none;
            box-shadow: 0 0.15rem 1rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 1rem;
        }
        .card-header {
            border-bottom: 1px solid #e3e6f0;
            padding: 0.75rem 1.25rem;
        }
        .card-body {
            padding: 1rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .btn {
            padding: 0.35rem 0.75rem;
            font-size: 0.875rem;
        }
        h1 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .alert {
            padding: 0.5rem 1rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
        }
        body {
            background-color: #f8f9fc;
        }
    </style>
</head>
<body id="page-top">
<div id="wrapper">
    <%@include file="../inc/sidebar.jsp"%>

    <div id="content-wrapper" class="d-flex flex-column">
        <%@include file="../inc/navbar.jsp"%>

        <div class="container-fluid" style="margin-left: 200px; padding: 15px; max-width: calc(100% - 200px);">
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h1 class="h4 mb-0 text-success">Chỉnh sửa khách sạn</h1>
                <div>
                    <a href="index.jsp" class="btn btn-secondary btn-sm me-2">
                        <i class="fas fa-arrow-left me-1"></i> Quay lại
                    </a>
                    <button type="submit" form="hotelForm" class="btn btn-success btn-sm" onclick="document.getElementById('hotelForm').submit();">
                        <i class="fas fa-save me-1"></i> Lưu thay đổi
                    </button>
                </div>
            </div>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                
                <c:if test="${empty hotel}">
                    <div class="alert alert-danger">Không có dữ liệu khách sạn để hiển thị.</div>
                </c:if>

                <c:if test="${not empty hotel}">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: #28a745; border-color: #28a745;">
                            <h6 class="m-0 font-weight-bold text-white">Thông tin khách sạn</h6>
                        </div>
                        <div class="card-body">
                            <form id="hotelForm" action="EditHotelServlet" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="hotel_id" value="${hotel.hotel_id}">

                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="font-weight-bold">Ảnh hiện tại</label>
                                            <div class="border rounded p-3 text-center" style="min-height: 200px; background-color: #f8fff8; border-color: #28a745;">
                                                <c:choose>
                                                    <c:when test="${not empty hotel.image_url}">
                                                        <img id="currentImage" src="${pageContext.request.contextPath}/uploads/hotels/${hotel.image_url}" 
                                                             class="img-fluid rounded shadow-sm" style="max-height:180px; max-width: 100%; object-fit: contain;" 
                                                             alt="${hotel.name}">
                                                        <div class="mt-2">
                                                            <small class="text-success font-weight-bold">
                                                                <i class="fas fa-check-circle"></i> Đã có ảnh
                                                            </small>
                                                            <br>
                                                            <small class="text-muted">Ảnh: ${hotel.image_url}</small>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="text-muted">
                                                            <i class="fas fa-image fa-4x mb-3 text-success"></i>
                                                            <p class="font-weight-bold text-success">Chưa có ảnh</p>
                                                            <small>Vui lòng upload ảnh bên dưới</small>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="font-weight-bold">Upload ảnh mới</label>
                                            <div class="custom-file">
                                                <input type="file" class="form-control" id="image" name="image" accept="image/*" onchange="previewImage(this, 'imagePreview')">
                                            </div>
                                            <small class="form-text text-muted">Không bắt buộc, chỉ chọn nếu muốn thay ảnh.</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Tên khách sạn <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="name" name="name" value="${hotel.name}" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Điểm đến <span class="text-danger">*</span></label>
                                            <select class="form-control" id="destination_id" name="destination_id" required>
                                                <option value="" disabled>Chọn điểm đến</option>
                                                <c:forEach var="destination" items="${destinations}">
                                                    <option value="${destination.destination_id}" ${destination.destination_id == hotel.destination_id ? 'selected' : ''}>
                                                        ${destination.name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Tour liên quan <span class="text-danger">*</span></label>
                                            <select class="form-control" id="tour_id" name="tour_id" required>
                                                <option value="" disabled>Chọn tour</option>
                                                <c:forEach var="tour" items="${tours}">
                                                    <option value="${tour.tour_id}" ${tour.tour_id == hotel.tour_id ? 'selected' : ''}>
                                                        ${tour.title}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Địa chỉ <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="address" name="address" value="${hotel.address}" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Giá mỗi đêm (VND) <span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <input type="number" class="form-control" id="price_per_night" 
                                                       name="price_per_night" min="0" step="10000" 
                                                       value="${hotel.price_per_night}" required>
                                                <span class="input-group-text">₫</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Hạng sao <span class="text-danger">*</span></label>
                                            <select class="form-control" id="stars" name="stars" required>
                                                <option value="5" ${hotel.stars == 5 ? 'selected' : ''}>★★★★★ 5 sao</option>
                                                <option value="4" ${hotel.stars == 4 ? 'selected' : ''}>★★★★☆ 4 sao</option>
                                                <option value="3" ${hotel.stars == 3 ? 'selected' : ''}>★★★☆☆ 3 sao</option>
                                                <option value="2" ${hotel.stars == 2 ? 'selected' : ''}>★★☆☆☆ 2 sao</option>
                                                <option value="1" ${hotel.stars == 1 ? 'selected' : ''}>★☆☆☆☆ 1 sao</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            
                            <div class="form-group mb-3">
                                <label class="form-label fw-bold mb-2">Tiện ích</label>
                                <div class="row g-2">
                                    <div class="col-6 col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="wifi" name="amenities" value="wifi">
                                            <label class="form-check-label small" for="wifi">
                                                <i class="fas fa-wifi me-1"></i> Wifi
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="parking" name="amenities" value="parking">
                                            <label class="form-check-label small" for="parking">
                                                <i class="fas fa-parking me-1"></i> Bãi đỗ xe
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="pool" name="amenities" value="pool">
                                            <label class="form-check-label small" for="pool">
                                                <i class="fas fa-swimming-pool me-1"></i> Hồ bơi
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="restaurant" name="amenities" value="restaurant">
                                            <label class="form-check-label small" for="restaurant">
                                                <i class="fas fa-utensils me-1"></i> Nhà hàng
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="spa" name="amenities" value="spa">
                                            <label class="form-check-label small" for="spa">
                                                <i class="fas fa-spa me-1"></i> Spa
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gym" name="amenities" value="gym">
                                            <label class="form-check-label small" for="gym">
                                                <i class="fas fa-dumbbell me-1"></i> Phòng gym
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="index.jsp" class="btn btn-sm btn-outline-secondary">
                                    <i class="fas fa-times me-1"></i> Hủy bỏ
                                </a>
                                <button type="submit" name="action" value="update" class="btn btn-sm btn-success">
                                    <i class="fas fa-save me-1"></i> Cập nhật
                                </button>
                            </div>
                        </form>
                        
                        <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            const amenities = '${hotelAmenities}';
                            if (amenities) {
                                const amenitiesArray = amenities.split(',');
                                amenitiesArray.forEach(function(amenity) {
                                    const checkbox = document.querySelector('input[name="amenities"][value="' + amenity + '"]');
                                    if (checkbox) {
                                        checkbox.checked = true;
                                    }
                                });
                            }
                            
                         
                            const saveButton = document.querySelector('button[form="hotelForm"]');
                            if (saveButton) {
                                saveButton.addEventListener('click', function(e) {
                                    e.preventDefault();
                                    document.getElementById('hotelForm').submit();
                                });
                            }
                        });
                        </script>
                    </div>
                </div>
            </c:if>
                
            <c:if test="${empty hotel}">
                <div class="alert alert-warning">Hotel not found.</div>
                <a href="IndexHotelServlet" class="btn btn-secondary">Back to List</a>
            </c:if>
        </div>
    </div>
    
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/sb-admin-2.min.js"></script>
    
    <script>

        document.getElementById('price_per_night').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            e.target.value = value ? parseInt(value).toLocaleString('vi-VN') : '';
        });
        
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
   
        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);
            const currentImage = document.getElementById('currentImage');
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    if (currentImage) {
                        currentImage.style.display = 'none';
                    }
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(input.files[0]);
            } else {
                if (currentImage) {
                    currentImage.style.display = 'block';
                    if (preview) preview.style.display = 'none';
                } else if (preview) {
                    preview.style.display = 'none';
                }
            }
        }
    </script>
    <%@include file="../inc/footer.jsp" %>
</body>
</html>
