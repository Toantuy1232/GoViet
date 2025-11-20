<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit tour</title>
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
</head>
<body id="page-top">
<div id="wrapper">
    <%@ include file="../inc/sidebar.jsp" %>

    <div id="content-wrapper" class="d-flex flex-column">
        <%@ include file="../inc/navbar.jsp" %>

        <div class="container-fluid" style="margin-left: 0; padding-left: 20px;">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-success">Chỉnh sửa tour</h1>
            </div>

            <c:if test="${empty tour}">
                <div class="alert alert-danger">Không có dữ liệu tour để hiển thị.</div>
            </c:if>

            <c:if test="${not empty tour}">
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #28a745; border-color: #28a745;">
                        <h6 class="m-0 font-weight-bold text-white">Thông tin tour</h6>
                    </div>
                    <div class="card-body">
                        <form action="EditTourServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="tourId" value="${tour.tour_id}">

                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Ảnh hiện tại</label>
                                        <div class="border rounded p-3 text-center" style="min-height: 200px; background-color: #f8fff8; border-color: #28a745;">
                                            <c:if test="${not empty tour.main_image}">
                                                <img class="img-fluid rounded shadow-sm" style="max-height:180px; max-width: 100%; object-fit: contain;"
                                                     src="${pageContext.request.contextPath}/img/${tour.main_image}" alt="Ảnh tour">
                                                <div class="mt-2">
                                                    <small class="text-success font-weight-bold">
                                                        <i class="fas fa-check-circle"></i> Đã có ảnh chính
                                                    </small>
                                                    <br>
                                                    <small class="text-muted">Ảnh: ${tour.main_image}</small>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty tour.main_image}">
                                                <div class="text-muted">
                                                    <i class="fas fa-image fa-4x mb-3 text-success"></i>
                                                    <p class="font-weight-bold text-success">Chưa có ảnh chính</p>
                                                    <small>Vui lòng upload ảnh bên dưới</small>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Upload ảnh mới</label>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="cover_file" name="cover_file" accept="image/*">
                                            <label class="custom-file-label" for="cover_file">Chọn ảnh...</label>
                                        </div>
                                        <small class="form-text text-muted">Không bắt buộc, chỉ chọn nếu muốn thay ảnh.</small>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Tiêu đề tour *</label>
                                        <input type="text" name="title" class="form-control" value="${tour.title}" required>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Giá *</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₫</span>
                                            </div>
                                            <input type="number" name="price" min="0" step="0.01" class="form-control" value="${tour.price}" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Giá cũ</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₫</span>
                                            </div>
                                            <input type="number" name="price_old" min="0" step="0.01" class="form-control" value="${tour.price_old}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Số ngày *</label>
                                        <input type="number" name="duration_days" min="1" class="form-control" value="${tour.duration_days}" required>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Danh mục tour *</label>
                                        <select name="category_id" class="form-control" required>
                                            <option value="">-- Chọn danh mục --</option>
                                            <c:forEach items="${categoryList}" var="cat">
                                                <option value="${cat.id}" ${cat.id == tour.category_id ? 'selected' : ''}>${cat.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <fmt:formatDate value="${tour.start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="startVal"/>
                                <fmt:formatDate value="${tour.end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="endVal"/>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Ngày bắt đầu *</label>
                                        <input type="datetime-local" name="start_date" class="form-control"
                                               value="${startVal}" required>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Ngày kết thúc *</label>
                                        <input type="datetime-local" name="end_date" class="form-control"
                                               value="${endVal}" required>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Số chỗ còn trống *</label>
                                        <input type="number" name="available_slots" min="0" class="form-control" value="${tour.available_slots}" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Mô tả *</label>
                                <textarea name="description" class="form-control" rows="3" required>${tour.description}</textarea>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success btn-lg mr-3" style="background-color: #28a745; border-color: #28a745;">
                                    <i class="fas fa-save"></i> Lưu thay đổi
                                </button>
                                <a href="IndexTourServlet" class="btn btn-outline-success btn-lg">
                                    <i class="fas fa-arrow-left"></i> Quay lại
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
        </div>

        <%@ include file="../inc/footer.jsp" %>
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/chart/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var input = document.getElementById('cover_file');
    if (input) {
        var label = input.nextElementSibling;
        input.addEventListener('change', function() {
            if (this.files && this.files[0]) {
                label.textContent = this.files[0].name;
            } else {
                label.textContent = 'Chọn ảnh...';
            }
        });
    }
});
</script>
</body>
</html>

