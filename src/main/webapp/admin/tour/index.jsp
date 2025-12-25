<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Tours - Admin</title>
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
                    <h2><i class="fas fa-map-marked-alt"></i> Quản lý Tours</h2>
                    <a href="CreateTourServlet" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm tour mới
                    </a>
                </div>

                <div class="bg-light rounded p-4">
                    <div class="mb-3">
                        <p><strong>Tổng số tours:</strong> ${fn:length(toursList)}</p>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th style="width:5%">STT</th>
                                    <th style="width:10%">Hình ảnh</th>
                                    <th style="width:25%">Tiêu đề</th>
                                    <th style="width:10%">Giá</th>
                                    <th style="width:10%">Giá cũ</th>
                                    <th style="width:8%">Số ngày</th>
                                    <th style="width:12%">Ngày bắt đầu</th>
                                    <th style="width:12%">Ngày kết thúc</th>
                                    <th style="width:8%">Số chỗ</th>
                                    <th style="width:10%">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="0"/>
                                <c:forEach items="${toursList}" var="tour">
                                    <c:set var="index" value="${index + 1}"/>
                                    <tr>
                                        <td>${index}</td>
                                        <td>
                                            <c:if test="${not empty tour.main_image}">
                                                <img src="${pageContext.request.contextPath}/img/${tour.main_image}"
                                                     width="50" height="50" alt="img" class="img-fluid rounded"/>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="fw-bold">${tour.title}</div>
                                        </td>
                                        <td>
                                            <span class="text-success fw-bold">
                                                <fmt:formatNumber value="${tour.price * 1000}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                            </span>
                                        </td>
                                        <td>
                                            <c:if test="${tour.price_old > 0}">
                                                <del class="text-muted">
                                                    <fmt:formatNumber value="${tour.price_old * 1000}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                                </del>
                                            </c:if>
                                        </td>
                                        <td>
                                            <span class="badge bg-info">${tour.duration_days} ngày</span>
                                        </td>
                                        <td>
                                            <small><fmt:formatDate value="${tour.start_date}" pattern="dd/MM/yyyy"/></small>
                                        </td>
                                        <td>
                                            <small><fmt:formatDate value="${tour.end_date}" pattern="dd/MM/yyyy"/></small>
                                        </td>
                                        <td>
                                            <span class="badge bg-secondary">${tour.available_slots}</span>
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="EditTourServlet?tourId=${tour.tour_id}" 
                                                   class="btn btn-sm btn-outline-primary" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="DeleteTourServlet?tourId=${tour.tour_id}" 
                                                   class="btn btn-sm btn-outline-danger" title="Xóa"
                                                   onclick="return confirm('Bạn có chắc muốn xóa tour này?');">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty toursList}">
                                    <tr>
                                        <td colspan="10" class="text-center text-muted py-4">
                                            <i class="fas fa-inbox fa-2x mb-2"></i>
                                            <br>Chưa có tour nào
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

