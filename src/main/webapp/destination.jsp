<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title>Điểm đến du lịch | GoViet</title>
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

    <style>
        .destination-card {
            transition: transform 0.3s;
            margin-bottom: 30px;
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .destination-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .destination-img {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        .section-title {
            position: relative;
            margin-bottom: 40px;
            text-align: center;
        }
        .section-title:after {
            content: '';
            display: block;
            width: 80px;
            height: 3px;
            background: #007bff;
            margin: 20px auto 0;
        }
    </style>
</head>

<body>
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Hero Start -->
    <div class="container-fluid bg-light py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 text-center text-lg-start">
                    <h1 class="display-4 text-dark mb-4">Khám phá điểm đến</h1>
                    <p class="text-dark-50 mb-4">Tìm kiếm và khám phá những điểm đến du lịch hấp dẫn nhất</p>
                </div>
                <div class="col-lg-6 text-center text-lg-start">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->

    <!-- Destinations Section -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h6 class="text-primary text-uppercase">Điểm đến</h6>
                <h1 class="mb-5">Điểm đến nổi bật</h1>
            </div>
            <div class="row g-4">
                <c:forEach var="destination" items="${destinations}">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="package-item">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/img/${destination.image_url}" alt="${destination.name}" style="height: 250px; object-fit: cover;">
                                <div class="bg-white text-primary font-weight-bold py-1 px-3" style="position: absolute; top: 10px; right: 10px; border-radius: 15px;">
                                    <i class="fas fa-map-marker-alt me-1"></i> ${destination.name}
                                </div>
                            </div>
                            <div class="d-flex border-bottom">
                                <small class="flex-fill text-center border-end py-2"><i class="fas fa-map-marker-alt text-primary me-2"></i>${destination.name}</small>
                            </div>
                            <div class="text-center p-4">
                                <h3 class="mb-0">${destination.name}</h3>
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="tour?destination_id=${destination.destination_id}" class="btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Xem thêm</a>
                                    <a href="tour?destination_id=${destination.destination_id}" class="btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty destinations}">
                    <div class="col-12 text-center py-5">
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>Hiện chưa có điểm đến nào.
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Destinations End -->

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
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>