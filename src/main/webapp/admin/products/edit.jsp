<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Sửa sản phẩm - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <%@include file="../inc/sidebar.jsp" %>
        <div class="content">
            <%@include file="../inc/navbar.jsp" %>
            <div class="container-fluid pt-4 px-4">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="bg-light rounded p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3>Sửa sản phẩm</h3>
                                <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-secondary">Quay lại</a>
                            </div>

                            <form method="post" action="${pageContext.request.contextPath}/admin/products/edit" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${product.id}">
                                <input type="hidden" name="oldThumbnail" value="${product.image_url}">

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input type="text" name="name" class="form-control" value="${product.name}" required>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Giá</label>
                                        <input type="number" name="price" class="form-control" step="0.01" value="${product.price}" required>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Giá cũ</label>
                                        <input type="number" name="oldPrice" class="form-control" step="0.01" value="${product.price_old}">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Ảnh đại diện hiện tại</label>
                                    <div>
                                        <c:if test="${not empty product.image_url}">
                                            <img src="${pageContext.request.contextPath}/${product.image_url}" width="150" class="mb-2" alt="Current">
                                        </c:if>
                                        <c:if test="${empty product.image_url}">
                                            <p class="text-muted">Chưa có ảnh</p>
                                        </c:if>
                                    </div>
                                    <label class="form-label">Thay đổi ảnh (để trống nếu không đổi)</label>
                                    <input type="file" name="thumbnailFile" class="form-control" accept="image/*">
                                    <small class="text-muted">Chọn ảnh mới nếu muốn thay đổi</small>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mô tả</label>
                                    <textarea name="description" class="form-control" rows="5">${product.description}</textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Số lượng</label>
                                        <input type="number" name="quantity" class="form-control" value="${product.stock}" required>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Danh mục</label>
                                        <select name="categoryId" class="form-select" required>
                                            <c:forEach items="${categories}" var="cat">
                                                <option value="${cat.id}" ${cat.id == product.category_id ? 'selected' : ''}>
                                                    ${cat.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../inc/footer.jsp" %>
        </div>
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
