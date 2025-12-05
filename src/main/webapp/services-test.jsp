<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Danh sách khách sạn</h1>
        
        <c:if test="${empty hotels}">
            <div class="alert alert-warning">Không có dữ liệu khách sạn</div>
        </c:if>
        
        <div class="row">
            <c:forEach items="${hotels}" var="hotel">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/${hotel.image_url}" class="card-img-top" alt="${hotel.name}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${hotel.name}</h5>
                            <p class="card-text"><i class="fas fa-map-marker-alt"></i> ${hotel.address}</p>
                            <p class="card-text"><strong>${hotel.price_per_night} VNĐ</strong>/đêm</p>
                            <p class="card-text">
                                <c:forEach begin="1" end="${hotel.stars}">⭐</c:forEach>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
