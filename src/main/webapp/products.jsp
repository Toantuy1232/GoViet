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

    <!-- Products Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Tour</h6>
                <h1 class="mb-5">Các Tour Du Lịch Hấp Dẫn</h1>
            </div>
            
            <div class="row g-4">
                <c:forEach items="${products}" var="product">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="package-item">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/${product.image_url}" 
                                     alt="${product.name}" style="height: 250px; width: 100%; object-fit: cover;">
                            </div>
                            <div class="d-flex border-bottom">
                                <small class="flex-fill text-center border-end py-2">
                                    <i class="fa fa-map-marker-alt text-primary me-2"></i>Tour
                                </small>
                                <small class="flex-fill text-center border-end py-2">
                                    <i class="fa fa-calendar-alt text-primary me-2"></i>Linh hoạt
                                </small>
                                <small class="flex-fill text-center py-2">
                                    <i class="fa fa-user text-primary me-2"></i>Còn ${product.stock} chỗ
                                </small>
                            </div>
                            <div class="text-center p-4">
                                <h3 class="mb-0">
                                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>₫
                                </h3>
                                <div class="mb-3">
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                    <small class="fa fa-star text-primary"></small>
                                </div>
                                <p class="text-truncate" style="height: 48px;">${product.name}</p>
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" 
                                       class="btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">
                                        Xem chi tiết
                                    </a>
                                    <a href="${pageContext.request.contextPath}/booking?productId=${product.id}" 
                                       class="btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">
                                        Đặt ngay
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <c:if test="${empty products}">
                    <div class="col-12">
                        <div class="alert alert-info text-center">
                            <i class="fas fa-info-circle fa-3x mb-3"></i>
                            <h4>Hiện chưa có điểm đến nào</h4>
                            <p>Vui lòng quay lại sau hoặc chọn danh mục khác</p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Products End -->

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
