<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chi tiết Đặt chỗ #${booking.id} - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <%@include file="../inc/sidebar.jsp" %>
        <div class="content">
            <%@include file="../inc/navbar.jsp" %>
            <div class="container-fluid pt-4 px-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-calendar-check"></i> Chi tiết Đặt chỗ #${booking.id}</h2>
                    <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                </div>

                <div class="row">
                    <!-- Thông tin khách hàng -->
                    <div class="col-md-6 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-user"></i> Thông tin khách hàng</h5>
                            <table class="table table-borderless">
                                <tr>
                                    <th width="40%">Họ tên:</th>
                                    <td>${booking.customerName}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${booking.customerEmail}</td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại:</th>
                                    <td>${booking.customerPhone}</td>
                                </tr>
                                <tr>
                                    <th>User ID:</th>
                                    <td>${booking.userId == 0 ? 'Guest' : booking.userId}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Thông tin đặt chỗ -->
                    <div class="col-md-6 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-info-circle"></i> Thông tin đặt chỗ</h5>
                            <table class="table table-borderless">
                                <tr>
                                    <th width="40%">Loại:</th>
                                    <td>
                                        <span class="badge ${booking.bookingType == 'tour' ? 'bg-info' : 'bg-warning'}">
                                            ${booking.bookingType == 'tour' ? 'Tour' : 'Khách sạn'}
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Ngày bắt đầu:</th>
                                    <td>${booking.checkInDate}</td>
                                </tr>
                                <tr>
                                    <th>Ngày kết thúc:</th>
                                    <td>${booking.checkOutDate != null ? booking.checkOutDate : 'N/A'}</td>
                                </tr>
                                <tr>
                                    <th>Số người:</th>
                                    <td>${booking.numberOfPeople}</td>
                                </tr>
                                <tr>
                                    <th>Tổng tiền:</th>
                                    <td class="text-primary fw-bold">
                                        <fmt:formatNumber value="${booking.totalPrice}" type="number" groupingUsed="true"/>₫
                                    </td>
                                </tr>
                                <tr>
                                    <th>Trạng thái:</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${booking.status == 'pending'}">
                                                <span class="badge bg-warning">Chờ xác nhận</span>
                                            </c:when>
                                            <c:when test="${booking.status == 'confirmed'}">
                                                <span class="badge bg-success">Đã xác nhận</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Đã hủy</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Thông tin tour/hotel -->
                    <c:if test="${product != null}">
                        <div class="col-md-12 mb-4">
                            <div class="bg-light rounded p-4">
                                <h5 class="mb-3"><i class="fas fa-map-marked-alt"></i> Thông tin ${booking.bookingType == 'tour' ? 'Tour' : 'Khách sạn'}</h5>
                                <div class="row">
                                    <div class="col-md-3">
                                        <img src="${pageContext.request.contextPath}${product.image_url}" 
                                             alt="${product.name}" 
                                             class="img-fluid rounded">
                                    </div>
                                    <div class="col-md-9">
                                        <h4>${product.name}</h4>
                                        <p>${product.description}</p>
                                        <p><strong>Giá:</strong> <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>₫</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Ghi chú -->
                    <c:if test="${booking.notes != null && !booking.notes.isEmpty()}">
                        <div class="col-md-12 mb-4">
                            <div class="bg-light rounded p-4">
                                <h5 class="mb-3"><i class="fas fa-sticky-note"></i> Ghi chú</h5>
                                <p>${booking.notes}</p>
                            </div>
                        </div>
                    </c:if>

                    <!-- Thời gian -->
                    <div class="col-md-12 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-clock"></i> Thời gian</h5>
                            <table class="table table-borderless">
                                <tr>
                                    <th width="20%">Ngày tạo:</th>
                                    <td><fmt:formatDate value="${booking.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                </tr>
                                <tr>
                                    <th>Cập nhật lần cuối:</th>
                                    <td><fmt:formatDate value="${booking.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Hành động -->
                    <div class="col-md-12 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-cogs"></i> Hành động</h5>
                            <div class="btn-group" role="group">
                                <c:if test="${booking.status != 'confirmed'}">
                                    <form method="post" action="${pageContext.request.contextPath}/admin/bookings/updateStatus" class="d-inline">
                                        <input type="hidden" name="id" value="${booking.id}">
                                        <input type="hidden" name="status" value="confirmed">
                                        <button type="submit" class="btn btn-success">
                                            <i class="fas fa-check"></i> Xác nhận
                                        </button>
                                    </form>
                                </c:if>
                                <c:if test="${booking.status != 'cancelled'}">
                                    <form method="post" action="${pageContext.request.contextPath}/admin/bookings/updateStatus" class="d-inline ms-2">
                                        <input type="hidden" name="id" value="${booking.id}">
                                        <input type="hidden" name="status" value="cancelled">
                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn hủy đơn đặt chỗ này?')">
                                            <i class="fas fa-times"></i> Hủy đơn
                                        </button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../inc/footer.jsp" %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
