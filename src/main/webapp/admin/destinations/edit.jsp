<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Admin - Sửa điểm đến</title>
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
<body id="page-top">
<div id="wrapper">
    <%@ include file="../inc/sidebar.jsp" %>

    <div id="content-wrapper" class="d-flex flex-column">
        <%@ include file="../inc/navbar.jsp" %>

        <div class="container-fluid" style="margin-left: 0; padding: 20px;">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-success">Chỉnh sửa điểm đến</h1>
                <a href="IndexDestinationsServlet" class="btn btn-outline-secondary">Quay lại</a>
            </div>

            <c:if test="${empty destination}">
                <div class="alert alert-danger">Không có dữ liệu điểm đến để hiển thị.</div>
            </c:if>

            <c:if test="${not empty destination}">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 bg-success border-success">
                        <h6 class="m-0 font-weight-bold text-white">Thông tin điểm đến</h6>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty sessionScope.errorMessage}">
                            <div class="alert alert-danger py-2 mb-3">
                                ${sessionScope.errorMessage}
                            </div>
                        </c:if>

                        <form action="EditDestinationsServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="destination_id" value="${destination.destination_id}">

                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="form-label">Tên điểm đến *</label>
                                    <input type="text" name="name" class="form-control" value="${destination.name}" required>
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Danh mục *</label>
                                    <select name="category_id" class="form-select" required>
                                        <option value="">-- Chọn danh mục --</option>
                                        <c:forEach items="${categoryList}" var="cat">
                                            <c:if test="${cat.status}">
                                                <option value="${cat.id}" ${cat.id == destination.category_id ? 'selected' : ''}>${cat.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Thời gian lý tưởng *</label>
                                    <input type="date" name="best_time_to_visit" class="form-control" value="${destination.best_time_to_visit}" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Vị trí (location) *</label>
                                    <input type="text" id="location" name="location" class="form-control" value="${destination.location}" required>
                                    <small class="text-muted">Bạn có thể nhập tay hoặc chọn trên bản đồ bên dưới.</small>
                                    <div id="map-edit" style="height: 250px; margin-top: 8px; border-radius: 4px; overflow: hidden; border: 1px solid #ddd;"></div>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label">Ảnh hiện tại</label>
                                    <input type="text" class="form-control mb-2" value="${destination.image_url}" readonly>
                                    <label class="form-label">Ảnh mới (upload, không bắt buộc)</label>
                                    <input type="file" id="image_file" name="image_file" accept="image/*" class="form-control">
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Mô tả *</label>
                                    <textarea name="description" class="form-control" rows="4" required>${destination.description}</textarea>
                                </div>
                            </div>

                            <div class="mt-3 text-center">
                                <button type="submit" class="btn btn-success btn-lg mr-3">
                                    <i class="fas fa-save"></i> Lưu thay đổi
                                </button>
                                <a href="IndexDestinationsServlet" class="btn btn-outline-success btn-lg">
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
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-o9N1j7kGStb6kKpP7Q2Fk8H7KpGtGkS1KpQtH3vC5uU=" crossorigin=""></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var mapEl = document.getElementById('map-edit');
        if (!mapEl) return;

        if (typeof L === 'undefined') {
            console.error('Leaflet (L) is not loaded. Check network or CDN blocking.');
            return;
        }

        var defaultLatLng = [16.047079, 108.206230];
        var map = L.map('map-edit').setView(defaultLatLng, 5);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var marker;
        var locationInput = document.getElementById('location');

        // Nếu location hiện tại ở dạng "lat,lng" thì set marker
        if (locationInput && locationInput.value && locationInput.value.indexOf(',') !== -1) {
            var parts = locationInput.value.split(',');
            if (parts.length === 2) {
                var lat = parseFloat(parts[0]);
                var lng = parseFloat(parts[1]);
                if (!isNaN(lat) && !isNaN(lng)) {
                    var ll = L.latLng(lat, lng);
                    map.setView(ll, 10);
                    marker = L.marker(ll).addTo(map);
                }
            }
        }

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
