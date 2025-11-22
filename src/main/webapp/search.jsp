<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <title>Kết quả tìm kiếm - GoViet</title>
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
        /* Tour Card Styles */
        .tour-card {
            margin-bottom: 30px;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            height: 100%;
            background: #fff;
        }
        .tour-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .tour-image {
            height: 220px;
            width: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .tour-card:hover .tour-image {
            transform: scale(1.05);
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: #2c3e50;
            font-size: 1.1rem;
            line-height: 1.4;
        }
        .card-text {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1.25rem;
            line-height: 1.6;
        }
        .price {
            color: #ff6b6b;
            font-weight: 700;
            font-size: 1.3rem;
        }
        .price-old {
            text-decoration: line-through;
            color: #adb5bd;
            font-size: 0.95rem;
            margin-left: 8px;
        }
        .discount-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: linear-gradient(45deg, #ff6b6b, #ff8e8e);
            color: white;
            padding: 6px 12px;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            z-index: 1;
        }
        .btn-detail {
            background: #1a73e8;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-detail:hover {
            background: #1557b0;
            transform: translateY(-2px);
        }
        /* Search Info Section */
        .search-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 40px;
            border: 1px solid #e9ecef;
        }
        .search-info h2 {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 20px;
            font-size: 1.8rem;
        }
        .search-info p {
            color: #495057;
            font-size: 1rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }
        .search-info i {
            margin-right: 8px;
            color: #1a73e8;
            font-size: 1.1rem;
            min-width: 20px;
            text-align: center;
        }
        /* No Results Styling */
        .no-results {
            padding: 60px 20px;
            text-align: center;
            background: #f8f9fa;
            border-radius: 12px;
            margin: 30px 0;
        }
        .no-results i {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
            display: block;
        }
        .no-results h3 {
            color: #495057;
            font-weight: 600;
            margin-bottom: 15px;
        }
        .no-results p {
            color: #6c757d;
            margin-bottom: 25px;
            font-size: 1.05rem;
        }
    </style>
</head>
<body>
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-4 text-white mb-4 animated slideInDown">Kết quả tìm kiếm</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HomeServlet">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Kết quả tìm kiếm</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Search Result Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="search-info">
                <h2><i class="bi bi-search me-2"></i> Kết quả tìm kiếm</h2>
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <c:if test="${not empty searchTerm}">
                            <p class="mb-2"><i class="bi bi-search"></i> <strong>Từ khóa:</strong> <span class="badge bg-primary">${searchTerm}</span></p>
                        </c:if>
                        <c:if test="${not empty selectedCategoryId && selectedCategoryId != '0'}">
                            <p class="mb-2"><i class="bi bi-tag"></i> <strong>Danh mục:</strong>
                                <c:forEach items="${categories}" var="category">
                                    <c:if test="${category.id == selectedCategoryId}">
                                        <span class="badge bg-info text-dark">${category.name}</span>
                                    </c:if>
                                </c:forEach>
                            </p>
                        </c:if>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <div class="d-inline-block p-2 bg-white rounded-pill shadow-sm">
                            <i class="bi bi-box-seam text-primary me-2"></i>
                            <span class="fw-bold">${totalRecords}</span> kết quả tìm thấy
                        </div>
                    </div>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty toursList}">
                    <div class="row">
                        <c:forEach items="${toursList}" var="tour">
                            <div class="col-md-4 mb-4">
                                <div class="card tour-card h-100">
                                    <div class="position-relative">
                                        <img src="${pageContext.request.contextPath}/img/${tour.main_image}"
                                             class="card-img-top tour-image"
                                             alt="${tour.title}">
                                        <c:if test="${tour.price_old > 0 && tour.price_old > tour.price}">
                                            <c:set var="discount" value="${((tour.price_old - tour.price) / tour.price_old) * 100}" />
                                            <span class="discount-badge">Giảm ${discount.intValue()}%</span>
                                        </c:if>
                                    </div>
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">${tour.title}</h5>
                                        <p class="card-text flex-grow-1">${tour.description.length() > 100 ? tour.description.substring(0, 100) : tour.description}...</p>
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <div>
                                                <span class="price"><fmt:formatNumber value="${tour.price * 1000}" type="number" maxFractionDigits="0" /> VNĐ</span>
                                                <c:if test="${tour.price_old > 0 && tour.price_old > tour.price}">
                                                    <span class="price-old"><fmt:formatNumber value="${tour.price_old * 1000}" type="number" maxFractionDigits="0" /> VNĐ</span>
                                                </c:if>
                                            </div>
                                            <a href="TourDetailServlet?tourId=${tour.tour_id}" class="btn btn-detail text-white">
                                                <i class="bi bi-arrow-right me-1"></i> Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage - 1}&searchTerm=${searchTerm}&categoryId=${selectedCategoryId}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}&searchTerm=${searchTerm}&categoryId=${selectedCategoryId}">${i}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="?page=${currentPage + 1}&searchTerm=${searchTerm}&categoryId=${selectedCategoryId}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <div class="no-results">
                        <i class="bi bi-search"></i>
                        <h3>Không tìm thấy tour nào phù hợp</h3>
                        <p>Xin vui lòng thử lại với từ khóa hoặc danh mục khác.</p>
                        <a href="${pageContext.request.contextPath}/HomeServlet" class="btn btn-primary btn-lg">
                            <i class="bi bi-house-door me-2"></i> Quay về trang chủ
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Search Result End -->

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
    
    <script>
        // Back to top button
        var backToTopButton = document.querySelector('.back-to-top');
        if (backToTopButton) {
            window.addEventListener('scroll', function() {
                if (window.pageYOffset > 300) {
                    backToTopButton.style.display = 'block';
                } else {
                    backToTopButton.style.display = 'none';
                }
            });
            
            backToTopButton.addEventListener('click', function(e) {
                e.preventDefault();
                window.scrollTo({top: 0, behavior: 'smooth'});
            });
        }
    </script>
</body>
</html>