<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>DASHMIN - Edit Blog</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="${pageContext.request.contextPath}/assets/admin/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
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
                <%
                    toan.dev.data.model.Blogposts blog = (toan.dev.data.model.Blogposts) request.getAttribute("blog");
                    java.util.List<toan.dev.data.model.Users> users = (java.util.List<toan.dev.data.model.Users>) request.getAttribute("users");
                %>
                <h1 class="h3 mb-2 text-gray-800">Sửa bài viết</h1>
                <p class="mb-4">Chỉnh sửa thông tin bài viết blog.</p>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Thông tin bài viết</h6>
                    </div>
                    <div class="card-body">
                        <form method="post" action="${pageContext.request.contextPath}/EditBlogServlet" enctype="multipart/form-data">
                            <input type="hidden" name="postId" value="<%= blog != null ? blog.getPost_id() : 0 %>" />
                            <div class="mb-3">
                                <label class="form-label">Tiêu đề</label>
                                <input type="text" name="title" class="form-control" value="<%= blog != null ? blog.getTitle() : "" %>" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nội dung</label>
                                <textarea name="content" rows="6" class="form-control" required><%= blog != null ? blog.getContent() : "" %></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ảnh cover</label>
                                <input type="file" name="cover_file" class="form-control" accept="image/*" />
                                <% if (blog != null && blog.getCover_image() != null) { %>
                                    <div class="mt-2">
                                        <img src="${pageContext.request.contextPath}/img/<%= blog.getCover_image() %>" alt="Cover" style="max-height: 120px;">
                                    </div>
                                <% } %>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tác giả (tùy chọn)</label>
                                <select name="author_id" class="form-select">
                                    <option value="">-- Chọn tác giả --</option>
                                    <%
                                        int currentAuthorId = blog != null ? blog.getAuthor_id() : 0;
                                        if (users != null) {
                                            for (toan.dev.data.model.Users u : users) {
                                                boolean selected = (u.user_id == currentAuthorId);
                                    %>
                                        <option value="<%= u.user_id %>" <%= selected ? "selected" : "" %>>
                                            <%= u.fullname %> (<%= u.email %>)
                                        </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                            <a href="${pageContext.request.contextPath}/IndexBlogServlet" class="btn btn-secondary">Hủy</a>
                        </form>
                    </div>
                </div>
            </div>

        <%@include file="../inc/footer.jsp" %>

    </div>
    <!-- Content End -->

</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
