<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Đăng ký tư vấn - GoViet</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>

<body>
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <jsp:include page="/inc/header.jsp" />

    <!-- Breadcrumb Start -->
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h3 class="text-white display-3 mb-4">Đăng ký tư vấn</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Đăng ký tư vấn</li>
            </ol>    
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Consultation Form Start -->
    <div class="container-fluid booking py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6">
                    <h5 class="section-booking-title pe-3">Đăng ký tư vấn</h5>
                    <h1 class="text-white mb-4">Để lại thông tin, chúng tôi sẽ tư vấn cho bạn</h1>
                    <p class="text-white mb-4">Đội ngũ chuyên gia du lịch của chúng tôi sẽ giúp bạn lên kế hoạch cho chuyến đi hoàn hảo. Hãy để lại thông tin và chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.</p>
                    <p class="text-white mb-4">
                        <i class="fa fa-check text-white me-2"></i> Tư vấn miễn phí<br>
                        <i class="fa fa-check text-white me-2"></i> Lên kế hoạch chi tiết<br>
                        <i class="fa fa-check text-white me-2"></i> Hỗ trợ 24/7<br>
                        <i class="fa fa-check text-white me-2"></i> Giá tốt nhất
                    </p>
                </div>
                <div class="col-lg-6">
                    <div class="bg-white rounded p-5">
                        <h1 class="mb-4">Thông tin đăng ký</h1>
                        
                        <!-- Success/Error Messages -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/ConsultationServlet" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control bg-light border-0" id="fullName" name="fullName" placeholder="Họ và tên" required>
                                        <label for="fullName">Họ và tên <span class="text-danger">*</span></label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control bg-light border-0" id="email" name="email" placeholder="Email" required>
                                        <label for="email">Email <span class="text-danger">*</span></label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control bg-light border-0" id="phone" name="phone" placeholder="Số điện thoại" required>
                                        <label for="phone">Số điện thoại <span class="text-danger">*</span></label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control bg-light border-0" id="destination" name="destination" placeholder="Điểm đến">
                                        <label for="destination">Điểm đến mong muốn</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="date" class="form-control bg-light border-0" id="travelDate" name="travelDate">
                                        <label for="travelDate">Ngày dự kiến đi</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="number" class="form-control bg-light border-0" id="numberOfPeople" name="numberOfPeople" placeholder="Số người" min="1" value="1">
                                        <label for="numberOfPeople">Số người</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <select class="form-select bg-light border-0" id="budget" name="budget">
                                            <option value="">Chọn ngân sách</option>
                                            <option value="under-5m">Dưới 5 triệu</option>
                                            <option value="5m-10m">5 - 10 triệu</option>
                                            <option value="10m-20m">10 - 20 triệu</option>
                                            <option value="20m-50m">20 - 50 triệu</option>
                                            <option value="over-50m">Trên 50 triệu</option>
                                        </select>
                                        <label for="budget">Ngân sách dự kiến</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control bg-light border-0" placeholder="Ghi chú" id="message" name="message" style="height: 100px"></textarea>
                                        <label for="message">Ghi chú thêm</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">
                                        <i class="fas fa-paper-plane me-2"></i>Đăng ký tư vấn
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Consultation Form End -->

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
