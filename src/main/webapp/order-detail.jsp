<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chi tiết đơn hàng - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        .order-status {
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
        }
        .status-pending { background-color: #fff3cd; color: #856404; }
        .status-confirmed { background-color: #d1ecf1; color: #0c5460; }
        .status-completed { background-color: #d4edda; color: #155724; }
        .status-cancelled { background-color: #f8d7da; color: #721c24; }
        
        .order-timeline {
            position: relative;
            padding-left: 30px;
        }
        .order-timeline::before {
            content: '';
            position: absolute;
            left: 15px;
            top: 0;
            bottom: 0;
            width: 2px;
            background: #dee2e6;
        }
        .timeline-item {
            position: relative;
            margin-bottom: 20px;
        }
        .timeline-item::before {
            content: '';
            position: absolute;
            left: -23px;
            top: 5px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #6c757d;
        }
        .timeline-item.active::before {
            background: #28a745;
        }
        
        .info-card {
            background: #f8f9fa;
            border-left: 4px solid #007bff;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .print-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }
        
        @media print {
            .no-print { display: none !important; }
            .print-btn { display: none !important; }
        }
    </style>
</head>
<body>
    <%@include file="./inc/header.jsp" %>
    
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2><i class="fas fa-receipt me-2"></i>Chi tiết đơn hàng</h2>
                            <p class="text-muted mb-0">Mã đơn hàng: <strong>${order.orderCode}</strong></p>
                        </div>
                        <div class="no-print">
                            <button onclick="window.print()" class="btn btn-outline-primary me-2">
                                <i class="fas fa-print me-1"></i>In đơn hàng
                            </button>
                            <a href="${pageContext.request.contextPath}/my-bookings" class="btn btn-secondary">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <c:choose>
                <c:when test="${not empty order}">
                    <div class="row">
                  
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Thông tin đơn hàng</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Mã đơn hàng:</strong> ${order.orderCode}</p>
                                            <p><strong>Ngày đặt:</strong> 
                                                <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                            </p>
                                            <p><strong>Trạng thái:</strong> 
                                                <span class="order-status status-${order.status.toLowerCase()}">
                                                    <c:choose>
                                                        <c:when test="${order.status == 'PENDING'}">Chờ xác nhận</c:when>
                                                        <c:when test="${order.status == 'CONFIRMED'}">Đã xác nhận</c:when>
                                                        <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
                                                        <c:when test="${order.status == 'CANCELLED'}">Đã hủy</c:when>
                                                        <c:otherwise>${order.status}</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Tổng tiền:</strong> 
                                                <span class="text-primary fw-bold fs-5">
                                                    <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫
                                                </span>
                                            </p>
                                            <p><strong>Phương thức thanh toán:</strong> ${order.paymentMethod}</p>
                                            <p><strong>Số người:</strong> ${order.numberOfPeople} người</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                     
                            <div class="card mb-4">
                                <div class="card-header bg-info text-white">
                                    <h5 class="mb-0"><i class="fas fa-user me-2"></i>Thông tin khách hàng</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Họ tên:</strong> ${order.customerName}</p>
                                            <p><strong>Email:</strong> ${order.email}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Số điện thoại:</strong> ${order.phone}</p>
                                            <p><strong>Địa chỉ:</strong> ${order.address}</p>
                                        </div>
                                    </div>
                                    <c:if test="${not empty order.specialRequests}">
                                        <div class="info-card">
                                            <h6><i class="fas fa-comment me-2"></i>Yêu cầu đặc biệt:</h6>
                                            <p class="mb-0">${order.specialRequests}</p>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            
                     
                            <div class="card mb-4">
                                <div class="card-header bg-success text-white">
                                    <h5 class="mb-0"><i class="fas fa-calendar-check me-2"></i>Chi tiết booking</h5>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty order.tourName}">
                                        <div class="d-flex align-items-center mb-3">
                                            <c:if test="${not empty order.tourImage}">
                                                <img src="${pageContext.request.contextPath}/img/${order.tourImage}" 
                                                     class="rounded me-3" width="80" height="60" style="object-fit: cover;">
                                            </c:if>
                                            <div>
                                                <h6 class="mb-1">${order.tourName}</h6>
                                                <p class="text-muted mb-0">Tour du lịch</p>
                                            </div>
                                        </div>
                                    </c:if>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Ngày khởi hành:</strong> 
                                                <fmt:formatDate value="${order.bookingDate}" pattern="dd/MM/yyyy" />
                                            </p>
                                            <p><strong>Điểm đến:</strong> ${order.destinationName}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Thời gian:</strong> 
                                                <fmt:formatDate value="${order.bookingDate}" pattern="HH:mm" />
                                            </p>
                                            <p><strong>Danh mục:</strong> ${order.categoryName}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                 
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header bg-warning text-dark">
                                    <h5 class="mb-0"><i class="fas fa-history me-2"></i>Lịch sử đơn hàng</h5>
                                </div>
                                <div class="card-body">
                                    <div class="order-timeline">
                                        <div class="timeline-item active">
                                            <h6>Đơn hàng được tạo</h6>
                                            <p class="text-muted mb-0">
                                                <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                            </p>
                                        </div>
                                        
                                        <c:if test="${order.status == 'CONFIRMED' || order.status == 'COMPLETED'}">
                                            <div class="timeline-item active">
                                                <h6>Đơn hàng được xác nhận</h6>
                                                <p class="text-muted mb-0">
                                                    <c:choose>
                                                        <c:when test="${not empty order.confirmedAt}">
                                                            <fmt:formatDate value="${order.confirmedAt}" pattern="dd/MM/yyyy HH:mm" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            Đã xác nhận
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </c:if>
                                        
                                        <c:if test="${order.status == 'COMPLETED'}">
                                            <div class="timeline-item active">
                                                <h6>Hoàn thành</h6>
                                                <p class="text-muted mb-0">
                                                    <c:choose>
                                                        <c:when test="${not empty order.completedAt}">
                                                            <fmt:formatDate value="${order.completedAt}" pattern="dd/MM/yyyy HH:mm" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            Đã hoàn thành
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </c:if>
                                        
                                        <c:if test="${order.status == 'CANCELLED'}">
                                            <div class="timeline-item active">
                                                <h6>Đơn hàng bị hủy</h6>
                                                <p class="text-muted mb-0">
                                                    <c:choose>
                                                        <c:when test="${not empty order.cancelledAt}">
                                                            <fmt:formatDate value="${order.cancelledAt}" pattern="dd/MM/yyyy HH:mm" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            Đã hủy
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </c:if>
                                        
                                        <c:if test="${order.status == 'PENDING'}">
                                            <div class="timeline-item">
                                                <h6>Chờ xác nhận</h6>
                                                <p class="text-muted mb-0">Đang chờ xử lý</p>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="card mt-4 no-print">
                                <div class="card-header bg-secondary text-white">
                                    <h6 class="mb-0"><i class="fas fa-headset me-2"></i>Hỗ trợ khách hàng</h6>
                                </div>
                                <div class="card-body">
                                    <p class="mb-2">Cần hỗ trợ? Liên hệ với chúng tôi:</p>
                                    <p class="mb-1"><i class="fas fa-phone me-2"></i>Hotline: 1900-xxxx</p>
                                    <p class="mb-1"><i class="fas fa-envelope me-2"></i>Email: support@goviet.com</p>
                                    <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-primary btn-sm mt-2">
                                        <i class="fas fa-comment me-1"></i>Gửi yêu cầu hỗ trợ
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-5">
                        <i class="fas fa-exclamation-triangle fa-5x text-warning mb-3"></i>
                        <h3>Không tìm thấy đơn hàng</h3>
                        <p>Đơn hàng không tồn tại hoặc bạn không có quyền truy cập.</p>
                        
                        <div class="mt-4">
                            <a href="${pageContext.request.contextPath}/my-bookings" class="btn btn-primary">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại danh sách đơn hàng
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
 
    <button onclick="window.print()" class="btn btn-primary print-btn no-print">
        <i class="fas fa-print"></i>
    </button>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>