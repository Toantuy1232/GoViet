<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đơn đặt của tôi - GoViet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        .booking-card {
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.875rem;
        }
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        .status-confirmed {
            background-color: #d1ecf1;
            color: #0c5460;
        }
        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>

<%@ include file="./inc/header.jsp" %>

<div class="container-fluid bg-breadcrumb">
    <div class="container text-center py-5">
        <h3 class="text-white display-3 mb-4">Đơn đặt của tôi</h3>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HomeServlet">Trang chủ</a></li>
            <li class="breadcrumb-item active text-white">Đơn đặt của tôi</li>
        </ol>
    </div>
</div>

<div class="container py-5">
    <c:if test="${not empty sessionScope.errors}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${sessionScope.errors}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <c:remove var="errors" scope="session"/>
    </c:if>
    
    <c:if test="${not empty sessionScope.success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${sessionScope.success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <c:remove var="success" scope="session"/>
    </c:if>
    
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="mb-3">Danh sách đơn đặt</h2>
            <p class="text-muted">Quản lý và theo dõi tất cả các đơn đặt tour và dịch vụ của bạn</p>
        </div>
    </div>
    
    <c:choose>
        <c:when test="${empty bookings}">
            <div class="row">
                <div class="col-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body text-center py-5">
                            <i class="fas fa-calendar-times fa-4x text-muted mb-3"></i>
                            <h4>Chưa có đơn đặt nào</h4>
                            <p class="text-muted">Bạn chưa có đơn đặt nào. Hãy khám phá các tour và dịch vụ của chúng tôi!</p>
                            <a href="${pageContext.request.contextPath}/DestinationServlet" class="btn btn-primary rounded-pill px-4 mt-3">
                                <i class="fas fa-search me-2"></i>Khám phá tour
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row">
                <c:forEach items="${bookings}" var="booking">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="card booking-card border-0 shadow-sm h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <h5 class="card-title mb-0">
                                        <c:choose>
                                            <c:when test="${booking.bookingType == 'tour'}">
                                                <i class="fas fa-map-marked-alt text-primary me-2"></i>Tour
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-box text-primary me-2"></i>Sản phẩm
                                            </c:otherwise>
                                        </c:choose>
                                    </h5>
                                    <c:choose>
                                        <c:when test="${booking.status == 'pending'}">
                                            <span class="status-badge status-pending">Chờ xác nhận</span>
                                        </c:when>
                                        <c:when test="${booking.status == 'confirmed'}">
                                            <span class="status-badge status-confirmed">Đã xác nhận</span>
                                        </c:when>
                                        <c:when test="${booking.status == 'completed'}">
                                            <span class="status-badge status-completed">Hoàn thành</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-cancelled">Đã hủy</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                <p class="text-muted small mb-2">
                                    <i class="fas fa-hashtag me-1"></i>Mã đơn: <strong>${booking.bookingId}</strong>
                                </p>
                                
                                <hr>
                                
                                <div class="mb-2">
                                    <i class="fas fa-user text-muted me-2"></i>
                                    <strong>${booking.customerName}</strong>
                                </div>
                                
                                <div class="mb-2">
                                    <i class="fas fa-envelope text-muted me-2"></i>
                                    ${booking.customerEmail}
                                </div>
                                
                                <div class="mb-2">
                                    <i class="fas fa-phone text-muted me-2"></i>
                                    ${booking.customerPhone}
                                </div>
                                
                                <c:if test="${not empty booking.checkInDate}">
                                    <div class="mb-2">
                                        <i class="fas fa-calendar-check text-muted me-2"></i>
                                        <fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy"/>
                                    </div>
                                </c:if>
                                
                                <div class="mb-2">
                                    <i class="fas fa-users text-muted me-2"></i>
                                    ${booking.numberOfPeople} người
                                </div>
                                
                                <hr>
                                
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-muted">Tổng tiền:</span>
                                    <h5 class="text-primary mb-0">
                                        <fmt:formatNumber value="${booking.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    </h5>
                                </div>
                                
                                <a href="${pageContext.request.contextPath}/ViewMyBookingServlet?id=${booking.bookingId}" 
                                   class="btn btn-primary w-100 rounded-pill">
                                    <i class="fas fa-eye me-2"></i>Xem chi tiết
                                </a>
                            </div>
                            <div class="card-footer bg-light border-0">
                                <small class="text-muted">
                                    <i class="fas fa-clock me-1"></i>
                                    Đặt ngày: <fmt:formatDate value="${booking.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                </small>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="./inc/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
