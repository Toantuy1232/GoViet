<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Đặt ${itemType == 'hotel' ? 'Khách sạn' : 'Tour'} - GoViet</title>
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
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="bg-light rounded p-5">
                        <h2 class="mb-4">Đặt ${itemType == 'hotel' ? 'Khách sạn' : 'Tour'}</h2>
                        <h4 class="text-primary mb-4">${itemName}</h4>
                        
                        <form method="post" action="${pageContext.request.contextPath}/booking">
                            <input type="hidden" name="bookingType" value="${itemType}">
                            <input type="hidden" name="itemId" value="${itemId}">
                            
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Họ và tên *</label>
                                    <input type="text" name="customerName" class="form-control" required value="${user.fullname}">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Email *</label>
                                    <input type="email" name="customerEmail" class="form-control" required value="${user.email}">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại *</label>
                                    <input type="tel" name="customerPhone" class="form-control" required value="${user.phone}">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số người *</label>
                                    <input type="number" name="numberOfPeople" id="numberOfPeople" class="form-control" min="1" value="1" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Ngày ${itemType == 'hotel' ? 'nhận phòng' : 'khởi hành'} *</label>
                                    <input type="date" name="checkInDate" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Ngày ${itemType == 'hotel' ? 'trả phòng' : 'kết thúc'}</label>
                                    <input type="date" name="checkOutDate" class="form-control">
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Ghi chú</label>
                                    <textarea name="notes" class="form-control" rows="3"></textarea>
                                </div>
                                <div class="col-12">
                                    <div class="alert alert-info">
                                        <h5>Tổng tiền: <span id="totalPrice"><fmt:formatNumber value="${itemPrice}" type="number" groupingUsed="true"/></span>₫</h5>
                                        <input type="hidden" name="totalPrice" id="totalPriceInput" value="${itemPrice}">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100 py-3">Xác nhận đặt chỗ</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="./inc/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const basePrice = ${itemPrice};
        document.getElementById('numberOfPeople').addEventListener('change', function() {
            const people = parseInt(this.value) || 1;
            const total = basePrice * people;
            document.getElementById('totalPrice').textContent = total.toLocaleString('vi-VN');
            document.getElementById('totalPriceInput').value = total;
        });
    </script>
</body>
</html>
