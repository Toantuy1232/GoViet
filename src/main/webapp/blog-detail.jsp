<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${blogPost.title} - GoViet Travel</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="${fn:substring(blogPost.content, 0, 150)}..." name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.ico" rel="icon">

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
    <!-- Header Start -->
    <%@include file="./inc/header.jsp" %>
    <!-- Header End -->

    <!-- Blog Detail Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row g-5">
                <!-- Blog Detail Start -->
                <div class="col-lg-8">
                    <div class="mb-5">
                        <img class="img-fluid w-100 rounded mb-4" src="${pageContext.request.contextPath}/img/${blogPost.cover_image}" alt="${blogPost.title}">
                        <h1 class="mb-4">${blogPost.title}</h1>
                        <div class="d-flex mb-3">
                            <span class="me-3">
                                <i class="far fa-calendar-alt text-primary me-2"></i>
                                <fmt:formatDate value="${blogPost.created_at}" pattern="dd/MM/yyyy" />
                            </span>
                            <span class="me-3">
                                <i class="far fa-user text-primary me-2"></i>
                                <c:set var="foundAuthor" value="false" />
                                <c:forEach var="u" items="${users}">
                                    <c:if test="${u.user_id eq blogPost.author_id}">
                                        ${u.fullname}
                                        <c:set var="foundAuthor" value="true" />
                                    </c:if>
                                </c:forEach>
                                <c:if test="${not foundAuthor}">
                                    Admin
                                </c:if>
                            </span>
                            <span>
                                <i class="far fa-eye text-primary me-2"></i>${blogPost.views} lượt xem
                            </span>
                        </div>
                        <div class="blog-content">
                            ${blogPost.content}
                        </div>
                        
                        <div class="d-flex justify-content-between border-top border-bottom py-3 my-4">
                            <div class="d-flex align-items-center">
                                <span class="me-3">Chia sẻ:</span>
                                <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-outline-primary btn-square" href="#"><i class="fab fa-pinterest"></i></a>
                            </div>
                            <div class="d-flex">
                                <a class="btn btn-outline-primary btn-square me-2" href="#"><i class="far fa-thumbs-up"></i> Thích</a>
                                <a class="btn btn-outline-primary btn-square" href="#comments"><i class="far fa-comment-dots"></i> Bình luận</a>
                            </div>
                        </div>
                        
                        <!-- Related Posts -->
                        <div class="mb-5">
                            <h4 class="mb-4">Bài viết liên quan</h4>
                            <div class="row g-4">
                                <c:forEach var="relatedPost" items="${relatedPosts}" end="2">
                                    <div class="col-md-6">
                                        <div class="blog-item">
                                            <div class="blog-img">
                                                <div class="blog-img-inner">
                                                    <img class="img-fluid w-100 rounded" src="${pageContext.request.contextPath}/img/${relatedPost.cover_image}" alt="${relatedPost.title}">
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <a href="${pageContext.request.contextPath}/blog-detail?id=${relatedPost.id}" class="h5">${relatedPost.title}</a>
                                                <p class="mt-2"><i class="far fa-calendar-alt text-primary me-2"></i> 
                                                    <fmt:formatDate value="${relatedPost.created_at}" pattern="dd/MM/yyyy" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <!-- Comments -->
                        <div id="comments" class="mb-5">
                            <h4 class="mb-4">Bình luận (${comments.size()})</h4>
                            <div class="mb-5">
                                <c:forEach var="comment" items="${comments}">
                                    <div class="d-flex mb-4">
                                        <img src="${pageContext.request.contextPath}/assets/img/user.jpg" class="img-fluid rounded-circle" style="width: 45px; height: 45px; object-fit: cover;">
                                        <div class="ps-3">
                                            <h6>${comment.userName} <small><i>${comment.created_at}</i></small></h6>
                                            <p>${comment.content}</p>
                                            <button class="btn btn-sm btn-link">Trả lời</button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            
                            <!-- Comment Form -->
                            <div class="bg-light p-4">
                                <h4 class="mb-4">Để lại bình luận</h4>
                                <form action="${pageContext.request.contextPath}/CommentServlet" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="blog_id" value="${blogPost.id}">
                                    <div class="form-group mb-3">
                                        <label for="content">Nội dung bình luận</label>
                                        <textarea class="form-control" id="content" name="content" rows="4" required></textarea>
                                    </div>
                                    <div class="form-group mb-0 text-end">
                                        <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Blog Detail End -->

                <!-- Sidebar Start -->
                <div class="col-lg-4">
                    <!-- Search Form -->
                    <div class="mb-5">
                        <div class="input-group">
                            <input type="text" class="form-control p-3" placeholder="Tìm kiếm...">
                            <button class="btn btn-primary px-4"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                    <!-- Categories -->
                    <div class="mb-5">
                        <h4 class="mb-4">Danh mục</h4>
                        <div class="d-flex flex-column">
                            <c:forEach var="category" items="${categories}">
                                <a class="h5 mb-2" href="${pageContext.request.contextPath}/blog?category=${category.id}">
                                    <i class="fa fa-angle-right me-2"></i>${category.name} (${category.post_count})
                                </a>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Recent Posts -->
                    <div class="mb-5">
                        <h4 class="mb-4">Bài viết gần đây</h4>
                        <c:forEach var="recentPost" items="${recentPosts}" end="3">
                            <div class="d-flex mb-3">
                                <img src="${pageContext.request.contextPath}/img/${recentPost.cover_image}" class="img-fluid" style="width: 100px; height: 70px; object-fit: cover;" alt="${recentPost.title}">
                                <a href="${pageContext.request.contextPath}/blog-detail?id=${recentPost.id}" class="h6 d-flex align-items-center bg-white px-3 mb-0">
                                    ${recentPost.title}
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Tags -->
                    <div class="mb-5">
                        <h4 class="mb-4">Tags</h4>
                        <div class="d-flex flex-wrap m-n1">
                            <c:forTokens items="${blogPost.tags}" delims="," var="tag">
                                <a href="${pageContext.request.contextPath}/blog?tag=${tag.trim()}" class="btn btn-outline-primary m-1">${tag.trim()}</a>
                            </c:forTokens>
                        </div>
                    </div>
                </div>
                <!-- Sidebar End -->
            </div>
        </div>
    </div>
    <!-- Blog Detail End -->

    <!-- Footer Start -->
    <%@include file="./inc/footer.jsp" %>
    <!-- Footer End -->

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
