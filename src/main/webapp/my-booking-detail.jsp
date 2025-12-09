<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn đặt #${booking.bookingId} - GoViet</title>
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
        .info-row {
            padding: 1rem 0;
            border-bottom: 1px solid #e9ecef;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .status-badge {
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1rem;
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
        <h3 class="text-white display-3 mb-4">Chi tiết đơn đặt</h3>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HomeServlet">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/MyBookingsServlet">Đơn đặt của tôi</a></li>
            <li class="breadcrumb-item active text-white">Chi tiết</li>
        </ol>
    </div>
</div>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- Booking Information -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-info-circle me-2"></i>Thông tin đơn đặt
                    </h5>
                </div>
                <div class="card-body">
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Mã đơn đặt:</div>
                            <div class="col-md-8"><strong>#${booking.bookingId}</strong></div>
                        </div>
                    </div>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Loại đơn:</div>
                            <div class="col-md-8">
                                <c:choose>
                                    <c:when test="${booking.bookingType == 'tour'}">
                                        <span class="badge bg-info">Tour du lịch</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">Sản phẩm</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Trạng thái:</div>
                            <div class="col-md-8">
                                <c:choose>
                                    <c:when test="${booking.status == 'pending'}">
                                        <span class="status-badge status-pending">
                                            <i class="fas fa-clock me-2"></i>Chờ xác nhận
                                        </span>
                                    </c:when>
                                    <c:when test="${booking.status == 'confirmed'}">
                                        <span class="status-badge status-confirmed">
                                            <i class="fas fa-check-circle me-2"></i>Đã xác nhận
                                        </span>
                                    </c:when>
                                    <c:when test="${booking.status == 'completed'}">
                                        <span class="status-badge status-completed">
                                            <i class="fas fa-check-double me-2"></i>Hoàn thành
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge status-cancelled">
                                            <i class="fas fa-times-circle me-2"></i>Đã hủy
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Ngày đặt:</div>
                            <div class="col-md-8">
                                <fmt:formatDate value="${booking.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Customer Information -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-user me-2"></i>Thông tin khách hàng
                    </h5>
                </div>
                <div class="card-body">
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Họ và tên:</div>
                            <div class="col-md-8"><strong>${booking.customerName}</strong></div>
                        </div>
                    </div>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Email:</div>
                            <div class="col-md-8">
                                <a href="mailto:${booking.customerEmail}">${booking.customerEmail}</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Số điện thoại:</div>
                            <div class="col-md-8">
                                <a href="tel:${booking.customerPhone}">${booking.customerPhone}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Booking Details -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-calendar-alt me-2"></i>Chi tiết đặt chỗ
                    </h5>
                </div>
                <div class="card-body">
                    <c:if test="${not empty booking.checkInDate}">
                        <div class="info-row">
                            <div class="row">
                                <div class="col-md-4 text-muted">Ngày bắt đầu:</div>
                                <div class="col-md-8">
                                    <strong><fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy"/></strong>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty booking.checkOutDate}">
                        <div class="info-row">
                            <div class="row">
                                <div class="col-md-4 text-muted">Ngày kết thúc:</div>
                                <div class="col-md-8">
                                    <strong><fmt:formatDate value="${booking.checkOutDate}" pattern="dd/MM/yyyy"/></strong>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-md-4 text-muted">Số người:</div>
                            <div class="col-md-8">
                                <strong>${booking.numberOfPeople} người</strong>
                            </div>
                        </div>
                    </div>
                    
                    <c:if test="${not empty booking.notes}">
                        <div class="info-row">
                            <div class="row">
                                <div class="col-md-4 text-muted">Ghi chú:</div>
                                <div class="col-md-8">${booking.notes}</div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4">
            <!-- Item Details -->
            <c:if test="${not empty itemDetails}">
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="mb-0">
                            <i class="fas fa-box-open me-2"></i>
                            <c:choose>
                                <c:when test="${booking.bookingType == 'tour'}">Thông tin Tour</c:when>
                                <c:otherwise>Thông tin Sản phẩm</c:otherwise>
                            </c:choose>
                        </h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${booking.bookingType == 'tour'}">
                                <c:if test="${not empty itemDetails.image}">
                                    <img src="${pageContext.request.contextPath}/img/${itemDetails.image}" 
                                         class="img-fluid rounded mb-3" alt="${itemDetails.name}">
                                </c:if>
                                <h6 class="mb-3">${itemDetails.name}</h6>
                                <p class="text-muted small">${itemDetails.description}</p>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${not empty itemDetails.image_url}">
                                    <img src="${pageContext.request.contextPath}/img/${itemDetails.image_url}" 
                                         class="img-fluid rounded mb-3" alt="${itemDetails.name}">
                                </c:if>
                                <h6 class="mb-3">${itemDetails.name}</h6>
                                <p class="text-muted small">${itemDetails.description}</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:if>
            
            <!-- Payment Summary -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-money-bill-wave me-2"></i>Tổng thanh toán
                    </h5>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <span>Số người:</span>
                        <strong>${booking.numberOfPeople}</strong>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <h5>Tổng cộng:</h5>
                        <h4 class="text-primary mb-0">
                            <fmt:formatNumber value="${booking.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                        </h4>
                    </div>
                </div>
            </div>
            
            <!-- Actions -->
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/MyBookingsServlet" 
                       class="btn btn-outline-primary w-100 rounded-pill mb-2">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                    </a>
                    <c:if test="${booking.status == 'pending'}">
                        <button class="btn btn-danger w-100 rounded-pill" onclick="alert('Vui lòng liên hệ với chúng tôi để hủy đơn đặt')">
                            <i class="fas fa-times me-2"></i>Yêu cầu hủy đơn
                        </button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="./inc/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
