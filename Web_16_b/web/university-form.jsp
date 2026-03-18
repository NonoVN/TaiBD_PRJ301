<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${mode == 'update' ? 'Cập nhật' : 'Thêm mới'} Trường Đại Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f7f6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .form-card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .form-header { 
            background: ${mode == 'update' ? 'linear-gradient(45deg, #0dcaf0, #007bff)' : 'linear-gradient(45deg, #198754, #20c997)'};
            color: white; border-radius: 15px 15px 0 0; padding: 20px;
        }
        .btn-submit { border-radius: 30px; padding: 10px 40px; font-weight: bold; transition: 0.3s; }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.2); }
        label { font-weight: 600; color: #495057; margin-bottom: 5px; }
    </style>
</head>
<body>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                
                <div class="mb-3">
                    <a href="MainController?action=searchUniversity&keywords=${keywords}" class="text-decoration-none text-secondary">
                        ← Quay lại danh sách
                    </a>
                </div>

                <div class="card form-card">
                    <div class="form-header text-center">
                        <h3 class="mb-0">
                            ${mode == 'update' ? '📝 CẬP NHẬT THÔNG TIN' : '🏫 THÊM TRƯỜNG ĐẠI HỌC'}
                        </h3>
                    </div>
                    
                    <div class="card-body p-4">
                        <%-- Thông báo phản hồi --%>
                        <c:if test="${not empty msg}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                ✨ ${msg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ⚠️ ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <form action="MainController" method="POST">
                            <input type="hidden" name="action" value="${mode=='update'?'saveUpdateUniversity':'addUniversity'}"/>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Mã Trường (ID)</label>
                                    <input type="text" name="id" class="form-control" value="${u.id}" ${mode == 'update' ? 'readonly' : ''} placeholder="Ví dụ: UNI001" required />
                                </div>
                                <div class="col-md-8 mb-3">
                                    <label class="form-label">Tên Trường</label>
                                    <input type="text" name="name" class="form-control" value="${u.name}" required />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tên viết tắt</label>
                                    <input type="text" name="shortName" class="form-control" value="${u.shortName}" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Năm thành lập</label>
                                    <input type="number" name="foundedYear" class="form-control" value="${u.foundedYear}" min="1000" />
                                </div>

                                <div class="col-12 mb-3">
                                    <label class="form-label">Mô tả</label>
                                    <textarea name="description" class="form-control" rows="2">${u.description}</textarea>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Địa chỉ</label>
                                    <input type="text" name="address" class="form-control" value="${u.address}" />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Thành phố</label>
                                    <input type="text" name="city" class="form-control" value="${u.city}" />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Khu vực</label>
                                    <input type="text" name="region" class="form-control" value="${u.region}" />
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Loại hình</label>
                                    <input type="text" name="type" class="form-control" value="${u.type}" />
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tổng số sinh viên</label>
                                    <input type="number" name="totalStudents" class="form-control" value="${u.totalStudents}" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tổng số giảng viên</label>
                                    <input type="number" name="totalFaculties" class="form-control" value="${u.totalFaculties}" />
                                </div>

                                <div class="col-12 mb-4">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="isDraft" name="isDraft" ${u.isDraft ? 'checked' : ''}>
                                        <label class="form-check-label" for="isDraft">Lưu dưới dạng bản nháp (Draft)</label>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center">
                                <c:choose>
                                    <c:when test="${mode == 'update'}">
                                        <button type="submit" class="btn btn-info btn-submit text-white">CẬP NHẬT DỮ LIỆU</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-success btn-submit">THÊM MỚI TRƯỜNG</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>