<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Products - Admin</title>
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-shopping-cart"></i> Quản lý Products</h2>
                    <a href="${pageContext.request.contextPath}/CreateProductServlet" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm Product
                    </a>
                </div>

                <c:if test="${param.message == 'create_success'}">
                    <div class="alert alert-success">Thêm product thành công!</div>
                </c:if>
                <c:if test="${param.message == 'update_success'}">
                    <div class="alert alert-success">Cập nhật product thành công!</div>
                </c:if>
                <c:if test="${param.message == 'delete_success'}">
                    <div class="alert alert-success">Xóa product thành công!</div>
                </c:if>

                <div class="bg-light rounded p-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Thumbnail</th>
                                <th>Tên</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Category</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${products}" var="product">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>
                                        <c:if test="${not empty product.image_url}">
                                            <img src="${pageContext.request.contextPath}/${product.image_url}" width="50" height="50" style="object-fit: cover;" alt="${product.name}">
                                        </c:if>
                                        <c:if test="${empty product.image_url}">
                                            <img src="${pageContext.request.contextPath}/img/default-product.jpg" width="50" height="50" style="object-fit: cover;" alt="No image">
                                        </c:if>
                                    </td>
                                    <td>${product.name}</td>
                                    <td><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ</td>
                                    <td>${product.stock}</td>
                                    <td>${product.category_id}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/products/edit?id=${product.id}" 
                                           class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/products/delete?id=${product.id}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa?')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty products}">
                                <tr>
                                    <td colspan="7" class="text-center">Chưa có sản phẩm nào</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
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
