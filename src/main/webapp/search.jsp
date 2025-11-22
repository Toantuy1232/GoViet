<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm tour du lịch - GoViet</title>
    <!-- Add your CSS includes here -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .tour-card {
            transition: transform 0.3s;
            margin-bottom: 30px;
        }
        .tour-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .tour-img {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        .price {
            color: #ff6b6b;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .old-price {
            text-decoration: line-through;
            color: #999;
            font-size: 0.9rem;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Search Results Section -->
    <div class="container py-5">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="text-center mb-4">Kết quả tìm kiếm</h2>
                <c:choose>
                    <c:when test="${not empty toursList && fn:length(toursList) > 0}">
                        <p class="text-muted text-center">Tìm thấy ${fn:length(toursList)} kết quả</p>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="fas fa-search fa-4x mb-3 text-muted"></i>
                            <h4>Không tìm thấy tour nào phù hợp</h4>
                            <p class="text-muted">Xin vui lòng thử lại với từ khóa khác</p>
                            <a href="home" class="btn btn-primary mt-3">Quay về trang chủ</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="row">
            <c:forEach items="${toursList}" var="tour">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 tour-card">
                        <img src="${tour.mainImage}" class="card-img-top tour-img" alt="${tour.title}">
                        <div class="card-body">
                            <h5 class="card-title">${tour.title}</h5>
                            <p class="card-text text-muted">${fn:substring(tour.description, 0, 100)}...</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="price">
                                    ${tour.price} VNĐ
                                    <c:if test="${tour.priceOld > 0}">
                                        <span class="old-price">${tour.priceOld} VNĐ</span>
                                    </c:if>
                                </div>
                                <a href="tour-detail?id=${tour.id}" class="btn btn-outline-primary">Xem chi tiết</a>
                            </div>
                        </div>
                        <div class="card-footer bg-white border-0">
                            <div class="d-flex justify-content-between text-muted">
                                <span><i class="far fa-calendar-alt me-1"></i> ${tour.durationDays} ngày</span>
                                <span><i class="fas fa-users me-1"></i> Còn ${tour.availableSlots} chỗ</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add any necessary JavaScript here
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });
        });
    </script>
</body>
</html>