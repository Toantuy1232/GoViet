<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="toan.dev.data.dao.DatabaseDao" %>
<%@page import="toan.dev.data.dao.ProductsDao" %>
<%@page import="toan.dev.data.dao.CategoryDao" %>
<%@page import="toan.dev.data.model.Products" %>
<%@page import="toan.dev.data.model.Category" %>
<%@page import="java.util.List" %>

<%
    // Load products based on categoryId parameter
    String categoryIdParam = request.getParameter("categoryId");
    ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
    CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
    
    List<Products> productsList;
    Category selectedCategory = null;
    
    if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
        try {
            int categoryId = Integer.parseInt(categoryIdParam);
            productsList = productsDao.findAllByCategoryId(categoryId);
            try {
                selectedCategory = categoryDao.find(categoryId);
            } catch (Exception e) {
                // Category not found, ignore
            }
        } catch (NumberFormatException e) {
            productsList = productsDao.findAll();
        }
    } else {
        productsList = productsDao.findAll();
    }
    
    request.setAttribute("productsList", productsList);
    request.setAttribute("selectedCategory", selectedCategory);
%>

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
                    <h1 class="display-4 text-dark mb-4">
                        <c:choose>
                            <c:when test="${not empty selectedCategory}">
                                ${selectedCategory.name}
                            </c:when>
                            <c:otherwise>
                                Khám phá Tour Du Lịch
                            </c:otherwise>
                        </c:choose>
                    </h1>
                    <p class="text-dark-50 mb-4">Tìm kiếm và khám phá những tour du lịch hấp dẫn nhất</p>
                </div>
                <div class="col-lg-6 text-center text-lg-start">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/hero.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->

    <!-- Products/Tours Section -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h6 class="text-primary text-uppercase">Tour Du Lịch</h6>
                <h1 class="mb-5">
                    <c:choose>
                        <c:when test="${not empty selectedCategory}">
                            ${selectedCategory.name}
                        </c:when>
                        <c:otherwise>
                            Tất cả Tour Du Lịch
                        </c:otherwise>
                    </c:choose>
                </h1>
            </div>
            <div class="row g-4">
                <c:forEach var="product" items="${productsList}">
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
                                <p style="height: 48px; overflow: hidden;">${product.name}</p>
                                <div class="d-flex justify-content-center mb-2 gap-1">
                                    <a href="${pageContext.request.contextPath}/add-to-cart?type=tour&itemId=${product.id}" 
                                       class="btn btn-sm btn-outline-primary px-3">
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/booking?type=tour&itemId=${product.id}" 
                                       class="btn btn-sm btn-primary px-3">
                                        Đặt ngay
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <c:if test="${empty productsList}">
                    <div class="col-12">
                        <div class="alert alert-info text-center">
                            <i class="fas fa-info-circle fa-3x mb-3"></i>
                            <h4>Hiện chưa có tour nào</h4>
                            <p>Vui lòng quay lại sau hoặc chọn danh mục khác</p>
                        </div>
                    </div>
                </c:if>

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