<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>GoViet - Tour Du Lịch Thế Giới</title>
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
        <!-- About Start -->
      <div class="container-fluid about py-5">
               <div class="container py-5">
                   <div class="row g-5 align-items-center">


                       <div class="col-lg-5">
                           <div class="h-100" style="border: 50px solid; border-color: transparent #13357B transparent #13357B;">
                               <c:choose>
                                   <c:when test="${not empty randomGalleryImage}">
                                       <img src="${pageContext.request.contextPath}/assets/img/${randomGalleryImage.image_url}" class="img-fluid w-100 h-100" alt="${randomGalleryImage.image_url}">
                                   </c:when>

                                   <c:when test="${not empty categoryGalleryList}">
                                       <c:set var="randomImage" value="${categoryGalleryList[0]}" />
                                       <img src="${pageContext.request.contextPath}/assets/img/${randomImage.image_url}" class="img-fluid w-100 h-100" alt="${randomImage.image_url}">
                                   </c:when>

                                   <c:otherwise>
                                       <img src="${pageContext.request.contextPath}/assets/img/default-about.jpg" class="img-fluid w-100 h-100" alt="About us">
                                   </c:otherwise>
                               </c:choose>
                           </div>

                       </div>

                       <div class="col-lg-7"
                            style="background: linear-gradient(rgba(255,255,255,.8), rgba(255,255,255,.8)), url(${pageContext.request.contextPath}/assets/img/about-img-1.png);">

                           <h5 class="section-about-title pe-3">Về Chúng Tôi</h5>
                           <h1 class="mb-4">Chào mừng đến với <span class="text-primary">GoViet</span></h1>

                           <p class="mb-4">
                               Chúng tôi là công ty du lịch chuyên cung cấp các dịch vụ tour trong và ngoài nước,
                               mang đến cho bạn những trải nghiệm tuyệt vời, an toàn và đáng nhớ.
                           </p>

                           <p class="mb-4">
                               Sứ mệnh của chúng tôi là đồng hành cùng bạn trên mọi chuyến đi.
                           </p>

                           <div class="row gy-2 gx-4 mb-4">
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Chuyến Bay Hạng Nhất</p></div>
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Khách Sạn Tuyển Chọn</p></div>
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Lưu Trú Chuẩn 5 Sao</p></div>
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Xe Du Lịch Đời Mới</p></div>
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>150 Tour Tham Quan Cao Cấp</p></div>
                               <div class="col-sm-6"><p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Dịch Vụ 24/7</p></div>
                           </div>

                           <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="">Xem Thêm</a>
                       </div>

                   </div>
               </div>
           </div>

        <!-- About End -->
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