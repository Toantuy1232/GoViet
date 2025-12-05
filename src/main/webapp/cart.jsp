<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
    <%@include file="./inc/header.jsp" %>
    
    <div class="container-xxl py-5">
        <div class="container">
            <h2 class="mb-4"><i class="fas fa-shopping-cart me-2"></i>Giỏ hàng của bạn</h2>
            
            <c:choose>
                <c:when test="${not empty cart}">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Loại</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${cart}" var="item">
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="${pageContext.request.contextPath}/${item.imageUrl}" 
                                                             width="60" height="60" style="object-fit: cover;" class="me-3">
                                                        <span>${item.itemName}</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="badge ${item.type == 'tour' ? 'bg-info' : 'bg-warning'}">
                                                        ${item.type == 'tour' ? 'Tour' : 'Khách sạn'}
                                                    </span>
                                                </td>
                                                <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/>₫</td>
                                                <td>${item.quantity}</td>
                                                <td><fmt:formatNumber value="${item.total}" type="number" groupingUsed="true"/>₫</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bg-light rounded p-4">
                                <h4 class="mb-4">Tổng đơn hàng</h4>
                                <div class="d-flex justify-content-between mb-3">
                                    <span>Tổng cộng:</span>
                                    <strong><fmt:formatNumber value="${cartTotal}" type="number" groupingUsed="true"/>₫</strong>
                                </div>
                                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary w-100 py-3">
                                    Thanh toán
                                </a>
                                <a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary w-100 mt-2">
                                    Tiếp tục mua sắm
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-5">
                        <i class="fas fa-shopping-cart fa-5x text-muted mb-3"></i>
                        <h3>Giỏ hàng trống</h3>
                        <p>Hãy thêm tour hoặc khách sạn vào giỏ hàng</p>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-3">
                            Khám phá ngay
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
