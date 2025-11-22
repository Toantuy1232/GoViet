<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm</title>
    <!-- Add your CSS links here -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .search-results {
            padding: 40px 0;
        }
        .tour-card {
            margin-bottom: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .tour-card:hover {
            transform: translateY(-5px);
        }
        .tour-image {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        .no-results {
            text-align: center;
            padding: 50px 0;
        }
        .search-info {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <jsp:include page="inc/header.jsp" />

    <div class="container search-results">
        <div class="search-info">
            <h2>Kết quả tìm kiếm</h2>
            <c:if test="${not empty param.searchTerm}">
                <p>Từ khóa: <strong>${param.searchTerm}</strong></p>
            </c:if>
            <c:if test="${not empty param.categoryId && param.categoryId != '0'}">
                <p>Danh mục: <strong>${param.categoryId}</strong></p>
            </c:if>
            <p>Tìm thấy <strong>${empty toursList ? 0 : toursList.size()}</strong> kết quả</p>
        </div>

        <c:choose>
            <c:when test="${not empty toursList}">
                <div class="row">
                    <c:forEach items="${toursList}" var="tour">
                        <div class="col-md-4">
                            <div class="card tour-card">
                                <img src="${pageContext.request.contextPath}/img/${tour.thumbnail}"
                                     class="card-img-top tour-image"
                                     alt="${tour.title}">
                                <div class="card-body">
                                    <h5 class="card-title">${tour.title}</h5>
                                    <p class="card-text">${tour.description.length() > 100 ? tour.description.substring(0, 100) + '...' : tour.description}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-primary fw-bold">${tour.price} VNĐ</span>
                                        <a href="TourDetailServlet?tourId=${tour.id}" class="btn btn-primary">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <h3>Không tìm thấy tour nào phù hợp</h3>
                    <p>Xin vui lòng thử lại với từ khóa hoặc danh mục khác.</p>
                    <a href="${pageContext.request.contextPath}/HomeServlet" class="btn btn-primary">Quay về trang chủ</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="inc/footer.jsp" />

    <!-- Add your JS scripts here -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>