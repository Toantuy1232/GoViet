<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Sửa Category Gallery</title>
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
<body id="page-top">
<div id="wrapper">
    <%@include file="../inc/sidebar.jsp"%>

    <div id="content-wrapper" class="d-flex flex-column">
        <%@include file="../inc/navbar.jsp" %>

        <div class="container-fluid" style="margin-left: 0; padding-left: 20px;">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-success">Sửa Category Gallery</h1>
            </div>

            <div class="card shadow mb-4">
                <div class="card-header py-3" style="background-color: #28a745; border-color: #28a745;">
                    <h6 class="m-0 font-weight-bold text-white">Thông tin</h6>
                </div>
                <div class="card-body">
                    <form action="EditCategoryGalleryServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${item.id}">

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="font-weight-bold">Danh mục</label>
                                <select name="category_id" class="form-control" required>
                                    <option value="">-- Chọn danh mục --</option>
                                    <c:forEach items="${categoryList}" var="cat">
                                        <option value="${cat.id}" <c:if test="${cat.id == item.category_id}">selected</c:if>>${cat.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label class="font-weight-bold">Ảnh hiện tại</label>
                                <div class="border rounded p-2 text-center">
                                    <c:if test="${not empty item.image_url}">
                                        <img src="${pageContext.request.contextPath}/img/${item.image_url}"
                                             style="max-height:120px; max-width:100%; object-fit:contain;" class="img-fluid" alt="current"/>
                                        <div class="mt-2">
                                            <small class="text-muted">${item.image_url}</small>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty item.image_url}">
                                        <span class="text-muted">Chưa có ảnh</span>
                                    </c:if>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label class="font-weight-bold">Ảnh mới (có thể chọn nhiều ảnh)</label>
                                <input type="file" name="images" accept="image/*" class="form-control" multiple>
                                <small class="form-text text-muted">Không chọn ảnh nếu chỉ đổi danh mục. Chọn nhiều ảnh để thêm mới cho danh mục này.</small>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="font-weight-bold">Ngày tạo</label>
                            <p>
                                <fmt:formatDate value="${item.created_at}" pattern="dd/MM/yyyy HH:mm"/>
                            </p>
                        </div>

                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-success btn-lg mr-3">Lưu thay đổi</button>
                            <a href="IndexCategoryGalleryServlet" class="btn btn-outline-success btn-lg">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="../inc/footer.jsp" %>
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

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
