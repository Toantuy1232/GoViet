<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Chat AI - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        
        <%@include file="../inc/sidebar.jsp" %>

        <!-- Content Start -->
        <div class="content">
            
            <%@include file="../inc/navbar.jsp" %>

            <div class="container-fluid pt-4 px-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center my-4">
                    <h2><i class="fas fa-robot"></i> Quản lý Chat AI</h2>
                    <a href="${pageContext.request.contextPath}/CreateChatAIServlet" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm tin nhắn mới
                    </a>
                </div>

                <c:if test="${param.message == 'create_success'}">
                    <div class="alert alert-success">Thêm tin nhắn thành công!</div>
                </c:if>
                <c:if test="${param.message == 'update_success'}">
                    <div class="alert alert-success">Cập nhật tin nhắn thành công!</div>
                </c:if>
                <c:if test="${param.message == 'delete_success'}">
                    <div class="alert alert-success">Xóa tin nhắn thành công!</div>
                </c:if>

                <div class="card">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Người gửi</th>
                                    <th>Người nhận</th>
                                    <th>Nội dung</th>
                                    <th>Thời gian</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${messages}" var="msg">
                                    <tr>
                                        <td>${msg.id}</td>
                                        <td>${msg.senderId}</td>
                                        <td>${msg.receiverId}</td>
                                        <td>${msg.content}</td>
                                        <td>${msg.sentAt}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/chat-ai/edit?id=${msg.id}" 
                                               class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/admin/chat-ai/delete?id=${msg.id}" 
                                               class="btn btn-sm btn-danger"
                                               onclick="return confirm('Bạn có chắc muốn xóa?')">
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
            
            <%@include file="../inc/footer.jsp" %>
            
        </div>
        <!-- Content End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
