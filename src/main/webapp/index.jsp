<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

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
                                  <img src="${pageContext.request.contextPath}/img/${randomGalleryImage.image_url}" class="img-fluid w-100 h-100" alt="${randomGalleryImage.image_url}">
                              </c:when>

                              <c:when test="${not empty categoryGalleryList}">
                                  <c:set var="randomImage" value="${categoryGalleryList[0]}" />
                                  <img src="${pageContext.request.contextPath}/img/${randomImage.image_url}" class="img-fluid w-100 h-100" alt="${randomImage.image_url}">
                              </c:when>

                              <c:otherwise>
                                  <img src="${pageContext.request.contextPath}/img/default-about.jpg" class="img-fluid w-100 h-100" alt="About us">
                              </c:otherwise>
                          </c:choose>
                      </div> 

                  </div>

                  <div class="col-lg-7"
                       style="background: linear-gradient(rgba(255,255,255,.8), rgba(255,255,255,.8)), url(img/about-img-1.png);">

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

        <!-- Services Start -->
       <div class="container-fluid bg-light service py-5">
           <div class="container py-5">
               <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                   <h5 class="section-title px-3">Dịch Vụ</h5>
                   <h1 class="mb-0">Các Dịch Vụ Của Chúng Tôi</h1>
               </div>
               <div class="row g-4">
                   <div class="col-lg-6">
                       <div class="row g-4">
                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 pe-0">
                                   <div class="service-content text-end">
                                       <h5 class="mb-4">Tour Du Lịch Toàn Thế Giới</h5>
                                       <p class="mb-0">
                                       Khám phá những điểm đến nổi tiếng trên khắp thế giới với các tour được thiết kế trọn gói, lịch trình linh hoạt và hướng dẫn viên chuyên nghiệp. Mang đến cho bạn trải nghiệm du lịch trọn vẹn và đáng nhớ nhất.
                                       </p>
                                   </div>
                                   <div class="service-icon p-4">
                                       <i class="fa fa-globe fa-4x text-primary"></i>
                                   </div>
                               </div>
                           </div>
                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center  bg-white border border-primary rounded p-4 pe-0">
                                   <div class="service-content text-end">
                                       <h5 class="mb-4">Đặt Phòng Khách Sạn</h5>
                                       <p class="mb-0">
                                       Chúng tôi cung cấp hệ thống đặt phòng khách sạn nhanh chóng, giá tốt, đa dạng từ bình dân đến cao cấp. Đảm bảo không phát sinh chi phí, nhiều ưu đãi độc quyền và dịch vụ hỗ trợ 24/7.
                                       </p>
                                   </div>
                                   <div class="service-icon p-4">
                                       <i class="fa fa-hotel fa-4x text-primary"></i>
                                   </div>
                               </div>
                           </div>
                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 pe-0">
                                   <div class="service-content text-end">
                                       <h5 class="mb-4">Hướng Dẫn Viên Du Lịch</h5>
                                       <p class="mb-0">
                                       Đội ngũ hướng dẫn viên giàu kinh nghiệm, thân thiện và nhiệt tình sẽ đồng hành cùng bạn trong suốt chuyến đi, giới thiệu văn hóa – lịch sử – ẩm thực địa phương một cách sinh động và hấp dẫn.
                                       </p>
                                   </div>
                                   <div class="service-icon p-4">
                                       <i class="fa fa-user fa-4x text-primary"></i>
                                   </div>
                               </div>
                           </div>
                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 pe-0">
                                   <div class="service-content text-end">
                                       <h5 class="mb-4">Tổ Chức Sự Kiện</h5>
                                       <p class="mb-0">
                                       Nhận tổ chức các chương trình team building, hội nghị – hội thảo, sự kiện doanh nghiệp tại các địa điểm du lịch. Chuyên nghiệp trong khâu chuẩn bị, sáng tạo trong nội dung, đảm bảo thành công trọn vẹn.
                                       </p>
                                   </div>
                                   <div class="service-icon p-4">
                                       <i class="fa fa-cog fa-4x text-primary"></i>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>

                   <div class="col-lg-6">
                       <div class="row g-4">
                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 ps-0">
                                   <div class="service-icon p-4">
                                       <i class="fa fa-globe fa-4x text-primary"></i>
                                   </div>
                                   <div class="service-content">
                                       <h5 class="mb-4">Tour Du Lịch Toàn Thế Giới</h5>
                                       <p class="mb-0">
                                       Khám phá những điểm đến nổi tiếng trên khắp thế giới với các tour được thiết kế trọn gói, lịch trình linh hoạt và hướng dẫn viên chuyên nghiệp. Mang đến cho bạn trải nghiệm du lịch trọn vẹn và đáng nhớ nhất.
                                       </p>
                                   </div>
                               </div>
                           </div>

                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 ps-0">
                                   <div class="service-icon p-4">
                                       <i class="fa fa-hotel fa-4x text-primary"></i>
                                   </div>
                                   <div class="service-content">
                                       <h5 class="mb-4">Đặt Phòng Khách Sạn</h5>
                                       <p class="mb-0">
                                       Chúng tôi cung cấp hệ thống đặt phòng khách sạn nhanh chóng, giá tốt, đa dạng từ bình dân đến cao cấp. Đảm bảo không phát sinh chi phí, nhiều ưu đãi độc quyền và dịch vụ hỗ trợ 24/7.
                                       </p>
                                   </div>
                               </div>
                           </div>

                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 ps-0">
                                   <div class="service-icon p-4">
                                       <i class="fa fa-user fa-4x text-primary"></i>
                                   </div>
                                   <div class="service-content">
                                       <h5 class="mb-4">Hướng Dẫn Viên Du Lịch</h5>
                                       <p class="mb-0">
                                       Đội ngũ hướng dẫn viên giàu kinh nghiệm, thân thiện và nhiệt tình sẽ đồng hành cùng bạn trong suốt chuyến đi, giới thiệu văn hóa – lịch sử – ẩm thực địa phương một cách sinh động và hấp dẫn.
                                       </p>
                                   </div>
                               </div>
                           </div>

                           <div class="col-12">
                               <div class="service-content-inner d-flex align-items-center bg-white border border-primary rounded p-4 ps-0">
                                   <div class="service-icon p-4">
                                       <i class="fa fa-cog fa-4x text-primary"></i>
                                   </div>
                                   <div class="service-content">
                                       <h5 class="mb-4">Tổ Chức Sự Kiện</h5>
                                       <p class="mb-0">
                                       Nhận tổ chức các chương trình team building, hội nghị – hội thảo, sự kiện doanh nghiệp tại các địa điểm du lịch. Chuyên nghiệp trong khâu chuẩn bị, sáng tạo trong nội dung, đảm bảo thành công trọn vẹn.
                                       </p>
                                   </div>
                               </div>
                           </div>

                       </div>
                   </div>

                   <div class="col-12">
                       <div class="text-center">
                           <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="">Xem Thêm Dịch Vụ</a>
                       </div>
                   </div>

               </div>
           </div>
       </div>

        <!-- Services End -->

    
        <div class="container-fluid destination py-5">
            <div class="container py-5">
                <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                    <h5 class="section-title px-3">Điểm đến</h5>
                    <h1 class="mb-0">Điểm Đến Phổ Biến</h1>
                </div>
                <div class="tab-class text-center">
                    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5">

                        <li class="nav-item">
                            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-all">
                                <span class="text-dark" style="width: 150px;">Tất cả</span>
                            </a>
                        </li>
        
                        <c:forEach items="${categoryList}" var="cat">
                            <li class="nav-item">
                                <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-cat-${cat.id}">
                                    <span class="text-dark" style="width: 150px;">${cat.name}</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="tab-content">
                        <div id="tab-all" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <c:forEach items="${destinationsList}" var="des">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="destination-img">
                                            <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/img/${des.image_url}" alt="${des.name}">
                                            <div class="destination-overlay p-4">
                                                <h4 class="text-white mb-2 mt-3">${des.name}</h4>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                
                        <c:forEach items="${categoryList}" var="cat">
                            <div id="tab-cat-${cat.id}" class="tab-pane fade show p-0">
                                <div class="row g-4">
                                    <c:forEach items="${destinationsList}" var="des">
                                        <c:if test="${des.category_id == cat.id}">
                                            <div class="col-lg-4 col-md-6">
                                                <div class="destination-img">
                                                    <img class="img-fluid rounded w-100" src="${pageContext.request.contextPath}/img/${des.image_url}" alt="${des.name}">
                                                    <div class="destination-overlay p-4">
                                                        <h4 class="text-white mb-2 mt-3">${des.name}</h4>
                                                        <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Destination End -->
        <div class="container-fluid ExploreTour py-5">
            <div class="container py-5">
                <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                    <h5 class="section-title px-3">Khám phá chuyến tham quan</h5>
                    <h1 class="mb-4">thế giới</h1>
                </div>
                <div class="tab-class text-center">
                    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill active" data-bs-toggle="pill" href="#NationalTab-1">
                                <span class="text-dark" style="width: 250px;">Tour Trong nước</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex py-2 mx-3 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#InternationalTab-2">
                                <span class="text-dark" style="width: 250px;">Tour Quốc Tế</span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content">
                       
                        <div id="NationalTab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <c:forEach items="${categoryGalleryList}" var="g" varStatus="st">
                                    <c:if test="${st.index < 6}">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="national-item">
                                                <img src="${pageContext.request.contextPath}/img/${g.image_url}" class="img-fluid w-100 rounded" alt="Image">
                                                <div class="national-content">
                                                    <div class="national-info">
                                                        <h5 class="text-white text-uppercase mb-2">Gallery</h5>
                                                    </div>
                                                </div>
                                                <div class="national-plus-icon">
                                                    <a href="${pageContext.request.contextPath}/img/${g.image_url}" class="my-auto" data-lightbox="explore-national"><i class="fas fa-link fa-2x text-white"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div id="InternationalTab-2" class="tab-pane fade show p-0">
                            <div class="InternationalTour-carousel owl-carousel">
                                <c:forEach items="${categoryGalleryList}" var="g">
                                    <div class="international-item">
                                        <img src="${pageContext.request.contextPath}/img/${g.image_url}" class="img-fluid w-100 rounded" alt="Image">
                                        <div class="international-content">
                                            <div class="international-info">
                                                <h5 class="text-white text-uppercase mb-2">Gallery</h5>
                                            </div>
                                        </div>
                                        <div class="international-plus-icon">
                                            <a href="${pageContext.request.contextPath}/img/${g.image_url}" class="my-auto" data-lightbox="explore-international"><i class="fas fa-link fa-2x text-white"></i></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Gallery Start -->
        <c:if test="${not empty categoryGalleryList}">
        <div class="container-fluid gallery py-5 my-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                <h5 class="section-title px-3">THƯ VIỆN ẢNH</h5>
                <h1 class="mb-4">Thư viện du lịch & hành trình.</h1>
                <p class="mb-0">Khám phá những khoảnh khắc đẹp trong các chuyến đi, điểm đến nổi bật
                    và trải nghiệm ấn tượng của du khách cùng GoViet.</p>
            </div>
            <div class="tab-class text-center">
                <ul class="nav nav-pills d-inline-flex justify-content-center mb-5">
                    <li class="nav-item">
                        <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill active" data-bs-toggle="pill" href="#GalleryTab-all">
                            <span class="text-dark" style="width: 150px;">Tất cả</span>
                        </a>
                    </li>
                    <c:forEach items="${categoryList}" var="cat">
                        <li class="nav-item">
                            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#GalleryTab-${cat.id}">
                                <span class="text-dark" style="width: 150px;">${cat.name}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                <div class="tab-content">
                    <!-- Tab All: tất cả ảnh -->
                    <div id="GalleryTab-all" class="tab-pane fade show p-0 active">
                        <div class="row g-2">
                            <c:forEach items="${categoryGalleryList}" var="item">
                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-2">
                                    <div class="gallery-item h-100">
                                        <img src="${pageContext.request.contextPath}/img/${item.image_url}"
                                             class="img-fluid w-100 h-100 rounded" alt="Image">
                                        <div class="gallery-content">
                                            <div class="gallery-info">
                                                <h5 class="text-white text-uppercase mb-2">Gallery</h5>
                                                <a href="#" class="btn-hover text-white">Xem ảnh <i class="fa fa-arrow-right ms-2"></i></a>
                                            </div>
                                        </div>
                                        <div class="gallery-plus-icon">
                                            <a href="${pageContext.request.contextPath}/img/${item.image_url}"
                                               data-lightbox="gallery-all" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Các tab theo danh mục: mỗi tab hiển thị ảnh của 1 category -->
                    <c:forEach items="${categoryList}" var="cat">
                        <div id="GalleryTab-${cat.id}" class="tab-pane fade show p-0">
                            <div class="row g-2">
                                <c:forEach items="${categoryGalleryList}" var="item">
                                    <c:if test="${item.category_id == cat.id}">
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-2">
                                            <div class="gallery-item h-100">
                                                <img src="${pageContext.request.contextPath}/img/${item.image_url}"
                                                     class="img-fluid w-100 h-100 rounded" alt="Image">
                                                <div class="gallery-content">
                                                    <div class="gallery-info">
                                                        <h5 class="text-white text-uppercase mb-2">${cat.name}</h5>
                                                    </div>
                                                </div>
                                                <div class="gallery-plus-icon">
                                                    <a href="${pageContext.request.contextPath}/img/${item.image_url}"
                                                       data-lightbox="gallery-cat-${cat.id}" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        </c:if>
        <!-- Gallery End -->
      <%-- Booking section temporarily commented
      <div class="container-fluid booking py-5">
          <div class="container py-5">
              <div class="row g-5 align-items-center">
                  <div class="col-lg-6">
                      <h5 class="section-booking-title pe-3">Đặt chỗ</h5>
                      <h1 class="text-white mb-4">Đặt chỗ trực tuyến</h1>
                     <p class="text-white mb-4">
                         Trải nghiệm hành trình tuyệt vời với những điểm đến hấp dẫn, dịch vụ tận tâm và lịch trình linh hoạt. Chúng tôi luôn đồng hành để mang đến cho bạn chuyến đi an toàn, thoải mái và đầy kỷ niệm đáng nhớ.
                     </p>

                    <p class="text-white mb-4">
                        Khám phá những hành trình mới đầy cảm hứng với dịch vụ du lịch chuyên nghiệp của chúng tôi. Trải nghiệm điểm đến tuyệt đẹp, dịch vụ tận tâm và những khoảnh khắc đáng nhớ trong mỗi chuyến đi của bạn.
                    </p>

                      <a href="#" class="btn btn-light text-primary rounded-pill py-3 px-5 mt-2">Xem thêm</a>
                  </div>

                  <div class="col-lg-6">
                      <h1 class="text-white mb-3">Đặt Tour Ưu Đãi</h1>
                      <p class="text-white mb-4">
                          Nhận <span class="text-warning">giảm 50%</span> cho chuyến phiêu lưu đầu tiên cùng Travela. Xem thêm các ưu đãi khác tại đây.
                      </p>

                     <form action="${pageContext.request.contextPath}/book-tour" method="post">
                         <div class="row g-3">
                             <div class="col-md-6">
                                 <div class="form-floating">
                                     <input type="text" class="form-control bg-white border-0" id="name"
                                            name="customerName" placeholder="Tên của bạn" required>
                                     <label for="name">Tên của bạn</label>
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-floating">
                                     <input type="email" class="form-control bg-white border-0" id="email"
                                            name="email" placeholder="Email của bạn" required>
                                     <label for="email">Email của bạn</label>
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-floating date" id="date3" data-target-input="nearest">
                                     <input type="datetime-local" class="form-control bg-white border-0"
                                            id="bookingDate" name="bookingDate" required>
                                     <label for="bookingDate">Ngày & Giờ</label>
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-floating">
                                     <select class="form-select bg-white border-0" id="destinationId" name="destinationId" required>
                                         <option value="">-- Chọn điểm đến --</option>
                                         <c:forEach items="${destinations}" var="destination">
                                             <option value="${destination.id}">${destination.name}</option>
                                         </c:forEach>
                                     </select>
                                     <label for="destinationId">Điểm đến</label>
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-floating">
                                     <select class="form-select bg-white border-0" id="numberOfPeople" name="numberOfPeople" required>
                                         <option value="1">1 người</option>
                                         <option value="2">2 người</option>
                                         <option value="3">3 người</option>
                                         <option value="4">4 người</option>
                                         <option value="5">5 người</option>
                                         <option value="6">6 người</option>
                                         <option value="7">7 người</option>
                                         <option value="8">8 người</option>
                                         <option value="9">9 người</option>
                                         <option value="10">10 người</option>
                                     </select>
                                     <label for="numberOfPeople">Số lượng người</label>
                                 </div>
                             </div>

                             <div class="col-md-6">
                                 <div class="form-floating">
                                     <select class="form-select bg-white border-0" id="categoryId" name="categoryId">
                                         <option value="">-- Chọn danh mục --</option>
                                         <c:forEach items="${categories}" var="category">
                                             <option value="${category.id}">${category.name}</option>
                                         </c:forEach>
                                     </select>
                                     <label for="categoryId">Danh mục</label>
                                 </div>
                             </div>

                             <div class="col-12">
                                 <div class="form-floating">
                                     <textarea class="form-control bg-white border-0"
                                              placeholder="Yêu cầu đặc biệt"
                                              id="specialRequests"
                                              name="specialRequests"
                                              style="height: 100px"></textarea>
                                     <label for="specialRequests">Yêu cầu đặc biệt</label>
                                 </div>
                             </div>

                             <div class="col-12">
                                 <c:if test="${sessionScope.user != null}">
                                     <button class="btn btn-primary text-white w-100 py-3" type="submit">Đặt ngay</button>
                                 </c:if>
                                 <c:if test="${sessionScope.user == null}">
                                     <a href="${pageContext.request.contextPath}/login"
                                        class="btn btn-warning text-white w-100 py-3">
                                        Đăng nhập để đặt tour
                                     </a>
                                 </c:if>
                             </div>
                         </div>
                     </form>

                  </div>
              </div>
          </div>
      </div>
      --%>
        <!-- Tour Booking End -->

        <!-- Travel Guide Start -->
       <!-- Hướng dẫn viên Start -->
       <div class="container-fluid guide py-5">
           <div class="container py-5">
               <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                   <h5 class="section-title px-3">Hướng dẫn viên</h5>
                   <h1 class="mb-0">Đội ngũ hướng dẫn viên chuyên nghiệp</h1>
               </div>

               <!-- Debug: Show guides data -->
               <c:if test="${not empty guides}">
                   <div style="display: none;">
                       <c:forEach items="${guides}" var="g" varStatus="loop">
                           Guide ${loop.index + 1}: ${g.fullname} - ${g.role} - ${g.avatar_url}<br>
                       </c:forEach>
                   </div>
               </c:if>

               <div class="row g-4">
                   <c:choose>
                       <c:when test="${not empty guides}">
                           <c:forEach items="${guides}" var="guide" varStatus="status">
                               <div class="col-md-6 col-lg-3">
                                   <div class="guide-item">
                                       <div class="guide-img">
                                           <div class="guide-img-efects">
                                               <c:choose>
                                                   <c:when test="${not empty guide.avatar_url}">
                                                       <img src="${pageContext.request.contextPath}${guide.avatar_url}"
                                                            class="img-fluid w-100 rounded-top"
                                                            alt="${guide.fullname}">
                                                   </c:when>
                                                   <c:otherwise>
                                                       <img src="${pageContext.request.contextPath}/assets/images/avatars/default-avatar.jpg"
                                                            class="img-fluid w-100 rounded-top"
                                                            alt="${guide.fullname}">
                                                   </c:otherwise>
                                               </c:choose>
                                           </div>
                                           <div class="guide-icon rounded-pill p-2">
                                               <!-- Social media links can be added here if needed -->
                                               <a href="#" class="btn btn-square btn-primary rounded-circle mx-1">
                                                   <i class="fab fa-facebook-f"></i>
                                               </a>
                                               <a href="#" class="btn btn-square btn-primary rounded-circle mx-1">
                                                   <i class="fab fa-twitter"></i>
                                               </a>
                                           </div>
                                       </div>
                                       <div class="guide-title text-center rounded-bottom p-4">
                                           <div class="guide-title-inner">
                                               <h4 class="mt-3">${guide.fullname}</h4>
                                               <p class="mb-0">${guide.role}</p>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </c:forEach>
                       </c:when>
                       <c:otherwise>
                           <div class="col-12 text-center">
                               <div class="alert alert-info">
                                   <i class="fas fa-info-circle me-2"></i> Chưa có hướng dẫn viên nào
                               </div>
                           </div>
                       </c:otherwise>
                   </c:choose>
               </div>
           </div>
       </div>
        <!-- Travel Guide End -->

        <!-- Blog Start -->
        <div class="container-fluid blog py-5">
            <div class="container py-5">
                <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                    <h5 class="section-title px-3">Tin Tức & Sự Kiện</h5>
                    <h1 class="mb-4">Bài Viết Mới Nhất</h1>
                    <p class="mb-0">Cập nhật những tin tức và sự kiện mới nhất về du lịch trong nước và quốc tế.</p>
                </div>
                <div class="row g-4 justify-content-center">
                    <c:choose>
                        <c:when test="${not empty randomBlogPosts}">
                            <c:forEach items="${randomBlogPosts}" var="post" varStatus="status">
                                <div class="col-lg-4 col-md-6">
                                    <div class="blog-item">
                                        <div class="blog-img">
                                            <div class="blog-img-inner">
                                                <c:choose>
                                                    <c:when test="${not empty post.cover_image}">
                                                        <img class="img-fluid w-100 rounded-top"
                                                             src="${pageContext.request.contextPath}/assets/images/${post.cover_image}"
                                                             alt="${post.title}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="img-fluid w-100 rounded-top"
                                                             src="${pageContext.request.contextPath}/img/blog/default-blog.jpg"
                                                             alt="${post.title}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="blog-icon">
                                                    <a href="${pageContext.request.contextPath}/blog-detail?id=${post.post_id}"
                                                       class="my-auto">
                                                        <i class="fas fa-link fa-2x text-white"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="blog-info d-flex align-items-center border border-start-0 border-end-0">
                                                <small class="flex-fill text-center border-end py-2">
                                                    <i class="fa fa-calendar-alt text-primary me-2"></i>
                                                    <fmt:formatDate value="${post.created_at}" pattern="dd/MM/yyyy" />
                                                </small>
                                                <a href="#" class="btn-hover flex-fill text-center text-white border-end py-2">
                                                    <i class="fa fa-user text-primary me-2"></i>
                                                    <c:out value="${post.author_id}"/>
                                                </a>
                                                <a href="#" class="btn-hover flex-fill text-center text-white py-2">
                                                    <i class="fa fa-eye text-primary me-2"></i>0
                                                </a>
                                            </div>
                                        </div>
                                        <div class="blog-content border border-top-0 rounded-bottom p-4">
                                            <a href="${pageContext.request.contextPath}/blog-detail?id=${post.post_id}"
                                               class="h4 d-block mb-3">${post.title}</a>
                                            <p class="my-3">
                                                <c:choose>
                                                    <c:when test="${fn:length(post.content) > 150}">
                                                        ${fn:substring(post.content, 0, 150)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${post.content}
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                            <a href="${pageContext.request.contextPath}/blog-detail?id=${post.post_id}"
                                               class="btn btn-primary rounded-pill py-2 px-4">Đọc thêm</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12 text-center">
                                <p>Chưa có bài viết nào.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
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
                        <i class="fas fa-copyright me-2"></i> All right reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-start">
                        Thiết kế bởi <a class="text-white" href="HomeServlet">Trần Viết Trường An</a>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top">
            <i class="fa fa-arrow-up"></i>
        </a>   

        
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