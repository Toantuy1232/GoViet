<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>TOURS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">

    <!-- Admin CSS Fix -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <!-- Sidebar -->
    <%@include file="../inc/sidebar.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <!-- Topbar -->
            <%@include file="../inc/navbar.jsp" %>
            <!-- End of Topbar -->

            <!-- Tours Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Danh sách tour</h6>
                        <a href="CreateTourServlet" class="btn btn-primary">Thêm tour mới</a>
                    </div>

                    <p><b>Số tour:</b> ${fn:length(toursList)}</p>

                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark">
                                <th scope="col" style="width:5%">STT</th>
                                <th scope="col" style="width:10%">Hình ảnh</th>
                                <th scope="col" style="width:20%">Tiêu đề</th>
                                <th scope="col" style="width:10%">Giá</th>
                                <th scope="col" style="width:10%">Giá cũ</th>
                                <th scope="col" style="width:10%">Số ngày</th>
                                <th scope="col" style="width:10%">Ngày bắt đầu</th>
                                <th scope="col" style="width:10%">Ngày kết thúc</th>
                                <th scope="col" style="width:10%">Số chỗ</th>
                                <th scope="col" style="width:5%">Sửa</th>
                                <th scope="col" style="width:5%">Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="index" value="0"/>
                            <c:forEach items="${toursList}" var="tour">
                                <c:set var="index" value="${index + 1}"/>
                                <tr>
                                    <td>${index}</td>
                                    <td>
                                        <c:if test="${not empty tour.main_image}">
                                            <img src="${pageContext.request.contextPath}/img/${tour.main_image}"
                                                 width="50" height="50" alt="img" class="img-fluid"/>
                                        </c:if>
                                    </td>
                                    <td>${tour.title}</td>
                                    <td>
                                        <fmt:formatNumber value="${tour.price * 1000}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    </td>
                                    <td>
                                        <c:if test="${tour.price_old > 0}">
                                            <del>
                                                <fmt:formatNumber value="${tour.price_old * 1000}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                            </del>
                                        </c:if>
                                    </td>
                                    <td>${tour.duration_days}</td>
                                    <td><fmt:formatDate value="${tour.start_date}" pattern="dd/MM/yyyy HH:mm"/></td>
                                    <td><fmt:formatDate value="${tour.end_date}" pattern="dd/MM/yyyy HH:mm"/></td>
                                    <td>${tour.available_slots}</td>
                                    <td>
                                        <a href="EditTourServlet?tourId=${tour.tour_id}" class="btn btn-sm btn-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="DeleteTourServlet?tourId=${tour.tour_id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa tour này?');">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Tours End -->
        </div>

        <!-- Footer -->
        <%@include file="../inc/footer.jsp" %>
        <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<!-- Back to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/chart/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>

