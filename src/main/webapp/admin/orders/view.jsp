<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chi tiết Đơn hàng #${order.orderCode} - Admin</title>
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
                    <h2><i class="fas fa-receipt"></i> Chi tiết Đơn hàng #${order.orderCode}</h2>
                    <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-secondary">
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
                                    <td>${order.customerName}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${order.customerEmail}</td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại:</th>
                                    <td>${order.customerPhone}</td>
                                </tr>
                                <tr>
                                    <th>Địa chỉ:</th>
                                    <td>${order.customerAddress}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Thông tin đơn hàng -->
                    <div class="col-md-6 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-info-circle"></i> Thông tin đơn hàng</h5>
                            <table class="table table-borderless">
                                <tr>
                                    <th width="40%">Mã đơn:</th>
                                    <td><strong>${order.orderCode}</strong></td>
                                </tr>
                                <tr>
                                    <th>Tổng tiền:</th>
                                    <td class="text-primary fw-bold">
                                        <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫
                                    </td>
                                </tr>
                                <tr>
                                    <th>Thanh toán:</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.paymentMethod == 'cod'}">COD</c:when>
                                            <c:when test="${order.paymentMethod == 'bank_transfer'}">Chuyển khoản</c:when>
                                            <c:when test="${order.paymentMethod == 'momo'}">MoMo</c:when>
                                            <c:otherwise>VNPay</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Trạng thái TT:</th>
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
                                </tr>
                                <tr>
                                    <th>Trạng thái ĐH:</th>
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
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Sản phẩm -->
                    <div class="col-12 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-box"></i> Sản phẩm</h5>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tạm tính</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order.orderItems}" var="item">
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="${pageContext.request.contextPath}${item.productImage}" 
                                                         alt="${item.productName}" 
                                                         style="width: 50px; height: 50px; object-fit: cover;" 
                                                         class="me-2">
                                                    ${item.productName}
                                                </div>
                                            </td>
                                            <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/>₫</td>
                                            <td>${item.quantity}</td>
                                            <td><fmt:formatNumber value="${item.subtotal}" type="number" groupingUsed="true"/>₫</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr class="fw-bold">
                                        <td colspan="3" class="text-end">Tổng cộng:</td>
                                        <td class="text-primary">
                                            <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!-- Ghi chú -->
                    <c:if test="${not empty order.notes}">
                        <div class="col-12 mb-4">
                            <div class="bg-light rounded p-4">
                                <h5 class="mb-3"><i class="fas fa-sticky-note"></i> Ghi chú</h5>
                                <p>${order.notes}</p>
                            </div>
                        </div>
                    </c:if>

                    <!-- Hành động -->
                    <div class="col-12 mb-4">
                        <div class="bg-light rounded p-4">
                            <h5 class="mb-3"><i class="fas fa-cogs"></i> Cập nhật trạng thái</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Trạng thái đơn hàng:</label>
                                    <form method="post" action="${pageContext.request.contextPath}/admin/orders/updateStatus" class="d-flex gap-2">
                                        <input type="hidden" name="id" value="${order.orderId}">
                                        <input type="hidden" name="type" value="order">
                                        <select name="status" class="form-select">
                                            <option value="pending" ${order.orderStatus == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                            <option value="processing" ${order.orderStatus == 'processing' ? 'selected' : ''}>Đang xử lý</option>
                                            <option value="completed" ${order.orderStatus == 'completed' ? 'selected' : ''}>Hoàn thành</option>
                                            <option value="cancelled" ${order.orderStatus == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Trạng thái thanh toán:</label>
                                    <form method="post" action="${pageContext.request.contextPath}/admin/orders/updateStatus" class="d-flex gap-2">
                                        <input type="hidden" name="id" value="${order.orderId}">
                                        <input type="hidden" name="type" value="payment">
                                        <select name="status" class="form-select">
                                            <option value="pending" ${order.paymentStatus == 'pending' ? 'selected' : ''}>Chưa thanh toán</option>
                                            <option value="paid" ${order.paymentStatus == 'paid' ? 'selected' : ''}>Đã thanh toán</option>
                                            <option value="failed" ${order.paymentStatus == 'failed' ? 'selected' : ''}>Thất bại</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                    </form>
                                </div>
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
