<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Travela - Tourism Website Template</title>
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


          <%@include file="./inc/header.jsp" %>

        <!-- Blog Start -->
        <div class="container-fluid blog py-5">
            <div class="container py-5">
                <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                    <h5 class="section-title px-3">Bài viết du lịch</h5>
                    <h1 class="mb-4">Các bài viết nổi bật</h1>
                    <p class="mb-0">Khám phá những bài viết về điểm đến, kinh nghiệm và câu chuyện du lịch được chọn lọc dành cho bạn.
                    </p>
                </div>
                <div class="row g-4 justify-content-center">
                    <c:forEach var="b" items="${blogpostsList}">
                        <div class="col-lg-4 col-md-6">
                            <div class="blog-item">
                                <div class="blog-img">
                                    <div class="blog-img-inner">
                                        <img class="img-fluid w-100 rounded-top" src="${pageContext.request.contextPath}/img/${b.cover_image}" alt="Image">
                                        <div class="blog-icon">
                                            <a href="#" class="my-auto"><i class="fas fa-link fa-2x text-white"></i></a>
                                        </div>
                                    </div>
                                    <div class="blog-info d-flex align-items-center border border-start-0 border-end-0">
                                        <small class="flex-fill text-center border-end py-2">
                                            <i class="fa fa-calendar-alt text-primary me-2"></i>${b.created_at}
                                        </small>
                                        <a href="#" class="btn-hover flex-fill text-center text-white border-end py-2">
                                            <i class="fa fa-thumbs-up text-primary me-2"></i>1.7K
                                        </a>
                                        <a href="#" class="btn-hover flex-fill text-center text-white py-2">
                                            <i class="fa fa-comments text-primary me-2"></i>1K
                                        </a>
                                    </div>
                                </div>
                                <div class="blog-content border border-top-0 rounded-bottom p-4">
                                    <p class="mb-3">Được đăng bởi:
                                        <c:set var="foundAuthor" value="false" />
                                        <c:forEach var="u" items="${users}">
                                            <c:if test="${u.user_id eq b.author_id}">
                                                ${u.fullname}
                                                <c:set var="foundAuthor" value="true" />
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${not foundAuthor}">
                                            Admin
                                        </c:if>
                                    </p>
                                    <a href="#" class="h4">${b.title}</a>
                                    <p class="my-3">${fn:substring(b.content, 0, 150)}...</p>
                                    <a href="${pageContext.request.contextPath}/blog-detail?id=${b.post_id}" class="btn btn-primary rounded-pill py-2 px-4">Đọc thêm</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Blog End -->

        <!-- Subscribe Start -->
        <div class="container-fluid subscribe py-5">
            <div class="container text-center py-5">
                <div class="mx-auto text-center" style="max-width: 900px;">
                    <h5 class="subscribe-title px-3">Đăng ký</h5>
                    <h1 class="text-white mb-4">Nhận bản tin du lịch</h1>
                    <p class="text-white mb-5">Đăng ký để nhận tin tức, ưu đãi và các bài viết du lịch mới nhất từ GoViet.
                    </p>
                    <div class="position-relative mx-auto">
                        <input class="form-control border-primary rounded-pill w-100 py-3 ps-4 pe-5" type="text" placeholder="Email của bạn">
                        <button type="button" class="btn btn-primary rounded-pill position-absolute top-0 end-0 py-2 px-4 mt-2 me-2">Đăng ký</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Subscribe End -->

        <!-- Footer Start -->
      <%@include file="./inc/footer.jsp" %>
        <!-- Footer End -->
        
        <!-- Copyright Start -->
        <div class="container-fluid copyright text-body py-4">
            <div class="container">
                <div class="row g-4 align-items-center">
                    <div class="col-md-6 text-center text-md-end mb-md-0">
                        <i class="fas fa-copyright me-2"></i><a class="text-white" href="#">Your Site Name</a>, All right reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-start">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
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