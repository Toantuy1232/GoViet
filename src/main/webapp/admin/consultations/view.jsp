<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Chi tiết Đăng ký Tư vấn</title>
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
            
            .badge {
                font-weight: 500;
                padding: 0.4em 0.7em;
                font-size: 0.75rem;
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
                            <h1 class="h3 mb-0 text-gray-800">Chi tiết Đăng ký Tư vấn</h1>
                            <a href="${pageContext.request.contextPath}/IndexConsultationServlet" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
                                <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại
                            </a>
                        </div>

                        <div class="row">
                            <div class="col-md-8">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Thông tin khách hàng</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Họ và tên:</label>
                                                <p class="text-gray-800">${consultation.fullName}</p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Email:</label>
                                                <p><a href="mailto:${consultation.email}">${consultation.email}</a></p>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Số điện thoại:</label>
                                                <p><a href="tel:${consultation.phone}">${consultation.phone}</a></p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Trạng thái:</label>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${consultation.status == 'pending'}">
                                                            <span class="badge bg-warning">Chờ xử lý</span>
                                                        </c:when>
                                                        <c:when test="${consultation.status == 'contacted'}">
                                                            <span class="badge bg-info">Đã liên hệ</span>
                                                        </c:when>
                                                        <c:when test="${consultation.status == 'completed'}">
                                                            <span class="badge bg-success">Hoàn thành</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary">Đã hủy</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Điểm đến mong muốn:</label>
                                                <p class="text-gray-800">${consultation.destination}</p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Ngày dự kiến đi:</label>
                                                <p class="text-gray-800">${consultation.travelDate}</p>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Số người:</label>
                                                <p class="text-gray-800">${consultation.numberOfPeople} người</p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Ngân sách dự kiến:</label>
                                                <p class="text-gray-800">
                                                    <c:choose>
                                                        <c:when test="${consultation.budget == 'under-5m'}">Dưới 5 triệu</c:when>
                                                        <c:when test="${consultation.budget == '5m-10m'}">5 - 10 triệu</c:when>
                                                        <c:when test="${consultation.budget == '10m-20m'}">10 - 20 triệu</c:when>
                                                        <c:when test="${consultation.budget == '20m-50m'}">20 - 50 triệu</c:when>
                                                        <c:when test="${consultation.budget == 'over-50m'}">Trên 50 triệu</c:when>
                                                        <c:otherwise>${consultation.budget}</c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="mb-3">
                                            <label class="font-weight-bold">Ghi chú:</label>
                                            <p class="text-muted">${consultation.message}</p>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Ngày đăng ký:</label>
                                                <p class="text-gray-800"><fmt:formatDate value="${consultation.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="font-weight-bold">Cập nhật lần cuối:</label>
                                                <p class="text-gray-800">
                                                    <c:if test="${consultation.updatedAt != null}">
                                                        <fmt:formatDate value="${consultation.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                                    </c:if>
                                                    <c:if test="${consultation.updatedAt == null}">
                                                        Chưa cập nhật
                                                    </c:if>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 bg-info text-white">
                                        <h6 class="m-0 font-weight-bold">Cập nhật trạng thái</h6>
                                    </div>
                                    <div class="card-body">
                                        <form method="post" action="${pageContext.request.contextPath}/admin/consultations/updateStatus">
                                            <input type="hidden" name="id" value="${consultation.id}">
                                            <div class="mb-3">
                                                <label class="form-label">Chọn trạng thái:</label>
                                                <select name="status" class="form-select" required>
                                                    <option value="pending" ${consultation.status == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                                    <option value="contacted" ${consultation.status == 'contacted' ? 'selected' : ''}>Đã liên hệ</option>
                                                    <option value="completed" ${consultation.status == 'completed' ? 'selected' : ''}>Hoàn thành</option>
                                                    <option value="cancelled" ${consultation.status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100">
                                                <i class="fas fa-save"></i> Cập nhật
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 bg-danger text-white">
                                        <h6 class="m-0 font-weight-bold">Hành động</h6>
                                    </div>
                                    <div class="card-body">
                                        <a href="mailto:${consultation.email}" class="btn btn-success w-100 mb-2">
                                            <i class="fas fa-envelope"></i> Gửi Email
                                        </a>
                                        <a href="tel:${consultation.phone}" class="btn btn-info w-100 mb-2">
                                            <i class="fas fa-phone"></i> Gọi điện
                                        </a>
                                        <form action="${pageContext.request.contextPath}/DeleteConsultationServlet" method="POST" class="d-inline w-100" 
                                              onsubmit="return confirm('Bạn có chắc chắn muốn xóa đăng ký này?')">
                                            <input type="hidden" name="id" value="${consultation.id}">
                                            <button type="submit" class="btn btn-danger w-100">
                                                <i class="fas fa-trash"></i> Xóa
                                            </button>
                                        </form>
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
        </body>
    </html>
