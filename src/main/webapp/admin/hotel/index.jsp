<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Quản lý khách sạn</title>
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

        <style>
            #content {
                margin-left: 250px; 
                width: calc(100% - 250px);
                min-height: 100vh;
            }

            @media (max-width: 768px) {
                #content {
                    margin-left: 0;
                    width: 100%;
                }
            }
        
.sidebar {
    width: 250px;
    min-height: 100vh;
    transition: all 0.3s;
    position: fixed;
    z-index: 100;
    top: 0;
    left: 0;
    height: 100vh;
    overflow-y: auto;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.sidebar-toggled .sidebar {
    margin-left: -250px;
}
.content {
    margin-left: 250px;
    min-height: 100vh;
    transition: all 0.3s;
}

.sidebar-toggled .content {
    margin-left: 0;
    width: 100%;
}
@media (max-width: 992px) {
    .sidebar {
        margin-left: -250px;
    }
    
    .sidebar-toggled .sidebar {
        margin-left: 0;
    }
    
    .content {
        margin-left: 0;
        width: 100%;
    }
    
    .sidebar-toggled .content {
        margin-left: 0;
    }
}

.navbar {
    padding: 0.5rem 1rem;
}

.sidebar-toggled .navbar-brand {
    margin-left: 0;
}

.navbar,
.sidebar,
.content {
    transition: all 0.3s ease;
}
        </style>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="../inc/sidebar.jsp" %>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
              
                    <%@include file="../inc/navbar.jsp" %>
                
                    <div class="container-fluid">
                   
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Quản lý khách sạn</h1>
                            <a href="CreateHotelServlet" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-plus fa-sm text-white-50"></i> Thêm mới
                            </a>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Danh sách khách sạn</h6>
                                    </div>
                                    <div class="card-body">
                                        <c:if test="${not empty successMessage}">
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                ${successMessage}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>

                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover align-middle" id="dataTable">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Hình ảnh</th>
                                                                <th>Tên khách sạn</th>
                                                                <th>Địa chỉ</th>
                                                                <th>Giá/đêm</th>
                                                                <th>Hạng sao</th>
                                                                <th>Thao tác</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="hotel" items="${hotelsList}">
                                                                <tr>
                                                                    <td>
                                                                        <c:if test="${not empty hotel.image_url}">
                                                                            <img src="${pageContext.request.contextPath}/uploads/hotels/${hotel.image_url}"
                                                                                 width="70" 
                                                                                 height="50" 
                                                                                 style="object-fit:cover" 
                                                                                 alt="${hotel.name}"
                                                                                 onerror="console.error('Image not found: ${pageContext.request.contextPath}/uploads/hotels/${hotel.image_url}')"/>
                                                                        </c:if>
                                                                    </td>
                                                                    <td>
                                                                        <div class="fw-bold">${hotel.name}</div>
                                                                        <small class="text-muted">ID: ${hotel.hotel_id}</small>
                                                                    </td>
                                                                    <td>${hotel.address}</td>
                                                                    <td class="text-nowrap">
                                                                        <span class="fw-bold text-primary">
                                                                            <fmt:formatNumber value="${hotel.price_per_night * 1000}" type="currency" currencyCode="VND" pattern="#,##0" />₫
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex align-items-center">
                                                                            <c:forEach begin="1" end="${hotel.stars}" varStatus="loop">
                                                                                <i class="bi bi-star-fill text-warning me-1"></i>
                                                                            </c:forEach>
                                                                            <c:if test="${hotel.stars < 5}">
                                                                                <c:forEach begin="1" end="${5 - hotel.stars}" varStatus="loop">
                                                                                    <i class="bi bi-star text-muted me-1"></i>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                            <span class="ms-2">${hotel.stars} sao</span>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex">
                                                                            <a href="EditHotelServlet?id=${hotel.hotel_id}" 
                                                                               class="btn btn-sm btn-outline-primary me-2" 
                                                                               data-bs-toggle="tooltip" title="Chỉnh sửa">
                                                                                <i class="bi bi-pencil"></i>
                                                                            </a>
                                                                            <form action="DeleteHotelServlet" method="POST" class="d-inline" 
                                                                                  onsubmit="return confirm('Bạn có chắc chắn muốn xóa khách sạn này?')">
                                                                                <input type="hidden" name="id" value="${hotel.hotel_id}">
                                                                                <button type="submit" class="btn btn-sm btn-outline-danger"
                                                                                        data-bs-toggle="tooltip" title="Xóa">
                                                                                    <i class="bi bi-trash"></i>
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                            <c:if test="${empty hotelsList}">
                                                                <tr>
                                                                    <td colspan="6" class="text-center py-4 text-muted">
                                                                        <i class="bi bi-building-x" style="font-size: 2rem;"></i>
                                                                        <p class="mt-2 mb-0">Không có khách sạn nào được tìm thấy</p>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                
                </div>
        
            </div>
     
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>


            <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


            <script src="${pageContext.request.contextPath}/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>


            <script src="${pageContext.request.contextPath}/assets/admin/js/sb-admin-2.min.js"></script>

       
            <script src="${pageContext.request.contextPath}/assets/admin/vendor/chart.js/Chart.min.js"></script>

            <script src="${pageContext.request.contextPath}/assets/admin/js/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/assets/admin/js/demo/chart-pie-demo.js"></script>

            <script>
    
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });

                $(document).ready(function() {
                    $('#dataTable').DataTable({
                        "language": {
                            "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json"
                        },
                        "order": [[0, "desc"]]
                    });
                });
                function confirmDelete(hotelId) {
                    if (confirm('Bạn có chắc chắn muốn xóa khách sạn này?')) {
                        window.location.href = 'DeleteHotelServlet?id=' + hotelId;
                    }
                }
            </script>
        </body>
    </html>
