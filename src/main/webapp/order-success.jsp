<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Đặt hàng thành công - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>
<body>
    <%@include file="./inc/header.jsp" %>
    
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="text-center">
                        <i class="fas fa-check-circle text-success" style="font-size: 100px;"></i>
                        <h1 class="mt-4 mb-3">Đặt hàng thành công!</h1>
                        <c:if test="${not empty order}">
                            <div class="alert alert-info">
                                <h4>Mã đơn hàng: <strong>${order.orderCode}</strong></h4>
                                <p class="mb-0">Tổng tiền: <strong><fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫</strong></p>
                            </div>
                            <p class="lead">Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ liên hệ với bạn sớm nhất để xác nhận đơn hàng.</p>
                        </c:if>
                        <div class="d-flex gap-3 justify-content-center mt-4">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary px-4 py-2">
                                <i class="fas fa-home me-1"></i>Về trang chủ
                            </a>
                            <c:if test="${not empty order and not empty order.orderCode}">
                                <a href="${pageContext.request.contextPath}/order-detail?code=${order.orderCode}" class="btn btn-success px-4 py-2">
                                    <i class="fas fa-eye me-1"></i>Xem đơn hàng
                                </a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/my-bookings" class="btn btn-outline-primary px-4 py-2">
                                <i class="fas fa-list me-1"></i>Tất cả đơn hàng
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
