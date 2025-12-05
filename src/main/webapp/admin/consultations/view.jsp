<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Chi tiết Đăng ký Tư vấn - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/inc/sidebar.jsp" />
            
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Chi tiết Đăng ký Tư vấn</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <a href="${pageContext.request.contextPath}/admin/consultations" class="btn btn-sm btn-secondary">
                            <i class="fas fa-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">Thông tin khách hàng</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="fw-bold">Họ và tên:</label>
                                        <p>${consultation.fullName}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="fw-bold">Email:</label>
                                        <p><a href="mailto:${consultation.email}">${consultation.email}</a></p>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="fw-bold">Số điện thoại:</label>
                                        <p><a href="tel:${consultation.phone}">${consultation.phone}</a></p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="fw-bold">Trạng thái:</label>
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
                                        <label class="fw-bold">Điểm đến mong muốn:</label>
                                        <p>${consultation.destination}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="fw-bold">Ngày dự kiến đi:</label>
                                        <p>${consultation.travelDate}</p>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="fw-bold">Số người:</label>
                                        <p>${consultation.numberOfPeople} người</p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="fw-bold">Ngân sách dự kiến:</label>
                                        <p>
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
                                    <label class="fw-bold">Ghi chú:</label>
                                    <p class="text-muted">${consultation.message}</p>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="fw-bold">Ngày đăng ký:</label>
                                        <p><fmt:formatDate value="${consultation.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="fw-bold">Cập nhật lần cuối:</label>
                                        <p>
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
                        <div class="card mb-3">
                            <div class="card-header bg-info text-white">
                                <h5 class="mb-0">Cập nhật trạng thái</h5>
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

                        <div class="card">
                            <div class="card-header bg-danger text-white">
                                <h5 class="mb-0">Hành động</h5>
                            </div>
                            <div class="card-body">
                                <a href="mailto:${consultation.email}" class="btn btn-success w-100 mb-2">
                                    <i class="fas fa-envelope"></i> Gửi Email
                                </a>
                                <a href="tel:${consultation.phone}" class="btn btn-info w-100 mb-2">
                                    <i class="fas fa-phone"></i> Gọi điện
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/consultations/delete?id=${consultation.id}" 
                                   class="btn btn-danger w-100"
                                   onclick="return confirm('Bạn có chắc muốn xóa đăng ký này?')">
                                    <i class="fas fa-trash"></i> Xóa
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
