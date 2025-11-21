<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Admin - Tạo điểm đến</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
          integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">

    <%@include file="../inc/sidebar.jsp"%>

    <div class="content" style="margin-left: 220px; width: calc(100% - 220px);">
        <%@include file="../inc/navbar.jsp" %>

        <div class="container-fluid pt-3 px-2 px-lg-3">
            <div class="bg-light rounded p-3 p-lg-4">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h5 class="mb-0">Thêm điểm đến</h5>
                    <a href="IndexDestinationsServlet" class="btn btn-outline-secondary">Quay lại</a>
                </div>

                <c:if test="${not empty sessionScope.errorMessage}">
                    <div class="alert alert-danger py-2">
                        ${sessionScope.errorMessage}
                    </div>
                </c:if>

                <form method="post" action="CreateDestinationsServlet" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Tên điểm đến</label>
                            <input name="name" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Danh mục</label>
                            <select name="category_id" class="form-select" required>
                                <option value="">-- Chọn danh mục --</option>
                                <c:forEach items="${categoryList}" var="cat">
                                    <c:if test="${cat.status}">
                                        <option value="${cat.id}">${cat.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Vị trí (location)</label>
                            <input id="location" name="location" class="form-control" placeholder="Ví dụ: 10.762622,106.660172" required>
                            <small class="text-muted">Bạn có thể nhập tay hoặc chọn trên bản đồ bên dưới.</small>
                            <div id="map-create" style="height: 250px; margin-top: 8px; border-radius: 4px; overflow: hidden; border: 1px solid #ddd;"></div>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Ảnh (upload)</label>
                            <input id="image_file" name="image_file" type="file" accept="image/*" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Thời gian lý tưởng để đi</label>
                            <input name="best_time_to_visit" type="date" class="form-control" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Mô tả</label>
                            <textarea name="description" class="form-control" rows="4" required></textarea>
                        </div>
                    </div>

                    <div class="mt-3 d-flex gap-2">
                        <button class="btn btn-primary" type="submit">Lưu</button>
                        <a href="IndexDestinationsServlet" class="btn btn-outline-secondary">Hủy</a>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="../inc/footer.jsp" %>
    </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-o9N1j7kGStb6kKpP7Q2Fk8H7KpGtGkS1KpQtH3vC5uU=" crossorigin=""></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var mapEl = document.getElementById('map-create');
        if (!mapEl) return;

        if (typeof L === 'undefined') {
            console.error('Leaflet (L) is not loaded. Check network or CDN blocking.');
            return;
        }

        var map = L.map('map-create').setView([16.047079, 108.206230], 5); // Việt Nam
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var marker;
        var locationInput = document.getElementById('location');

        map.on('click', function (e) {
            var lat = e.latlng.lat.toFixed(6);
            var lng = e.latlng.lng.toFixed(6);
            if (marker) {
                marker.setLatLng(e.latlng);
            } else {
                marker = L.marker(e.latlng).addTo(map);
            }
            locationInput.value = lat + ',' + lng;
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
