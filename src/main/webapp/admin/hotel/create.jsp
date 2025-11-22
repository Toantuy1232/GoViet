<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>DASHMIN - Thêm khách sạn mới</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">

        <!-- Admin CSS Fix -->
        <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">
        <style>
            #wrapper {
                display: flex;
                min-height: 100vh;
            }
            
            #content-wrapper {
                flex: 1;
                margin-left: 0;
                width: 100%;
                transition: all 0.3s;
                padding-left: 250px;
                overflow-x: hidden;
            }
            
            @media (max-width: 992px) {
                #content-wrapper {
                    padding-left: 0;
                }
                
                .sidebar.toggled + #content-wrapper {
                    padding-left: 0;
                }
            }
            
            .container-fluid {
                padding: 20px;
            }
            
            .card {
                margin-bottom: 20px;
            }
        </style>

        <!-- CKEditor -->
        <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="../inc/sidebar.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <%@include file="../inc/navbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Thêm khách sạn mới</h1>
                            <a href="index.jsp" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
                                <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại
                            </a>
                        </div>

                        <!-- Content Row -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Thông tin khách sạn</h6>
                                    </div>
                                    <div class="card-body">
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                ${errorMessage}
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </c:if>

                                        <form action="CreateHotelServlet" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="name" class="form-label">Tên khách sạn <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="name" name="name" required>
                                                    <div class="invalid-feedback">Vui lòng nhập tên khách sạn</div>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label for="destination_id" class="form-label">Điểm đến <span class="text-danger">*</span></label>
                                                   <select class="form-control" id="destination_id" name="destination_id" required>
                                                       <option value="" selected disabled>Chọn điểm đến</option>
                                                       <c:forEach var="destination" items="${destinations}">
                                                           <option value="${destination.destination_id}">${destination.name}</option>
                                                       </c:forEach>
                                                   </select>
                                                    <div class="invalid-feedback">Vui lòng chọn điểm đến</div>
                                                </div>
                                                
                                                <div class="col-md-6 mb-3">
                                                    <label for="tour_id" class="form-label">Tour liên quan <span class="text-danger">*</span></label>
                                                 <select class="form-control" id="tour_id" name="tour_id" required>
                                                     <option value="" selected disabled>Chọn tour</option>
                                                     <c:forEach var="tour" items="${tours}">
                                                         <option value="${tour.tour_id}">${tour.title}</option>
                                                     </c:forEach>
                                                 </select>
                                                    <div class="invalid-feedback">Vui lòng chọn tour liên quan</div>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label for="address" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="address" name="address" required>
                                                <div class="invalid-feedback">Vui lòng nhập địa chỉ</div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="price_per_night" class="form-label">Giá mỗi đêm (VND) <span class="text-danger">*</span></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="price_per_night" name="price_per_night" required>
                                                        <span class="input-group-text">₫</span>
                                                        <div class="invalid-feedback">Vui lòng nhập giá phòng</div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label for="stars" class="form-label">Hạng sao <span class="text-danger">*</span></label>
                                                    <select class="form-control" id="stars" name="stars" required>
                                                        <option value="5">★★★★★ 5 sao</option>
                                                        <option value="4">★★★★☆ 4 sao</option>
                                                        <option value="3" selected>★★★☆☆ 3 sao</option>
                                                        <option value="2">★★☆☆☆ 2 sao</option>
                                                        <option value="1">★☆☆☆☆ 1 sao</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label for="description" class="form-label">Mô tả</label>
                                                <textarea class="form-control" id="description" name="description" rows="4"></textarea>
                                            </div>

                                            <div class="mb-4">
                                                <label for="image" class="form-label">Hình ảnh đại diện <span class="text-danger">*</span></label>
                                                <div class="mb-2">
                                                    <img id="imagePreview" src="${pageContext.request.contextPath}/assets/admin/img/no-image.jpg" alt="Preview" class="img-thumbnail" style="max-height: 200px; display: none;">
                                                </div>
                                                <input class="form-control" type="file" id="image" name="image" accept="image/*" onchange="previewImage(this)" required>
                                                <small class="form-text text-muted">Tỷ lệ khuyến nghị: 16:9</small>
                                                <div class="invalid-feedback">Vui lòng chọn hình ảnh đại diện</div>
                                            </div>

                                            <div class="mb-4">
                                                <label class="form-label">Tiện ích</label>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="wifi" name="amenities" value="wifi">
                                                            <label class="form-check-label" for="wifi">
                                                                <i class="bi bi-wifi"></i> Wifi miễn phí
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="parking" name="amenities" value="parking">
                                                            <label class="form-check-label" for="parking">
                                                                <i class="bi bi-p-circle"></i> Bãi đỗ xe
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="pool" name="amenities" value="pool">
                                                            <label class="form-check-label" for="pool">
                                                                <i class="bi bi-water"></i> Hồ bơi
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="restaurant" name="amenities" value="restaurant">
                                                            <label class="form-check-label" for="restaurant">
                                                                <i class="bi bi-egg-fried"></i> Nhà hàng
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="spa" name="amenities" value="spa">
                                                            <label class="form-check-label" for="spa">
                                                                <i class="bi bi-flower1"></i> Spa
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="gym" name="amenities" value="gym">
                                                            <label class="form-check-label" for="gym">
                                                                <i class="bi bi-activity"></i> Phòng gym
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="d-flex justify-content-between mt-4 pt-3 border-top">
                                                <a href="index.jsp" class="btn btn-secondary">
                                                    <i class="fas fa-times me-2"></i> Hủy bỏ
                                                </a>
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-save me-2"></i> Lưu thông tin
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="${pageContext.request.contextPath}/assets/admin/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="${pageContext.request.contextPath}/assets/admin/js/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/assets/admin/js/demo/chart-pie-demo.js"></script>

            <script>
                // Initialize form validation
                (function() {
                    'use strict';
                    window.addEventListener('load', function() {
                        var forms = document.getElementsByClassName('needs-validation');
                        var validation = Array.prototype.filter.call(forms, function(form) {
                            form.addEventListener('submit', function(event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();

                // Initialize CKEditor
                ClassicEditor
                    .create(document.querySelector('#description'))
                    .catch(error => {
                        console.error(error);
                    });

                // Format price input
                document.getElementById('price_per_night').addEventListener('input', function(e) {
                    let value = e.target.value.replace(/\D/g, '');
                    e.target.value = value ? parseInt(value).toLocaleString('vi-VN') : '';
                });
                
                // Image preview function
                function previewImage(input) {
                    const preview = document.getElementById('imagePreview');
                    if (input.files && input.files[0]) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                            preview.style.display = 'block';
                        }
                        reader.readAsDataURL(input.files[0]);
                    } else {
                        preview.style.display = 'none';
                    }
                }
            </script>
        </div>
    </body>
</html>