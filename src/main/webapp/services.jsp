<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Dịch vụ - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

    <!-- Header Start -->
    <jsp:include page="/inc/header.jsp" />
    <!-- Header End -->

    <!-- Services Hero Start -->
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h3 class="text-white display-3 mb-4">Dịch vụ khách sạn</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Dịch vụ</li>
            </ol>    
        </div>
    </div>
    <!-- Services Hero End -->

    <!-- Services Start -->
    <div class="container-fluid packages py-5">
        <div class="container py-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                <h5 class="section-title px-3">Khách sạn</h5>
                <h1 class="mb-0">Khám phá các khách sạn tốt nhất</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <c:forEach items="${hotels}" var="hotel">
                    <div class="col-lg-4 col-md-6">
                        <div class="packages-item h-100 d-flex flex-column">
                            <div class="packages-img">
                                <img src="${pageContext.request.contextPath}/assets/images/${hotel.image_url}"
                                     class="img-fluid w-100 rounded-top" 
                                     alt="${hotel.name}"
                                     style="height: 250px; object-fit: cover;"
                                     onerror="this.src='${pageContext.request.contextPath}/img/package-1.jpg'">
                                <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>Khách sạn ${hotel.stars} sao</small>
                                </div>
                                <div class="packages-price py-2 px-4">
                                    <fmt:formatNumber value="${hotel.price_per_night * 1000}" type="number" groupingUsed="true" maxFractionDigits="0"/>₫
                                </div>
                            </div>
                            <div class="packages-content bg-light d-flex flex-column flex-grow-1">
                                <div class="p-4 pb-0 flex-grow-1">
                                    <h5 class="mb-2" style="min-height: 50px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">${hotel.name}</h5>
                                    <div class="mb-3">
                                        <c:forEach begin="1" end="${hotel.stars}">
                                            <small class="fa fa-star text-primary"></small>
                                        </c:forEach>
                                        <c:forEach begin="${hotel.stars + 1}" end="5">
                                            <small class="fa fa-star text-muted"></small>
                                        </c:forEach>
                                    </div>
                                    <p class="mb-3" style="min-height: 60px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                        <i class="fas fa-map-marker-alt text-primary me-2"></i>
                                        ${hotel.address}
                                    </p>
                                </div>
                                <div class="row bg-primary rounded-bottom mx-0 mt-auto">
                                    <div class="col-4 text-start px-0">
                                        <a href="${pageContext.request.contextPath}/add-to-cart?type=hotel&itemId=${hotel.hotel_id}" class="btn-hover btn text-white py-2 px-3">
                                            <i class="fa fa-shopping-cart"></i>
                                        </a>
                                    </div>
                                    <div class="col-4 text-center px-0">
                                        <a href="${pageContext.request.contextPath}/hotel-detail?id=${hotel.hotel_id}" class="btn-hover btn text-white py-2 px-3">Chi tiết</a>
                                    </div>
                                    <div class="col-4 text-end px-0">
                                        <a href="${pageContext.request.contextPath}/booking?type=hotel&itemId=${hotel.hotel_id}" class="btn-hover btn text-white py-2 px-3">Đặt</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${empty hotels}">
                <div class="text-center py-5">
                    <i class="fas fa-hotel fa-5x text-muted mb-3"></i>
                    <h3 class="text-muted">Chưa có khách sạn nào</h3>
                    <p>Vui lòng quay lại sau</p>
                </div>
            </c:if>
        </div>
    </div>
    <!-- Services End -->

    <!-- Footer Start -->
    <jsp:include page="/inc/footer.jsp" />
    <!-- Footer End -->

    <!-- Copyright Start -->
    <div class="container-fluid copyright text-body py-4">
        <div class="container">
            <div class="row g-4 align-items-center">
                <div class="col-md-6 text-center text-md-end mb-md-0">
                    <i class="fas fa-copyright me-2"></i><a class="text-white" href="#">GoViet</a>, All right reserved.
                </div>
                <div class="col-md-6 text-center text-md-start">
                    Designed By <a class="text-white" href="https://htmlcodex.com">HTML Codex</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i class="fa fa-arrow-up"></i></a>   

    
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>
    

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
