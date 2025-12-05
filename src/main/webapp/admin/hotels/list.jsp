<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Khách sạn - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="/admin/inc/sidebar.jsp" />
            
            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Quản lý Khách sạn</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <a href="${pageContext.request.contextPath}/admin/hotels/create" class="btn btn-sm btn-primary">
                            <i class="fas fa-plus"></i> Thêm khách sạn
                        </a>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ảnh</th>
                                <th>Tên khách sạn</th>
                                <th>Địa chỉ</th>
                                <th>Giá/đêm</th>
                                <th>Sao</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${hotelsList}" var="hotel">
                                <tr>
                                    <td>${hotel.hotel_id}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/uploads/hotels/${hotel.image_url}" 
                                             alt="${hotel.name}" 
                                             style="width: 80px; height: 60px; object-fit: cover;"
                                             onerror="this.src='${pageContext.request.contextPath}/img/package-1.jpg'">
                                    </td>
                                    <td>${hotel.name}</td>
                                    <td>${hotel.address}</td>
                                    <td>
                                        <fmt:formatNumber value="${hotel.price_per_night}" type="number" groupingUsed="true" maxFractionDigits="0"/>₫
                                    </td>
                                    <td>
                                        <c:forEach begin="1" end="${hotel.stars}">
                                            <i class="fas fa-star text-warning"></i>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/hotels/edit?id=${hotel.hotel_id}" 
                                           class="btn btn-sm btn-info">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/hotels/delete?id=${hotel.hotel_id}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa khách sạn này?')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <c:if test="${empty hotelsList}">
                        <div class="alert alert-info text-center">
                            <i class="fas fa-info-circle"></i> Chưa có khách sạn nào
                        </div>
                    </c:if>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
