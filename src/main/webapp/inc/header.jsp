<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="toan.dev.data.model.Users" %>
<%@ page import="toan.dev.data.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>

<%-- Initialize variables safely --%>
<% 
    Users currentUser = null;
    String displayName = "";
    String fullNameLine = "";
    boolean isAdmin = false;
    
    try {
        currentUser = (Users) session.getAttribute("user");
        if (currentUser != null) {
            displayName = currentUser.getEmail();
            fullNameLine = (currentUser.getFullname() != null && !currentUser.getFullname().trim().isEmpty()) 
                ? currentUser.getFullname() : currentUser.getEmail();
            isAdmin = "admin".equals(currentUser.getRole());
        }
    } catch (Exception e) {
        // Log the error but don't show it to users
        System.err.println("Error initializing user data: " + e.getMessage());
    }
%>

<!-- Add this style block in the head section -->
<style>
    /* Dropdown styles */
    .dropdown-menu {
        display: block !important;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        margin-top: 0;
        position: absolute;
        z-index: 1060;
        min-width: 200px;
        padding: 0.5rem 0;
        margin: 0.125rem 0 0;
        font-size: 0.875rem;
        color: #212529;
        text-align: left;
        list-style: none;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid rgba(0, 0, 0, 0.15);
        border-radius: 0.25rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.175);
    }
    
    .dropdown-menu.show {
        opacity: 1;
        visibility: visible;
        display: block;
    }
    
    .dropdown-item {
        padding: 0.5rem 1.5rem;
        display: flex;
        align-items: center;
        color: #212529;
        text-decoration: none;
        transition: all 0.2s;
    }
    .dropdown-item:hover, .dropdown-item:focus {
        background-color: #f8f9fa;
        color: #16181b;
    }
    .dropdown-item i {
        width: 20px;
        margin-right: 10px;
        text-align: center;
    }
    .dropdown-divider {
        height: 0;
        margin: 0.5rem 0;
        overflow: hidden;
        border-top: 1px solid #e9ecef;
    }
    .dropdown-header {
        display: block;
        padding: 0.5rem 1.5rem;
        margin-bottom: 0;
        font-size: 0.875rem;
        color: #6c757d;
        white-space: nowrap;
    }
    .dropdown-toggle::after {
        display: inline-block;
        margin-left: 0.255em;
        vertical-align: 0.255em;
        content: "";
        border-top: 0.3em solid;
        border-right: 0.3em solid transparent;
        border-bottom: 0;
        border-left: 0.3em solid transparent;
    }
</style>

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
                            <button class="btn btn-link nav-link text-light dropdown-toggle p-0" 
                                    type="button" 
                                    id="userDropdown" 
                                    data-bs-toggle="dropdown" 
                                    aria-expanded="false"
                                    style="background: none; border: none; outline: none;">
                                <i class="fas fa-user me-1"></i>
                                <span class="d-none d-sm-inline"><%= (displayName != null && !displayName.isEmpty()) ? displayName : "Tài khoản" %></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown" style="min-width: 200px;">
                                <%
                                if (currentUser == null) {
                                %>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/LoginServlet"><i class="fas fa-sign-in-alt me-2"></i>Đăng nhập</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/RegisterServlet"><i class="fas fa-user-plus me-2"></i>Đăng ký</a></li>
                                <%
                                } else {
                                %>
                                    <li class="dropdown-header">
                                        <div class="fw-bold"><%= displayName %></div>
                                        <div class="small text-muted"><%= fullNameLine %></div>
                                    </li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-heart me-2"></i>Danh sách yêu thích</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/CartServlet"><i class="fas fa-shopping-cart me-2"></i>Giỏ hàng của tôi</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ProfileServlet"><i class="fas fa-user-cog me-2"></i>Tài khoản của tôi</a></li>
                                    <%
                                    if (isAdmin) {
                                    %>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/DashboardServlet"><i class="fas fa-tachometer-alt me-2"></i>Trang quản trị</a></li>
                                    <%
                                    }
                                    %>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                                <%
                                }
                                %>
                            </ul>
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
                        <a href="${pageContext.request.contextPath}/AboutServlet" class="nav-item nav-link">Giới thiệu</a>
                        <a href="${pageContext.request.contextPath}/ServicesServlet" class="nav-item nav-link">Dịch vụ</a>
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
                        <a href="${pageContext.request.contextPath}/ContactServlet" class="nav-item nav-link">Liên Hệ</a>
                        <%
                        if (currentUser != null) {
                        %>
                            <a href="${pageContext.request.contextPath}/chat" class="nav-item nav-link">
                                <i class="fas fa-robot"></i> Chat AI
                            </a>
                        <%
                        } else {
                        %>
                            <a href="#" class="nav-item nav-link" onclick="showLoginToast(); return false;">
                                <i class="fas fa-robot"></i> Chat AI
                            </a>
                        <%
                        }
                        %>
                    </div>
                    <div class="d-flex align-items-center ms-lg-4">
                        <a href="${pageContext.request.contextPath}/cart" class="btn btn-outline-primary rounded-circle me-2 position-relative" style="width: 40px; height: 40px; padding: 8px;">
                            <i class="fas fa-shopping-cart"></i>
                            <%
                                int cartCount = 0;
                                if (currentUser != null) {
                                    try {
                                        toan.dev.data.dao.CartDao cartDao = toan.dev.data.dao.DatabaseDao.getInstance().getCartDao();
                                        cartCount = cartDao.getCartCount(currentUser.getUser_id());
                                    } catch (Exception e) {
                                        System.err.println("Error getting cart count: " + e.getMessage());
                                    }
                                }
                                if (cartCount > 0) {
                            %>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.7rem;">
                                    <%= cartCount %>
                                </span>
                            <% } %>
                        </a>
                        <a href="${pageContext.request.contextPath}/consultation" class="btn btn-primary rounded-pill py-2 px-4">Đăng ký tư vấn</a>
                    </div>
                </div>
            </nav>

            <!-- Carousel Start -->
            <!-- Initialize Bootstrap dropdowns -->
            <script>
                // Simple dropdown initialization that won't cause errors
                document.addEventListener('DOMContentLoaded', function() {
                    try {
                        // Safely initialize dropdowns if Bootstrap is available
                        if (typeof bootstrap !== 'undefined') {
                            var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
                            dropdownElementList.forEach(function(dropdownToggleEl) {
                                try {
                                    new bootstrap.Dropdown(dropdownToggleEl);
                                } catch (e) {
                                    console.error('Error initializing dropdown:', e);
                                }
                            });

                            // Close dropdowns when clicking outside
                            document.addEventListener('click', function(event) {
                                if (!event.target.closest('.dropdown')) {
                                    var dropdowns = document.querySelectorAll('.dropdown-menu.show');
                                    dropdowns.forEach(function(dropdown) {
                                        var toggle = dropdown.previousElementSibling;
                                        if (toggle && toggle.matches('[data-bs-toggle="dropdown"]')) {
                                            var bsDropdown = bootstrap.Dropdown.getInstance(toggle);
                                            if (bsDropdown) {
                                                bsDropdown.hide();
                                            }
                                        }
                                    });
                                }
                            });
                        }
                    } catch (e) {
                        console.error('Error in dropdown initialization:', e);
                    }
                });
            </script>
            
            <c:if test="${empty hideBanner or !hideBanner}">
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
            </c:if>
            <!-- Carousel End -->
        </div>
       <!-- Replace your existing search bar with this one -->
       <c:if test="${empty hideBanner or !hideBanner}">
       <div class="container-fluid search-bar position-relative" style="top: -50%; transform: translateY(-50%);">
           <div class="container">
               <form action="SearchServlet" method="GET" class="position-relative rounded-pill w-100 mx-auto p-5" style="background: rgba(19, 53, 123, 0.8);">
                   <div class="input-group">
                       <select name="categoryId" class="form-select rounded-pill" style="max-width: 200px;">
                           <option value="0">Tất cả danh mục</option>
                           <c:forEach items="${categories}" var="category">
                               <option value="${category.id}">${category.name}</option>
                           </c:forEach>
                       </select>
                       <input type="text" name="searchTerm" class="form-control border-0 rounded-pill mx-2" placeholder="Nhập tên tour hoặc điểm đến...">
                       <button type="submit" class="btn btn-primary rounded-pill px-4">Tìm Kiếm</button>
                   </div>
               </form>
           </div>
       </div>
       </c:if>
        <!-- Navbar & Hero End -->

<!-- Toast Notification -->
<div id="loginToast" style="position: fixed; top: 80px; right: 20px; z-index: 9999; display: none;">
    <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="min-width: 300px;">
        <div class="toast-header bg-warning text-white">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <strong class="me-auto">Thông báo</strong>
            <button type="button" class="btn-close btn-close-white" onclick="hideLoginToast()"></button>
        </div>
        <div class="toast-body">
            Vui lòng <a href="${pageContext.request.contextPath}/LoginServlet" class="text-primary fw-bold">đăng nhập</a> để sử dụng tính năng Chat AI!
        </div>
    </div>
</div>

<script>
function showLoginToast() {
    const toast = document.getElementById('loginToast');
    toast.style.display = 'block';
    
    // Auto hide after 5 seconds
    setTimeout(function() {
        hideLoginToast();
    }, 5000);
}

function hideLoginToast() {
    const toast = document.getElementById('loginToast');
    toast.style.display = 'none';
}
</script>