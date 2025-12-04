<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Dịch vụ - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">GoViet</a>
        </div>
    </nav>

    <!-- Services Hero Start -->
    <div class="bg-light py-5 mb-5">
        <div class="container">
            <h1 class="text-center mb-3">Dịch vụ khách sạn</h1>
            <p class="text-center">Khám phá các khách sạn tốt nhất cho chuyến du lịch của bạn</p>
        </div>
    </div>
    <!-- Services Hero End -->

    <!-- Services Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-4">
                <c:forEach items="${hotels}" var="hotel">
                    <div class="col-lg-4 col-md-6">
                        <div class="card h-100 shadow">
                            <img src="${pageContext.request.contextPath}/${hotel.image_url}" 
                                 class="card-img-top" 
                                 alt="${hotel.name}"
                                 style="height: 250px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">${hotel.name}</h5>
                                <p class="card-text">
                                    <i class="fas fa-map-marker-alt text-primary"></i>
                                    ${hotel.address}
                                </p>
                                <div class="mb-2">
                                    <c:forEach begin="1" end="${hotel.stars}">
                                        <i class="fas fa-star text-warning"></i>
                                    </c:forEach>
                                    <span class="ms-2">${hotel.stars} sao</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <h4 class="text-primary mb-0">${hotel.price_per_night}₫<small class="text-muted">/đêm</small></h4>
                                    <a href="#" class="btn btn-primary btn-sm">Đặt ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${empty hotels}">
                <div class="text-center py-5">
                    <i class="fas fa-hotel fa-5x text-muted mb-3"></i>
                    <h3 class="text-muted">Chưa có khách sạn nào</h3>
                    <p>Vui lòng quay lại sau</p>
                </div>
            </c:if>
        </div>
    </div>
    <!-- Services End -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
