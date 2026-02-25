<%@page import="model.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hệ thống Quản lý Đại học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            margin: 0;
        }
        .navbar {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .hero-section {
            height: calc(100vh - 70px);
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        .welcome-card {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 600px;
            width: 90%;
            transition: transform 0.3s;
        }
        .welcome-card:hover {
            transform: translateY(-5px);
        }
        .user-icon {
            font-size: 80px;
            color: #007bff;
            margin-bottom: 20px;
        }
        .btn-action {
            border-radius: 50px;
            padding: 12px 30px;
            font-weight: 600;
            margin: 10px;
            transition: 0.3s;
        }
    </style>
</head>
<body>

    <c:choose>
        <c:when test="${not empty user}">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand fw-bold text-primary" href="#">
                        <i class="fas fa-university me-2"></i>UniManager
                    </a>
                    <div class="d-flex align-items-center">
                        <span class="me-3 text-secondary">
                            Xin chào, <strong>${user.fullName}</strong>
                        </span>
                        <a href="MainController?action=logout" class="btn btn-outline-danger btn-sm rounded-pill">
                            <i class="fas fa-sign-out-alt me-1"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            </nav>

            <div class="hero-section">
                <div class="welcome-card">
                    <div class="user-icon">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <h1 class="fw-bold text-dark mb-3">Welcome Back!</h1>
                    <p class="text-muted fs-5 mb-4">
                        Chào mừng <strong>${user.fullName}</strong> đã quay trở lại hệ thống quản lý. 
                        Hôm nay bạn muốn thực hiện công việc gì?
                    </p>
                    
                    <div class="d-grid d-sm-flex justify-content-sm-center">
                        <a href="MainController?action=searchUniversity" class="btn btn-primary btn-action shadow">
                            <i class="fas fa-search me-2"></i> Tìm kiếm & Quản lý
                        </a>
                        <a href="university-form.jsp" class="btn btn-success btn-action shadow">
                            <i class="fas fa-plus-circle me-2"></i> Thêm trường mới
                        </a>
                    </div>
                </div>
            </div>
        </c:when>

        <c:otherwise>
            <c:redirect url="login.jsp"/>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>