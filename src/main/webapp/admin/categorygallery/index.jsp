<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Quản lý Category Gallery - Admin</title>
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
                    <h2><i class="fas fa-images"></i> Quản lý Category Gallery</h2>
                    <a href="CreateCategoryGalleryServlet" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Thêm ảnh mới
                    </a>
                </div>

                <div class="bg-light rounded p-4">
                    <div class="mb-3">
                        <p><strong>Tổng số ảnh:</strong> <c:out value="${fn:length(categoryGalleryList)}"/></p>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th style="width:5%">STT</th>
                                    <th style="width:25%">Danh mục</th>
                                    <th style="width:30%">Ảnh</th>
                                    <th style="width:20%">Ngày tạo</th>
                                    <th style="width:20%">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="0"/>
                                <c:forEach items="${categoryGalleryList}" var="item">
                                    <c:set var="index" value="${index + 1}"/>
                                    <tr>
                                        <td>${index}</td>
                                        <td>
                                            <c:set var="catName" value=""/>
                                            <c:forEach items="${categoryList}" var="cat">
                                                <c:if test="${cat.id == item.category_id}">
                                                    <c:set var="catName" value="${cat.name}"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${not empty catName}">
                                                    <span class="badge bg-info fs-6">${catName}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">ID: ${item.category_id}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${not empty item.image_url}">
                                                <div class="position-relative d-inline-block">
                                                    <img src="${pageContext.request.contextPath}/img/${item.image_url}"
                                                         width="100" height="75" class="img-fluid rounded shadow-sm" 
                                                         alt="Gallery Image" style="object-fit: cover; cursor: pointer;"
                                                         onclick="showImageModal('${pageContext.request.contextPath}/img/${item.image_url}', '${catName}')"/>
                                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
                                                        <i class="fas fa-search-plus"></i>
                                                    </span>
                                                </div>
                                            </c:if>
                                        </td>
                                        <td>
                                            <small class="text-muted">
                                                <i class="fas fa-calendar-alt me-1"></i>
                                                <fmt:formatDate value="${item.created_at}" pattern="dd/MM/yyyy"/>
                                                <br>
                                                <i class="fas fa-clock me-1"></i>
                                                <fmt:formatDate value="${item.created_at}" pattern="HH:mm"/>
                                            </small>
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="EditCategoryGalleryServlet?categoryId=${item.id}" 
                                                   class="btn btn-sm btn-outline-primary" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="DeleteCategoryGalleryServlet?categoryId=${item.id}" 
                                                   class="btn btn-sm btn-outline-danger" title="Xóa"
                                                   onclick="return confirm('Bạn có chắc muốn xóa ảnh này?');">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty categoryGalleryList}">
                                    <tr>
                                        <td colspan="5" class="text-center text-muted py-4">
                                            <i class="fas fa-images fa-3x mb-3 opacity-50"></i>
                                            <br>
                                            <h5>Chưa có ảnh nào</h5>
                                            <p>Hãy thêm ảnh đầu tiên cho gallery của bạn</p>
                                            <a href="CreateCategoryGalleryServlet" class="btn btn-primary">
                                                <i class="fas fa-plus"></i> Thêm ảnh ngay
                                            </a>
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

    <!-- Image Modal -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">
                        <i class="fas fa-image me-2"></i>Xem ảnh
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" class="img-fluid rounded" alt="Gallery Image" style="max-height: 500px;">
                    <p id="modalImageCategory" class="mt-3 text-muted"></p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
    
    <script>
        function showImageModal(imageSrc, categoryName) {
            document.getElementById('modalImage').src = imageSrc;
            document.getElementById('modalImageCategory').textContent = 'Danh mục: ' + categoryName;
            var imageModal = new bootstrap.Modal(document.getElementById('imageModal'));
            imageModal.show();
        }
    </script>
</body>
</html>
