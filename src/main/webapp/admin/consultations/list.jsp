<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Quản lý Đăng ký Tư vấn</title>
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
                            <h1 class="h3 mb-0 text-gray-800">Quản lý Đăng ký Tư vấn</h1>
                        </div>

                        <!-- Statistics Cards -->
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <div class="card text-white bg-warning mb-3">
                                    <div class="card-body text-center">
                                        <i class="fas fa-clock fa-2x mb-2"></i>
                                        <h5 class="card-title mb-0">Chờ xử lý</h5>
                                        <h2 class="mb-0 mt-2">${pendingCount}</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card text-white bg-info mb-3">
                                    <div class="card-body text-center">
                                        <i class="fas fa-phone fa-2x mb-2"></i>
                                        <h5 class="card-title mb-0">Đã liên hệ</h5>
                                        <h2 class="mb-0 mt-2">${contactedCount}</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card text-white bg-success mb-3">
                                    <div class="card-body text-center">
                                        <i class="fas fa-check-circle fa-2x mb-2"></i>
                                        <h5 class="card-title mb-0">Hoàn thành</h5>
                                        <h2 class="mb-0 mt-2">${completedCount}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Danh sách đăng ký tư vấn</h6>
                                        <form method="get" class="d-flex align-items-center">
                                            <label class="me-2 mb-0 text-muted">Lọc:</label>
                                            <select name="status" class="form-select form-select-sm" style="width: auto;" onchange="this.form.submit()">
                                                <option value="">Tất cả trạng thái</option>
                                                <option value="pending" ${statusFilter == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                                <option value="contacted" ${statusFilter == 'contacted' ? 'selected' : ''}>Đã liên hệ</option>
                                                <option value="completed" ${statusFilter == 'completed' ? 'selected' : ''}>Hoàn thành</option>
                                                <option value="cancelled" ${statusFilter == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                            </select>
                                        </form>
                                    </div>
                                    <div class="card-body">
                                        <c:if test="${param.success == 'updated'}">
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                Cập nhật trạng thái thành công!
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>
                                        <c:if test="${param.success == 'deleted'}">
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                Xóa thành công!
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>

                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover align-middle" id="dataTable">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>Họ tên</th>
                                                                <th>Email</th>
                                                                <th>Điện thoại</th>
                                                                <th>Điểm đến</th>
                                                                <th>Ngày đi</th>
                                                                <th>Số người</th>
                                                                <th>Ngân sách</th>
                                                                <th>Trạng thái</th>
                                                                <th>Ngày đăng ký</th>
                                                                <th>Thao tác</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${consultations}" var="consultation">
                                                                <tr>
                                                                    <td>${consultation.id}</td>
                                                                    <td>
                                                                        <div class="fw-bold">${consultation.fullName}</div>
                                                                    </td>
                                                                    <td>${consultation.email}</td>
                                                                    <td>${consultation.phone}</td>
                                                                    <td>${consultation.destination}</td>
                                                                    <td>${consultation.travelDate}</td>
                                                                    <td>${consultation.numberOfPeople}</td>
                                                                    <td>${consultation.budget}</td>
                                                                    <td>
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
                                                                    </td>
                                                                    <td>
                                                                        <fmt:formatDate value="${consultation.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                                                    </td>
                                                                    <td>
                                                                        <div class="d-flex">
                                                                            <a href="${pageContext.request.contextPath}/admin/consultations/view?id=${consultation.id}" 
                                                                               class="btn btn-sm btn-outline-primary me-2" 
                                                                               data-bs-toggle="tooltip" title="Xem chi tiết">
                                                                                <i class="bi bi-eye"></i>
                                                                            </a>
                                                                            <div class="btn-group me-2">
                                                                                <button type="button" class="btn btn-sm btn-outline-info dropdown-toggle" data-bs-toggle="dropdown" title="Cập nhật trạng thái">
                                                                                    <i class="bi bi-pencil"></i>
                                                                                </button>
                                                                                <ul class="dropdown-menu">
                                                                                    <li>
                                                                                        <form method="post" action="${pageContext.request.contextPath}/admin/consultations/updateStatus" style="display:inline;">
                                                                                            <input type="hidden" name="id" value="${consultation.id}">
                                                                                            <input type="hidden" name="status" value="pending">
                                                                                            <button type="submit" class="dropdown-item">Chờ xử lý</button>
                                                                                        </form>
                                                                                    </li>
                                                                                    <li>
                                                                                        <form method="post" action="${pageContext.request.contextPath}/admin/consultations/updateStatus" style="display:inline;">
                                                                                            <input type="hidden" name="id" value="${consultation.id}">
                                                                                            <input type="hidden" name="status" value="contacted">
                                                                                            <button type="submit" class="dropdown-item">Đã liên hệ</button>
                                                                                        </form>
                                                                                    </li>
                                                                                    <li>
                                                                                        <form method="post" action="${pageContext.request.contextPath}/admin/consultations/updateStatus" style="display:inline;">
                                                                                            <input type="hidden" name="id" value="${consultation.id}">
                                                                                            <input type="hidden" name="status" value="completed">
                                                                                            <button type="submit" class="dropdown-item">Hoàn thành</button>
                                                                                        </form>
                                                                                    </li>
                                                                                    <li>
                                                                                        <form method="post" action="${pageContext.request.contextPath}/admin/consultations/updateStatus" style="display:inline;">
                                                                                            <input type="hidden" name="id" value="${consultation.id}">
                                                                                            <input type="hidden" name="status" value="cancelled">
                                                                                            <button type="submit" class="dropdown-item">Hủy</button>
                                                                                        </form>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                            <form action="DeleteConsultationServlet" method="POST" class="d-inline" 
                                                                                  onsubmit="return confirm('Bạn có chắc chắn muốn xóa đăng ký này?')">
                                                                                <input type="hidden" name="id" value="${consultation.id}">
                                                                                <button type="submit" class="btn btn-sm btn-outline-danger"
                                                                                        data-bs-toggle="tooltip" title="Xóa">
                                                                                    <i class="bi bi-trash"></i>
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                            <c:if test="${empty consultations}">
                                                                <tr>
                                                                    <td colspan="11" class="text-center py-4 text-muted">
                                                                        <i class="bi bi-inbox" style="font-size: 2rem;"></i>
                                                                        <p class="mt-2 mb-0">Chưa có đăng ký tư vấn nào</p>
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
            </script>
        </body>
    </html>
