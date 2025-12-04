<%@page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt tour thành công</title>
    <!-- Add your CSS and JS includes here -->
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body text-center p-5">
                        <div class="mb-4">
                            <i class="fas fa-check-circle text-success" style="font-size: 5rem;"></i>
                        </div>
                        <h2 class="text-success mb-4">Đặt Tour Thành Công!</h2>
                        <p class="lead">Cảm ơn bạn đã đặt tour tại GoViet.</p>
                        <p>Chúng tôi đã nhận được yêu cầu đặt tour của bạn và sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận.</p>

                        <div class="booking-details mt-4 p-4 bg-light rounded">
                            <h5 class="mb-3">Thông tin đặt tour</h5>
                            <div class="row text-start">
                                <div class="col-md-6 mb-2">
                                    <strong>Mã đơn hàng:</strong> ${booking.booking_id}
                                </div>
                                <div class="col-md-6 mb-2">
                                    <strong>Ngày đặt:</strong> ${booking.booking_date}
                                </div>
                                <div class="col-md-6 mb-2">
                                    <strong>Số lượng người:</strong> ${booking.number_of_people}
                                </div>
                                <div class="col-md-6 mb-2">
                                    <strong>Tổng tiền:</strong>
                                    <span class="text-danger fw-bold">
                                        <fmt:formatNumber value="${booking.total_price}" type="number" /> VNĐ
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi qua:</p>
                            <p>
                                <i class="fas fa-phone me-2"></i> 0123 456 789<br>
                                <i class="fas fa-envelope me-2"></i> info@goviet.com
                            </p>
                        </div>

                        <div class="mt-4">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary me-2">
                                <i class="fas fa-home me-1"></i> Về trang chủ
                            </a>
                            <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline-primary">
                                <i class="fas fa-user me-1"></i> Xem lịch sử đặt tour
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>