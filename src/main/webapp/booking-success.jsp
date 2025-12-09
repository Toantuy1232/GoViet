<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Đặt chỗ thành công - GoViet</title>
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
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="text-center">
                        <div class="mb-4">
                            <i class="fas fa-check-circle text-success" style="font-size: 100px;"></i>
                        </div>
                        <h1 class="mb-4">Đặt chỗ thành công!</h1>
                        <p class="lead mb-4">Cảm ơn bạn đã đặt chỗ. Chúng tôi sẽ liên hệ với bạn sớm nhất để xác nhận.</p>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>
                            Thông tin đặt chỗ đã được gửi đến email của bạn.
                        </div>
                        <div class="d-flex gap-3 justify-content-center mt-4">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary px-4 py-2">
                                <i class="fas fa-home me-2"></i>Về trang chủ
                            </a>
                            <a href="${pageContext.request.contextPath}/my-bookings" class="btn btn-outline-primary px-4 py-2">
                                <i class="fas fa-calendar-check me-2"></i>Xem đơn đặt
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <!-- Toast Container -->
    <div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
        <div id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-success text-white">
                <i class="fas fa-check-circle me-2"></i>
                <strong class="me-auto">Thành công</strong>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
                ${sessionScope.message}
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show toast if there's a message
        <c:if test="${not empty sessionScope.message}">
            const toast = new bootstrap.Toast(document.getElementById('successToast'));
            toast.show();
            // Clear message after showing
            <% session.removeAttribute("message"); %>
        </c:if>
    </script>
</body>
</html>
