 <link href="${pageContext.request.contextPath}/assets/admin/css/admin-fix.css" rel="stylesheet">

<!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="${pageContext.request.contextPath}/DashboardServlet" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                     <div class="position-relative">
                        <img class="rounded-circle" src="${pageContext.request.contextPath}/img/avatar.jpg" alt="" style="width: 40px; height: 40px;">
                         <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                     </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${sessionScope.user.email}</h6>
                        <span>${sessionScope.user.role}</span>
                    </div>
                </div>
              
                <div class="navbar-nav w-100">
                    <a href="${pageContext.request.contextPath}/DashboardServlet" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>

                        <div class="nav-item dropdown">
                                 <a href="${pageContext.request.contextPath}/IndexUserServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-user me-2"></i>Users</a>
                                 <div class="dropdown-menu bg-transparent border-0">
                                 <a href="${pageContext.request.contextPath}/IndexUserServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateUserServlet" class="dropdown-item">Add</a>
                         </div>
                        </div>


                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/IndexCategoryServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-layer-group me-2"></i>Categories</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexCategoryServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateCategoryServlet" class="dropdown-item">Add</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/IndexCategoryGalleryServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-images me-2"></i>Category Gallery</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexCategoryGalleryServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateCategoryGalleryServlet" class="dropdown-item">Add</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/IndexBannerServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-image me-2"></i>Banners</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexBannerServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateBannerServlet" class="dropdown-item">Add</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/IndexBlogServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-blog me-2"></i>Blogs</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexBlogServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateBlogServlet" class="dropdown-item">Add</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                     <a href="${pageContext.request.contextPath}/IndexProductsServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-shopping-cart me-2"></i>Products</a>
                     <div class="dropdown-menu bg-transparent border-0">
                          <a href="${pageContext.request.contextPath}/IndexProductsServlet" class="dropdown-item">All</a>
                           <a href="${pageContext.request.contextPath}/CreateProductServlet" class="dropdown-item">Add</a>
                      </div>
                      </div>

                    <div class="nav-item dropdown">
                     <a href="${pageContext.request.contextPath}/IndexTourServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-route me-2"></i>Tours</a>
                     <div class="dropdown-menu bg-transparent border-0">
                          <a href="${pageContext.request.contextPath}/IndexTourServlet" class="dropdown-item">All</a>
                           <a href="${pageContext.request.contextPath}/CreateTourServlet" class="dropdown-item">Add</a>
                      </div>
                      </div>

                    <div class="nav-item dropdown">
                     <a href="${pageContext.request.contextPath}/IndexDestinationsServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-map-marker-alt me-2"></i>Destinations</a>
                     <div class="dropdown-menu bg-transparent border-0">
                          <a href="${pageContext.request.contextPath}/IndexDestinationsServlet" class="dropdown-item">All</a>
                           <a href="${pageContext.request.contextPath}/CreateDestinationsServlet" class="dropdown-item">Add</a>
                      </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/IndexHotelServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-hotel me-2"></i>Hotels
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexHotelServlet" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/CreateHotelServlet" class="dropdown-item">Add</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                     <a href="${pageContext.request.contextPath}/IndexOrderServlet" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-receipt me-2"></i>Orders</a>
                     <div class="dropdown-menu bg-transparent border-0">
                          <a href="${pageContext.request.contextPath}/IndexOrderServlet" class="dropdown-item">All</a>
                      </div>
                      </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/admin/bookings" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-calendar-check me-2"></i>Bookings
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/admin/bookings" class="dropdown-item">All</a>
                            <a href="${pageContext.request.contextPath}/admin/bookings?status=pending" class="dropdown-item">Pending</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/admin/consultations" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-clipboard-list me-2"></i>Consultations
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.request.contextPath}/IndexConsultationServlet" class="dropdown-item">All</a>
                        </div>
                    </div>

                </div>
            </nav>
        </div>
        <!-- Sidebar End -->