<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý Trường Đại Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background-color: #f8f9fa; }
        .main-container { margin-top: 30px; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }
        .table thead { background-color: #007bff; color: white; }
        .btn-add { margin-bottom: 20px; border-radius: 30px; padding: 10px 25px; font-weight: bold; }
        .search-box { background: #e9ecef; padding: 20px; border-radius: 10px; margin-bottom: 30px; }
        .badge-draft { background-color: #ffc107; color: #000; }
    </style>
</head>
<body>

    <jsp:include page="welcome.jsp" />

    <%-- Kiểm tra đăng nhập --%>
    <c:if test="${empty user}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <div class="container main-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary fw-bold">🎓 Danh Sách Trường Đại Học</h2>
            <a href="university-form.jsp" class="btn btn-success btn-add">+ Thêm Trường Mới</a>
        </div>

        <div class="search-box">
            <form action="MainController" method="post" class="row g-3">
                <input type="hidden" name="action" value="searchUniversity"/>
                <div class="col-md-9">
                    <input type="text" name="keywords" class="form-control form-control-lg" 
                           placeholder="Nhập tên trường hoặc từ khóa cần tìm..." value="${keywords}" />
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary btn-lg w-100">🔍 Tìm Kiếm</button>
                </div>
            </form>
        </div>

        <hr/>

        <%-- Hiển thị kết quả --%>
        <c:choose>
            <c:when test="${empty list}">
                <div class="alert alert-warning text-center" role="alert">
                    🚩 Không tìm thấy dữ liệu phù hợp với tiêu chí tìm kiếm!
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-hover table-striped align-middle border">
                        <thead>
                            <tr class="text-center">
                                <th>Mã</th>
                                <th>Tên Trường</th>
                                <th>Viết tắt</th>
                                <th>Thành Phố</th>
                                <th>Khu vực</th>
                                <th>Loại hình</th>
                                <th>Năm thành lập</th>
                                <th>Sinh viên</th>
                                <th>Giảng viên</th>
                                <th colspan="2">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="u">
                                <tr>
                                    <td class="fw-bold text-secondary">${u.id}</td>
                                    <td class="fw-bold">${u.name}</td>
                                    <td><span class="badge bg-info text-dark">${u.shortName}</span></td>
                                    <td>${u.city}</td>
                                    <td>${u.region}</td>
                                    <td>${u.type}</td>
                                    <td class="text-center">${u.foundedYear}</td>
                                    <td class="text-center text-primary fw-bold">${u.totalStudents}</td>
                                    <td class="text-center">${u.totalFaculties}</td>
                                    <td class="text-center">
                                        <c:if test="${u.isDraft}">
                                            <a href="MainController?action=updateUniversity&id=${u.id}" 
                                               class="btn btn-outline-warning btn-sm">Sửa</a>
                                        </c:if>
                                    </td>
                                    <td class="text-center">
                                        <form action="MainController" method="POST"
                                              onsubmit="return confirm('Bạn có chắc chắn muốn xóa trường [${u.name}] không?');">
                                            <input type="hidden" name="action" value="deleteUniversity"/>
                                            <input type="hidden" name="id" value="${u.id}"/>
                                            <input type="hidden" name="keywords" value="${keywords}"/>
                                            <button type="submit" class="btn btn-outline-danger btn-sm">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>