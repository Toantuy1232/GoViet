<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .quantity-controls button {
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        
        .quantity-controls button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .cart-item-row {
            transition: all 0.3s ease;
        }
        
        .cart-item-row:hover {
            background-color: #f8f9fa;
        }
        
        .table th {
            border-top: none;
            font-weight: 600;
            color: #495057;
        }
        
        .btn-action {
            transition: all 0.2s ease;
        }
        
        .btn-action:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <%@include file="./inc/header.jsp" %>
    
    <div class="container-xxl py-5">
        <div class="container">
            <h2 class="mb-4"><i class="fas fa-shopping-cart me-2"></i>Giỏ hàng của bạn</h2>
            
            <c:choose>
                <c:when test="${not empty cart}">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Loại</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${cart}" var="item">
                                            <tr class="cart-item-row">
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="${pageContext.request.contextPath}/${item.imageUrl}" 
                                                             width="60" height="60" style="object-fit: cover;" class="me-3 rounded">
                                                        <div>
                                                            <div class="fw-bold">${item.itemName}</div>
                                                            <small class="text-muted">ID: ${item.itemId}</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <span class="badge ${item.type == 'tour' ? 'bg-info' : 'bg-warning'}">
                                                        ${item.type == 'tour' ? 'Tour' : 'Sản phẩm'}
                                                    </span>
                                                </td>
                                                <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/>₫</td>
                                                <td>
                                                    <div class="quantity-controls">
                                                        <button class="btn btn-outline-secondary btn-sm btn-action" 
                                                                onclick="updateQuantity(${item.itemId}, 'product', ${item.quantity - 1})"
                                                                ${item.quantity <= 1 ? 'disabled' : ''}
                                                                title="Giảm số lượng">
                                                            <i class="fas fa-minus"></i>
                                                        </button>
                                                        <span class="fw-bold text-primary mx-2">${item.quantity}</span>
                                                        <button class="btn btn-outline-secondary btn-sm btn-action" 
                                                                onclick="updateQuantity(${item.itemId}, 'product', ${item.quantity + 1})"
                                                                title="Tăng số lượng">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td><strong><fmt:formatNumber value="${item.total}" type="number" groupingUsed="true"/>₫</strong></td>
                                                <td>
                                                    <button class="btn btn-outline-danger btn-sm btn-action" 
                                                            onclick="removeFromCart(${item.itemId}, 'product')"
                                                            title="Xóa khỏi giỏ hàng">
                                                        <i class="fas fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bg-light rounded p-4">
                                <h4 class="mb-4">Tổng đơn hàng</h4>
                                <div class="d-flex justify-content-between mb-3">
                                    <span>Tổng cộng:</span>
                                    <strong><fmt:formatNumber value="${cartTotal}" type="number" groupingUsed="true"/>₫</strong>
                                </div>
                                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary w-100 py-3">
                                    Thanh toán
                                </a>
                                <a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary w-100 mt-2">
                                    Tiếp tục mua sắm
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-5">
                        <i class="fas fa-shopping-cart fa-5x text-muted mb-3"></i>
                        <h3>Giỏ hàng trống</h3>
                        <p>Hãy thêm tour hoặc khách sạn vào giỏ hàng</p>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-3">
                            Khám phá ngay
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function updateQuantity(itemId, type, newQuantity) {
            if (newQuantity < 1) {
                return;
            }
            
            console.log('Updating quantity:', {itemId, type, newQuantity});
            
       
            showLoading();
            
            $.ajax({
                url: '${pageContext.request.contextPath}/UpdateCartServlet',
                type: 'POST',
                data: {
                    action: 'update',
                    itemId: itemId,
                    type: type,
                    quantity: newQuantity
                },
                success: function(response) {
                    console.log('Update success:', response);
                    location.reload();
                },
                error: function(xhr, status, error) {
                    hideLoading();
                    console.error('Update error:', {xhr, status, error});
                    console.error('Response text:', xhr.responseText);
                    
                    let errorMessage = 'Có lỗi xảy ra khi cập nhật giỏ hàng';
                    try {
                        const errorData = JSON.parse(xhr.responseText);
                        errorMessage = errorData.error || errorMessage;
                    } catch (e) {
                      
                    }
                    
                    alert(errorMessage);
                }
            });
        }
        
        function removeFromCart(itemId, type) {
            if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                console.log('Removing from cart:', {itemId, type});
                
                showLoading();
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/UpdateCartServlet',
                    type: 'POST',
                    data: {
                        action: 'remove',
                        itemId: itemId,
                        type: type
                    },
                    success: function(response) {
                        console.log('Remove success:', response);
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        hideLoading();
                        console.error('Remove error:', {xhr, status, error});
                        console.error('Response text:', xhr.responseText);
                        
                        let errorMessage = 'Có lỗi xảy ra khi xóa sản phẩm';
                        try {
                            const errorData = JSON.parse(xhr.responseText);
                            errorMessage = errorData.error || errorMessage;
                        } catch (e) {
                           
                        }
                        
                        alert(errorMessage);
                    }
                });
            }
        }
        
        function showLoading() {
            if ($('#loading').length === 0) {
                $('body').append(`
                    <div id="loading" class="position-fixed top-0 start-0 w-100 h-100 d-flex justify-content-center align-items-center" 
                         style="background: rgba(0,0,0,0.5); z-index: 9999;">
                        <div class="spinner-border text-light" role="status">
                            <span class="visually-hidden">Đang xử lý...</span>
                        </div>
                    </div>
                `);
            }
        }
        
        function hideLoading() {
            $('#loading').remove();
        }
    </script>
</body>
</html>
