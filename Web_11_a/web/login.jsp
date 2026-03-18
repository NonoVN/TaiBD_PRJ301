<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập | UniManager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header i {
            font-size: 50px;
            color: #764ba2;
            margin-bottom: 10px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(118, 75, 162, 0.25);
            border-color: #764ba2;
        }
        .btn-login {
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
        }
        .btn-login:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
        .error-msg {
            font-size: 0.9rem;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="login-card animate__animated animate__fadeIn">
        <div class="login-header">
            <i class="fas fa-university"></i>
            <h2 class="fw-bold text-dark">UniManager</h2>
            <p class="text-muted">Vui lòng đăng nhập để tiếp tục</p>
        </div>

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            
            <div class="mb-3">
                <label class="form-label fw-semibold">Tên đăng nhập</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="fas fa-user text-secondary"></i></span>
                    <input type="text" name="txtUsername" class="form-control" placeholder="Nhập username" required />
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold">Mật khẩu</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="fas fa-lock text-secondary"></i></span>
                    <input type="password" name="txtPassword" class="form-control" placeholder="Nhập mật khẩu" required />
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-login w-100">
                Đăng nhập <i class="fas fa-arrow-right ms-2"></i>
            </button>
        </form>

        <%-- Hiển thị thông báo lỗi --%>
        <c:if test="${not empty message}">
            <div class="alert alert-danger error-msg d-flex align-items-center mb-0 mt-3" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>${message}</div>
            </div>
        </c:if>

        <div class="text-center mt-4">
            <small class="text-muted">Quên mật khẩu? Liên hệ Admin</small>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>