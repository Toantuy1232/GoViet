<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Thêm Category Gallery</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <%@include file="../inc/sidebar.jsp"%>

    <div class="content" style="margin-left: 220px; width: calc(100% - 220px);">
        <%@include file="../inc/navbar.jsp" %>

        <div class="container-fluid pt-3 px-2 px-lg-3">
            <div class="bg-light rounded p-3 p-lg-4">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h5 class="mb-0">Thêm ảnh Category Gallery</h5>
                    <a href="IndexCategoryGalleryServlet" class="btn btn-outline-secondary">Quay lại</a>
                </div>

                <form method="post" action="CreateCategoryGalleryServlet" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">Danh mục</label>
                            <select name="category_id" class="form-select" required>
                                <option value="">-- Chọn danh mục --</option>
                                <c:forEach items="${categoryList}" var="cat">
                                    <option value="${cat.id}">${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Ảnh (tải lên, có thể chọn nhiều ảnh)</label>
                            <input name="images" type="file" accept="image/*" class="form-control" multiple required>
                            <small class="text-muted">Giữ Ctrl (hoặc Cmd) để chọn nhiều ảnh</small>
                        </div>
                    </div>

                    <div class="mt-3 d-flex gap-2">
                        <button class="btn btn-primary" type="submit">Lưu</button>
                        <a href="IndexCategoryGalleryServlet" class="btn btn-outline-secondary">Hủy</a>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="../inc/footer.jsp" %>
    </div>
</div>

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
</body>
</html>
