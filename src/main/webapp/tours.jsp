<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Tour Du Lịch | GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white mb-4 animated slideInDown">
                <c:choose>
                    <c:when test="${not empty selectedCategory}">
                        ${selectedCategory.name}
                    </c:when>
                    <c:otherwise>
                        Tất cả Tour Du Lịch
                    </c:otherwise>
                </c:choose>
            </h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tour</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Tours Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row">
                <!-- Sidebar Danh mục -->
                <div class="col-lg-3 col-md-4 mb-4">
                    <div class="bg-light rounded p-4 sticky-top" style="top: 100px;">
                        <h4 class="mb-4 text-primary">
                            <i class="fas fa-list me-2"></i>Danh mục
                        </h4>
                        <div class="d-flex flex-column">
                            <!-- Tất cả tour -->
                            <a href="${pageContext.request.contextPath}/tours" 
                               class="d-flex align-items-center p-3 mb-2 rounded ${empty selectedCategory ? 'bg-primary text-white' : 'bg-white text-dark border'} text-decoration-none">
                                <i class="fas fa-globe me-3"></i>
                                <span class="fw-bold">Tất cả Tour</span>
                            </a>
                            
                            <!-- Danh sách danh mục từ database -->
                            <c:forEach var="category" items="${categories}">
                                <a href="${pageContext.request.contextPath}/tours?categoryId=${category.id}" 
                                   class="d-flex align-items-center p-3 mb-2 rounded ${selectedCategory != null && selectedCategory.id == category.id ? 'bg-primary text-white' : 'bg-white text-dark border'} text-decoration-none">
                                    <i class="fas fa-map-marker-alt me-3"></i>
                                    <span>${category.name}</span>
                                </a>
                            </c:forEach>
                        </div>
                        
                        <!-- Thông tin thêm -->
                        <div class="mt-4 p-3 bg-primary text-white rounded">
                            <h6 class="mb-2">
                                <i class="fas fa-info-circle me-2"></i>Thông tin
                            </h6>
                            <p class="mb-0 small">
                                Khám phá những tour du lịch hấp dẫn với giá cả phải chăng và dịch vụ tốt nhất.
                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Danh sách tour -->
                <div class="col-lg-9 col-md-8">
                    <!-- Thông tin lọc -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h5 class="mb-0">
                                <c:choose>
                                    <c:when test="${not empty selectedCategory}">
                                        Tour ${selectedCategory.name}
                                    </c:when>
                                    <c:otherwise>
                                        Tất cả Tour Du Lịch
                                    </c:otherwise>
                                </c:choose>
                            </h5>
                            <small class="text-muted">Tìm thấy ${fn:length(tours)} tour</small>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-sort me-2"></i>Sắp xếp
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Giá thấp đến cao</a></li>
                                <li><a class="dropdown-item" href="#">Giá cao đến thấp</a></li>
                                <li><a class="dropdown-item" href="#">Mới nhất</a></li>
                                <li><a class="dropdown-item" href="#">Phổ biến nhất</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="row g-4">
                        <c:forEach items="${tours}" var="tour">
                            <div class="col-lg-6 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="package-item h-100 border rounded overflow-hidden">
                                    <div class="overflow-hidden position-relative">
                                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/img/${tour.main_image}" 
                                             alt="${tour.title}" style="height: 200px; object-fit: cover;">
                                        <div class="position-absolute top-0 end-0 m-3">
                                            <span class="badge bg-primary">${tour.duration_days} ngày</span>
                                        </div>
                                    </div>
                                    <div class="p-4">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <h5 class="mb-0 text-truncate">${tour.title}</h5>
                                            <div class="text-end">
                                                <h6 class="text-primary mb-0">
                                                    <fmt:formatNumber value="${tour.price * 1000}" type="number" groupingUsed="true"/>₫
                                                </h6>
                                                <c:if test="${tour.price_old > 0}">
                                                    <small class="text-muted text-decoration-line-through">
                                                        <fmt:formatNumber value="${tour.price_old * 1000}" type="number" groupingUsed="true"/>₫
                                                    </small>
                                                </c:if>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex align-items-center mb-3">
                                            <small class="text-muted me-3">
                                                <i class="fas fa-calendar-alt me-1"></i>
                                                <fmt:formatDate value="${tour.start_date}" pattern="dd/MM/yyyy"/>
                                            </small>
                                            <small class="text-muted">
                                                <i class="fas fa-users me-1"></i>
                                                Còn ${tour.available_slots} chỗ
                                            </small>
                                        </div>
                                        
                                        <p class="text-muted mb-3" style="height: 60px; overflow: hidden;">
                                            ${tour.description}
                                        </p>
                                        
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <small class="fa fa-star text-warning"></small>
                                                </c:forEach>
                                                <small class="text-muted ms-2">(4.8)</small>
                                            </div>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/tour-detail?id=${tour.tour_id}" 
                                                   class="btn btn-sm btn-outline-primary me-2">
                                                    <i class="fas fa-eye me-1"></i>Chi tiết
                                                </a>
                                                <a href="${pageContext.request.contextPath}/booking?tourId=${tour.tour_id}" 
                                                   class="btn btn-sm btn-primary">
                                                    <i class="fas fa-calendar-check me-1"></i>Đặt ngay
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                        <c:if test="${empty tours}">
                            <div class="col-12">
                                <div class="alert alert-info text-center py-5">
                                    <i class="fas fa-info-circle fa-3x mb-3 text-primary"></i>
                                    <h4>Hiện chưa có tour nào</h4>
                                    <p class="mb-0">
                                        <c:choose>
                                            <c:when test="${not empty selectedCategory}">
                                                Danh mục "${selectedCategory.name}" hiện chưa có tour nào. Vui lòng chọn danh mục khác.
                                            </c:when>
                                            <c:otherwise>
                                                Hiện tại chưa có tour nào. Vui lòng quay lại sau.
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    
                    <!-- Pagination (nếu cần) -->
                    <c:if test="${not empty tours && fn:length(tours) > 0}">
                        <div class="d-flex justify-content-center mt-5">
                            <nav aria-label="Tour pagination">
                                <ul class="pagination">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Trước</a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Sau</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Tours End -->

    <!-- Footer Start -->
    <%@include file="./inc/footer.jsp" %>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>