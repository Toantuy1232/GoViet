<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Sửa tin nhắn - Admin</title>
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
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Sửa tin nhắn</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="${pageContext.request.contextPath}/admin/chat-ai/edit">
                            <input type="hidden" name="id" value="${message.id}">

                            <div class="mb-3">
                                <label class="form-label">Người gửi</label>
                                <select name="senderId" class="form-select" required>
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.user_id}" ${user.user_id == message.senderId ? 'selected' : ''}>
                                            ${user.fullname} (${user.email})
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Người nhận</label>
                                <select name="receiverId" class="form-select" required>
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.user_id}" ${user.user_id == message.receiverId ? 'selected' : ''}>
                                            ${user.fullname} (${user.email})
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nội dung</label>
                                <textarea name="content" class="form-control" rows="5" required>${message.content}</textarea>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/admin/chat-ai" class="btn btn-secondary">Quay lại</a>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </form>
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
