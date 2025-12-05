<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Đăng ký Tư vấn - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <jsp:include page="/admin/inc/sidebar.jsp" />
            
            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Quản lý Đăng ký Tư vấn</h1>
                </div>

                <!-- Statistics Cards -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card text-white bg-warning">
                            <div class="card-body">
                                <h5 class="card-title">Chờ xử lý</h5>
                                <h2>${pendingCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-info">
                            <div class="card-body">
                                <h5 class="card-title">Đã liên hệ</h5>
                                <h2>${contactedCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <h5 class="card-title">Hoàn thành</h5>
                                <h2>${completedCount}</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Filter -->
                <div class="mb-3">
                    <form method="get" class="row g-3">
                        <div class="col-auto">
                            <select name="status" class="form-select" onchange="this.form.submit()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="pending" ${statusFilter == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                <option value="contacted" ${statusFilter == 'contacted' ? 'selected' : ''}>Đã liên hệ</option>
                                <option value="completed" ${statusFilter == 'completed' ? 'selected' : ''}>Hoàn thành</option>
                                <option value="cancelled" ${statusFilter == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                            </select>
                        </div>
                    </form>
                </div>

                <!-- Success/Error Messages -->
                <c:if test="${param.success == 'updated'}">
                    <div class="alert alert-success alert-dismissible fade show">
                        Cập nhật trạng thái thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == 'deleted'}">
                    <div class="alert alert-success alert-dismissible fade show">
                        Xóa thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ tên</th>
                                <th>Email</th>
                                <th>Điện thoại</th>
                                <th>Điểm đến</th>
                                <th>Ngày đi</th>
                                <th>Số người</th>
                                <th>Ngân sách</th>
                                <th>Trạng thái</th>
                                <th>Ngày đăng ký</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${consultations}" var="consultation">
                                <tr>
                                    <td>${consultation.id}</td>
                                    <td>${consultation.fullName}</td>
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
                                        <a href="${pageContext.request.contextPath}/admin/consultations/view?id=${consultation.id}" 
                                           class="btn btn-sm btn-primary" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-info dropdown-toggle" data-bs-toggle="dropdown" title="Cập nhật trạng thái">
                                                <i class="fas fa-edit"></i>
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
                                        <a href="${pageContext.request.contextPath}/admin/consultations/delete?id=${consultation.id}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa?')"
                                           title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <c:if test="${empty consultations}">
                        <div class="alert alert-info text-center">
                            <i class="fas fa-info-circle"></i> Chưa có đăng ký tư vấn nào
                        </div>
                    </c:if>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
