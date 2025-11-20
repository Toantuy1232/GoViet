<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>DASHMIN - Blog Management</title>
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
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">

    <%@include file="../inc/sidebar.jsp" %>

    <!-- Content Start -->
    <div class="content">

        <%@include file="../inc/navbar.jsp" %>

        <div class="container-fluid pt-4 px-4">
                <h1 class="h3 mb-2 text-gray-800">Blogs</h1>
                <p class="mb-4">Danh sách bài viết trong hệ thống.</p>

                <div class="mb-3">
                    <a href="${pageContext.request.contextPath}/CreateBlogServlet" class="btn btn-primary">Thêm bài viết</a>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Blog Table</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tiêu đề</th>
                                    <th>Tác giả</th>
                                    <th>Ảnh cover</th>
                                    <th>Ngày tạo</th>
                                    <th>#</th>
                                    <th>#</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="index" value="0"/>
                                <c:forEach items="${blogpostsList}" var="b">
                                    <c:set var="index" value="${index + 1}"/>
                                    <tr>
                                        <td>${index}</td>
                                        <td>${b.title}</td>
                                        <td>
                                            <c:set var="found" value="false" />
                                            <c:forEach var="u" items="${users}">
                                                <c:if test="${u.user_id eq b.author_id}">
                                                    ${u.fullname}
                                                    <c:set var="found" value="true" />
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${not found}">
                                                ${b.author_id}
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${not empty b.cover_image}">
                                                <img src="${pageContext.request.contextPath}/img/${b.cover_image}" style="max-height: 60px;" alt="Cover" />
                                            </c:if>
                                        </td>
                                        <td>${b.created_at}</td>
                                        <td>
                                            <a href="EditBlogServlet?postId=${b.post_id}"><i class="bi bi-pencil-square"></i></a>
                                        </td>
                                        <td>
                                            <a href="DeleteBlogServlet?postId=${b.post_id}" class="text-danger"><i class="fa fa-trash"></i></a>
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
    <!-- Content End -->

</div>

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
