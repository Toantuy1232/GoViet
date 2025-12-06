<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Đơn hàng - Admin</title>
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
                    <h2><i class="fas fa-receipt"></i> Quản lý Đơn hàng</h2>
                    <div>
                        <form method="get" class="d-inline">
                            <select name="status" class="form-select d-inline-block" style="width: auto;" onchange="this.form.submit()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="pending" ${statusFilter == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                <option value="processing" ${statusFilter == 'processing' ? 'selected' : ''}>Đang xử lý</option>
                                <option value="completed" ${statusFilter == 'completed' ? 'selected' : ''}>Hoàn thành</option>
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
                                <th>Mã đơn</th>
                                <th>Khách hàng</th>
                                <th>Tổng tiền</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái</th>
                                <th>Ngày đặt</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orders}" var="order">
                                <tr>
                                    <td><strong>${order.orderCode}</strong></td>
                                    <td>
                                        ${order.customerName}<br/>
                                        <small>${order.customerPhone}</small>
                                    </td>
                                    <td><fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.paymentStatus == 'pending'}">
                                                <span class="badge bg-warning">Chưa thanh toán</span>
                                            </c:when>
                                            <c:when test="${order.paymentStatus == 'paid'}">
                                                <span class="badge bg-success">Đã thanh toán</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Thất bại</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.orderStatus == 'pending'}">
                                                <span class="badge bg-warning">Chờ xử lý</span>
                                            </c:when>
                                            <c:when test="${order.orderStatus == 'processing'}">
                                                <span class="badge bg-info">Đang xử lý</span>
                                            </c:when>
                                            <c:when test="${order.orderStatus == 'completed'}">
                                                <span class="badge bg-success">Hoàn thành</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Đã hủy</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/orders/view?id=${order.orderId}" 
                                           class="btn btn-sm btn-primary" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty orders}">
                                <tr>
                                    <td colspan="7" class="text-center">Chưa có đơn hàng nào</td>
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
