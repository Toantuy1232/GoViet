<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Topbar Start -->
        <div class="container-fluid bg-primary px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href=""><i class="fab fa-youtube fw-normal"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <div class="dropdown">
                            <%
                              toan.dev.data.model.Users currentUser = (toan.dev.data.model.Users) session.getAttribute("user");
                              boolean isAdmin = (currentUser != null && "admin".equals(currentUser.getRole()));
                              String displayName = (currentUser != null ? currentUser.getEmail() : null);
                              String fullNameLine = (currentUser != null && currentUser.getFullname() != null && !currentUser.getFullname().trim().isEmpty())
                                      ? currentUser.getFullname() : (currentUser != null ? currentUser.getEmail() : null);
                            %>
                            <a href="#" class="dropdown-toggle text-light" data-bs-toggle="dropdown"><small>
                                <i class="fa fa-user me-2"></i>
                                <%= (displayName != null) ? displayName : "Tài khoản" %>
                            </small></a>
                            <div class="dropdown-menu rounded">
                              <%
                                if (currentUser == null) {
                              %>
                                <a href="${pageContext.request.contextPath}/LoginServlet" class="dropdown-item">Đăng nhập</a>
                                <a href="${pageContext.request.contextPath}/RegisterServlet" class="dropdown-item">Đăng ký</a>
                              <%
                                } else {
                              %>
                                <span class="dropdown-item-text"><strong><%= displayName %></strong></span>
                                <span class="dropdown-item-text text-muted"><%= fullNameLine %></span>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">Danh sách yêu thích</a>
                                <a href="${pageContext.request.contextPath}/CartServlet" class="dropdown-item">Giỏ hàng của tôi</a>
                                <a href="${pageContext.request.contextPath}/UserServlet" class="dropdown-item">Cài đặt tài khoản</a>
                                <a href="${pageContext.request.contextPath}/ProfileServlet" class="dropdown-item">Tài khoản của tôi</a>
                                <%
                                  if (isAdmin) {
                                %>
                                  <a href="${pageContext.request.contextPath}/DashboardServlet" class="dropdown-item">Trang quản trị</a>
                                <%
                                  }
                                %>
                                <div class="dropdown-divider"></div>
                                <a href="${pageContext.request.contextPath}/LogoutServlet" class="dropdown-item">Đăng xuất</a>
                              <%
                                }
                              %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="${pageContext.request.contextPath}/HomeServlet" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-map-marker-alt me-3"></i>GoViet</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="${pageContext.request.contextPath}/HomeServlet" class="nav-item nav-link active">Trang chủ</a>
                        <a href="${pageContext.request.contextPath}/about.jsp" class="nav-item nav-link">Giới thiệu</a>
                        <a href="${pageContext.request.contextPath}/services.html" class="nav-item nav-link">Dịch vụ</a>
                        <a href="${pageContext.request.contextPath}/BlogServlet" class="nav-item nav-link">Bài viết</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tour</a>
                            <div class="dropdown-menu m-0">
                                <c:forEach items="${categoryList}" var="cat">
                                    <c:if test="${cat.status}">
                                        <a href="${pageContext.request.contextPath}/destination.jsp?categoryId=${cat.id}" class="dropdown-item">
                                            ${cat.name}
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Trang</a>
                            <div class="dropdown-menu m-0">
                                <a href="${pageContext.request.contextPath}/DestinationServlet" class="dropdown-item">Điểm đến</a>
                                <a href="${pageContext.request.contextPath}/tour.html" class="dropdown-item">Khám phá chuyến tham quan</a>
                                <a href="${pageContext.request.contextPath}/booking.jsp" class="dropdown-item">Đặt chỗ du lịch</a>
                                <a href="${pageContext.request.contextPath}/404.jsp" class="dropdown-item">404</a>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/contact.jsp" class="nav-item nav-link">Liên Hệ</a>
                    </div>
                    <a href="" class="btn btn-primary rounded-pill py-2 px-4 ms-lg-4">Đăng ký tư vấn</a>
                </div>
            </nav>

            <!-- Carousel Start -->
            <div class="carousel-header">
                <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <%
                            java.util.List<toan.dev.data.model.Banner> bannerList =
                                (java.util.List<toan.dev.data.model.Banner>) request.getAttribute("bannerList");
                            int count = 0;
                            if (bannerList != null) {
                              for (toan.dev.data.model.Banner banner : bannerList) {
                                if (count >= 10) break; // lấy tối đa 10 ảnh banner
                        %>
                        <li data-bs-target="#carouselId" data-bs-slide-to="<%= count %>" class="<%= count == 0 ? "active" : "" %>"></li>
                        <%
                                count++;
                              }
                            }
                        %>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <%
                            count = 0;
                            boolean first = true;
                            if (bannerList != null) {
                              for (toan.dev.data.model.Banner banner : bannerList) {
                                if (count >= 10) break; // lấy tối đa 10 ảnh banner
                        %>
                        <div class="carousel-item <%= first ? "active" : "" %>">
                            <img src="${pageContext.request.contextPath}/img/<%= banner.getImage() %>" class="img-fluid" alt="<%= banner.getTitle() %>">
            
                        </div>
                        <%
                                first = false;
                                count++;
                              }
                            }
                        %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon btn bg-primary" aria-hidden="false"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon btn bg-primary" aria-hidden="false"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <!-- Carousel End -->
        </div>
        <div class="container-fluid search-bar position-relative" style="top: -50%; transform: translateY(-50%);">
            <div class="container">
                <div class="position-relative rounded-pill w-100 mx-auto p-5" style="background: rgba(19, 53, 123, 0.8);">
                    <input class="form-control border-0 rounded-pill w-100 py-3 ps-4 pe-5" type="text" placeholder="Eg: Thailand">
                    <button type="button" class="btn btn-primary rounded-pill py-2 px-4 position-absolute me-2" style="top: 50%; right: 46px; transform: translateY(-50%);">Search</button>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->