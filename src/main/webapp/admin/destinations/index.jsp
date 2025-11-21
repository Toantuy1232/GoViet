<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>DESTINATIONS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <%@include file="../inc/sidebar.jsp"%>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@include file="../inc/navbar.jsp" %>

            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Danh sách điểm đến</h6>
                        <a href="CreateDestinationsServlet" class="btn btn-primary">Thêm điểm đến mới</a>
                    </div>

                    <p><b>Số điểm đến:</b> ${fn:length(destinationsList)}</p>

                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark">
                                <th scope="col" style="width:5%">STT</th>
                                <th scope="col" style="width:20%">Tên</th>
                                <th scope="col" style="width:15%">Danh mục</th>
                                <th scope="col" style="width:20%">Vị trí</th>
                                <th scope="col" style="width:20%">Ảnh</th>
                                <th scope="col" style="width:10%">Thời gian lý tưởng</th>
                                <th scope="col" style="width:5%">Sửa</th>
                                <th scope="col" style="width:5%">Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="index" value="0"/>
                            <c:forEach items="${destinationsList}" var="des">
                                <c:set var="index" value="${index + 1}"/>
                                <tr>
                                    <td>${index}</td>
                                    <td>${des.name}</td>
                                    <td>
                                        <c:set var="catName" value=""/>
                                        <c:forEach items="${categoryList}" var="cat">
                                            <c:if test="${cat.id == des.category_id}">
                                                <c:set var="catName" value="${cat.name}"/>
                                            </c:if>
                                        </c:forEach>
                                        ${empty catName ? '—' : catName}
                                    </td>
                                    <td>${des.location}</td>
                                    <td>
                                        <c:if test="${not empty des.image_url}">
                                            <img src="${pageContext.request.contextPath}/img/${des.image_url}"
                                                 width="70" height="50" style="object-fit:cover" alt="img"/>
                                        </c:if>
                                    </td>
                                    <td>${des.best_time_to_visit}</td>
                                    <td>
                                        <a href="EditDestinationsServlet?destination_id=${des.destination_id}" class="btn btn-sm btn-primary">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="DeleteDestinationsServlet?destination_id=${des.destination_id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa điểm đến này?');">
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
        </div>

        <%@include file="../inc/footer.jsp" %>
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/chart/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
