<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Điểm đến - Admin</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <%@include file="../inc/sidebar.jsp" %>
        <div class="content">
            <%@include file="../inc/navbar.jsp" %>
            <div class="container-fluid pt-4 px-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-map-marker-alt"></i> Quản lý Điểm đến</h2>
                    <a href="CreateDestinationsServlet" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm điểm đến mới
                    </a>
                </div>

                <div class="bg-light rounded p-4">
                    <div class="mb-3">
                        <p><strong>Tổng số điểm đến:</strong> ${fn:length(destinationsList)}</p>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th style="width:5%">STT</th>
                                    <th style="width:25%">Tên điểm đến</th>
                                    <th style="width:15%">Danh mục</th>
                                    <th style="width:20%">Vị trí</th>
                                    <th style="width:15%">Ảnh</th>
                                    <th style="width:10%">Thời gian lý tưởng</th>
                                    <th style="width:10%">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="0"/>
                                <c:forEach items="${destinationsList}" var="des">
                                    <c:set var="index" value="${index + 1}"/>
                                    <tr>
                                        <td>${index}</td>
                                        <td>
                                            <div class="fw-bold">${des.name}</div>
                                        </td>
                                        <td>
                                            <c:set var="catName" value=""/>
                                            <c:forEach items="${categoryList}" var="cat">
                                                <c:if test="${cat.id == des.category_id}">
                                                    <c:set var="catName" value="${cat.name}"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${not empty catName}">
                                                    <span class="badge bg-info">${catName}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <i class="fas fa-map-marker-alt text-danger me-1"></i>
                                            ${des.location}
                                        </td>
                                        <td>
                                            <c:if test="${not empty des.image_url}">
                                                <img src="${pageContext.request.contextPath}/img/${des.image_url}"
                                                     width="70" height="50" style="object-fit:cover" alt="img" class="rounded"/>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${not empty des.best_time_to_visit}">
                                                <span class="badge bg-success">${des.best_time_to_visit}</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="EditDestinationsServlet?destination_id=${des.destination_id}" 
                                                   class="btn btn-sm btn-outline-primary" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="DeleteDestinationsServlet?destination_id=${des.destination_id}" 
                                                   class="btn btn-sm btn-outline-danger" title="Xóa"
                                                   onclick="return confirm('Bạn có chắc muốn xóa điểm đến này?');">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty destinationsList}">
                                    <tr>
                                        <td colspan="7" class="text-center text-muted py-4">
                                            <i class="fas fa-inbox fa-2x mb-2"></i>
                                            <br>Chưa có điểm đến nào
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%@include file="../inc/footer.jsp" %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>
