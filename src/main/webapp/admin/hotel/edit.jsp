<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h2 class="mb-4">Edit Hotel</h2>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
                
                <c:if test="${not empty hotel}">
                    <form action="EditHotelServlet" method="POST">
                        <input type="hidden" name="id" value="${hotel.hotel_id}">
                        
                        <div class="mb-3">
                            <label for="destination_id" class="form-label">Destination ID</label>
                            <input type="number" class="form-control" id="destination_id" name="destination_id" 
                                   value="${hotel.destination_id}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Hotel Name</label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="${hotel.name}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" 
                                   value="${hotel.address}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="price_per_night" class="form-label">Price per Night</label>
                            <input type="number" step="0.01" class="form-control" id="price_per_night" 
                                   name="price_per_night" value="${hotel.price_per_night}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="stars" class="form-label">Stars</label>
                            <select class="form-control" id="stars" name="stars" required>
                                <option value="1" ${hotel.stars == 1 ? 'selected' : ''}>1 Star</option>
                                <option value="2" ${hotel.stars == 2 ? 'selected' : ''}>2 Stars</option>
                                <option value="3" ${hotel.stars == 3 ? 'selected' : ''}>3 Stars</option>
                                <option value="4" ${hotel.stars == 4 ? 'selected' : ''}>4 Stars</option>
                                <option value="5" ${hotel.stars == 5 ? 'selected' : ''}>5 Stars</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="image_url" class="form-label">Image URL</label>
                            <input type="url" class="form-control" id="image_url" name="image_url" 
                                   value="${hotel.image_url}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="tour_id" class="form-label">Tour ID</label>
                            <input type="number" class="form-control" id="tour_id" name="tour_id" 
                                   value="${hotel.tour_id}" required>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="IndexHotelServlet" class="btn btn-secondary me-md-2">Cancel</a>
                            <button type="submit" class="btn btn-primary">Update Hotel</button>
                        </div>
                    </form>
                </c:if>
                
                <c:if test="${empty hotel}">
                    <div class="alert alert-warning">Hotel not found.</div>
                    <a href="IndexHotelServlet" class="btn btn-secondary">Back to List</a>
                </c:if>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
