<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chỉnh sửa Khách sạn - Admin</title>
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
                    <h1 class="h2">Chỉnh sửa Khách sạn</h1>
                    <a href="${pageContext.request.contextPath}/admin/hotels" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <form action="${pageContext.request.contextPath}/admin/hotels/edit" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="hotel_id" value="${hotel.hotel_id}">
                            
                            <div class="mb-3">
                                <label for="name" class="form-label">Tên khách sạn <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="name" name="name" value="${hotel.name}" required>
                            </div>

                            <div class="mb-3">
                                <label for="address" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="address" name="address" rows="2" required>${hotel.address}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="price_per_night" class="form-label">Giá/đêm (VND) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="price_per_night" name="price_per_night" 
                                           value="${hotel.price_per_night}" step="1000" min="0" required>
                                    <small class="text-muted">Ví dụ: 500000 cho 500,000₫</small>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="stars" class="form-label">Số sao <span class="text-danger">*</span></label>
                                    <select class="form-select" id="stars" name="stars" required>
                                        <option value="1" ${hotel.stars == 1 ? 'selected' : ''}>1 sao</option>
                                        <option value="2" ${hotel.stars == 2 ? 'selected' : ''}>2 sao</option>
                                        <option value="3" ${hotel.stars == 3 ? 'selected' : ''}>3 sao</option>
                                        <option value="4" ${hotel.stars == 4 ? 'selected' : ''}>4 sao</option>
                                        <option value="5" ${hotel.stars == 5 ? 'selected' : ''}>5 sao</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="destination_id" class="form-label">Destination ID</label>
                                    <input type="number" class="form-control" id="destination_id" name="destination_id" 
                                           value="${hotel.destination_id}" min="0">
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="tour_id" class="form-label">Tour ID</label>
                                    <input type="number" class="form-control" id="tour_id" name="tour_id" 
                                           value="${hotel.tour_id}" min="0">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="image" class="form-label">Ảnh khách sạn</label>
                                <input type="file" class="form-control" id="image" name="image" accept="image/*">
                                <small class="text-muted">Để trống nếu không muốn thay đổi ảnh</small>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Ảnh hiện tại:</label>
                                <div>
                                    <img src="${pageContext.request.contextPath}/uploads/hotels/${hotel.image_url}" 
                                         alt="${hotel.name}" 
                                         style="max-width: 300px; height: auto;"
                                         onerror="this.src='${pageContext.request.contextPath}/img/package-1.jpg'">
                                </div>
                                <small class="text-muted">File: ${hotel.image_url}</small>
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Lưu thay đổi
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/hotels" class="btn btn-secondary">
                                    Hủy
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
