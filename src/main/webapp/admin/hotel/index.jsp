<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hotels Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Hotels Management</h2>
            <a href="CreateHotelServlet" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Add New Hotel
            </a>
        </div>
        
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>
        
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Price/Night</th>
                                <th>Stars</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="hotel" items="${hotelsList}">
                                <tr>
                                    <td>${hotel.hotel_id}</td>
                                    <td>
                                        <c:if test="${not empty hotel.image_url}">
                                            <img src="${hotel.image_url}" alt="${hotel.name}" 
                                                 class="img-thumbnail" style="width: 50px; height: 50px; object-fit: cover;">
                                        </c:if>
                                        ${hotel.name}
                                    </td>
                                    <td>${hotel.address}</td>
                                    <td>$${hotel.price_per_night}</td>
                                    <td>
                                        <c:forEach begin="1" end="${hotel.stars}">
                                            <i class="bi bi-star-fill text-warning"></i>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <a href="EditHotelServlet?id=${hotel.hotel_id}" class="btn btn-sm btn-warning me-2">
                                            <i class="bi bi-pencil"></i> Edit
                                        </a>
                                        <a href="DeleteHotelServlet?id=${hotel.hotel_id}" 
                                           class="btn btn-sm btn-danger" 
                                           onclick="return confirm('Are you sure you want to delete this hotel?')">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <c:if test="${empty hotelsList}">
                                <tr>
                                    <td colspan="6" class="text-center">No hotels found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
