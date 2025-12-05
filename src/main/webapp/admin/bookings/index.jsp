<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Đặt chỗ - Admin</title>
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
                    <h2><i class="fas fa-calendar-check"></i> Quản lý Đặt chỗ</h2>
                    <div>
                        <form method="get" class="d-inline">
                            <select name="status" class="form-select d-inline-block" style="width: auto;" onchange="this.form.submit()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="pending" ${statusFilter == 'pending' ? 'selected' : ''}>Chờ xác nhận</option>
                                <option value="confirmed" ${statusFilter == 'confirmed' ? 'selected' : ''}>Đã xác nhận</option>
                                <option value="cancelled" ${statusFilter == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                            </select>
                        </form>
                    </div>
                </div>

                <c:if test="${param.success == 'updated'}">
                    <div class="alert alert-success">Cập nhật trạng thái thành công!</div>
                </c:if>

                <div class="bg-light rounded p-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Loại</th>
                                <th>Khách hàng</th>
                                <th>Email/SĐT</th>
                                <th>Ngày đặt</th>
                                <th>Số người</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookings}" var="booking">
                                <tr>
                                    <td>${booking.id}</td>
                                    <td>
                                        <span class="badge ${booking.bookingType == 'tour' ? 'bg-info' : 'bg-warning'}">
                                            ${booking.bookingType == 'tour' ? 'Tour' : 'Khách sạn'}
                                        </span>
                                    </td>
                                    <td>${booking.customerName}</td>
                                    <td>
                                        ${booking.customerEmail}<br/>
                                        <small>${booking.customerPhone}</small>
                                    </td>
                                    <td>${booking.checkInDate}</td>
                                    <td>${booking.numberOfPeople}</td>
                                    <td><fmt:formatNumber value="${booking.totalPrice}" type="number" groupingUsed="true"/>₫</td>
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
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-info dropdown-toggle" data-bs-toggle="dropdown">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <form method="post" action="${pageContext.request.contextPath}/admin/bookings/updateStatus">
                                                        <input type="hidden" name="id" value="${booking.id}">
                                                        <input type="hidden" name="status" value="confirmed">
                                                        <button type="submit" class="dropdown-item">Xác nhận</button>
                                                    </form>
                                                </li>
                                                <li>
                                                    <form method="post" action="${pageContext.request.contextPath}/admin/bookings/updateStatus">
                                                        <input type="hidden" name="id" value="${booking.id}">
                                                        <input type="hidden" name="status" value="cancelled">
                                                        <button type="submit" class="dropdown-item">Hủy</button>
                                                    </form>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty bookings}">
                                <tr>
                                    <td colspan="9" class="text-center">Chưa có đơn đặt chỗ nào</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <%@include file="../inc/footer.jsp" %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
