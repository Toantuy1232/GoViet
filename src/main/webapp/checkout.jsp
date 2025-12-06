<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Thanh toán - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
    <%@include file="./inc/header.jsp" %>
    
    <div class="container-xxl py-5">
        <div class="container">
            <h2 class="mb-4"><i class="fas fa-shopping-cart"></i> Thanh toán</h2>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            
            <form method="post" action="${pageContext.request.contextPath}/checkout">
                <div class="row">
                    <!-- Thông tin khách hàng -->
                    <div class="col-lg-7">
                        <div class="bg-light rounded p-4 mb-4">
                            <h4 class="mb-3">Thông tin giao hàng</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Họ và tên *</label>
                                    <input type="text" name="customerName" class="form-control" required value="${user.fullname}">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại *</label>
                                    <input type="tel" name="customerPhone" class="form-control" required value="${user.phone}">
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Email *</label>
                                    <input type="email" name="customerEmail" class="form-control" required value="${user.email}">
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Địa chỉ giao hàng *</label>
                                    <textarea name="customerAddress" class="form-control" rows="3" required></textarea>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Ghi chú</label>
                                    <textarea name="notes" class="form-control" rows="2" placeholder="Ghi chú về đơn hàng..."></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="bg-light rounded p-4">
                            <h4 class="mb-3">Phương thức thanh toán</h4>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="cod" checked>
                                <label class="form-check-label" for="cod">
                                    <i class="fas fa-money-bill-wave"></i> Thanh toán khi nhận hàng (COD)
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="bank" value="bank_transfer">
                                <label class="form-check-label" for="bank">
                                    <i class="fas fa-university"></i> Chuyển khoản ngân hàng
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="momo" value="momo">
                                <label class="form-check-label" for="momo">
                                    <i class="fas fa-mobile-alt"></i> Ví MoMo
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="vnpay" value="vnpay">
                                <label class="form-check-label" for="vnpay">
                                    <i class="fas fa-credit-card"></i> VNPay
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Đơn hàng -->
                    <div class="col-lg-5">
                        <div class="bg-light rounded p-4">
                            <h4 class="mb-3">Đơn hàng của bạn</h4>
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th class="text-end">Tạm tính</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cart}" var="item">
                                        <tr>
                                            <td>
                                                ${item.productName} × ${item.quantity}
                                            </td>
                                            <td class="text-end">
                                                <fmt:formatNumber value="${item.subtotal}" type="number" groupingUsed="true"/>₫
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr class="border-top">
                                        <th>Tổng cộng</th>
                                        <th class="text-end text-primary">
                                            <fmt:formatNumber value="${total}" type="number" groupingUsed="true"/>₫
                                        </th>
                                    </tr>
                                </tfoot>
                            </table>
                            <button type="submit" class="btn btn-primary w-100 py-3 mt-3">
                                <i class="fas fa-check"></i> Đặt hàng
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
