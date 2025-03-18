<%-- 
    Document   : manage
    Created on : 4 thg 3, 2025, 22:54:05
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - Office</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- CSS nhúng trực tiếp -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            overflow: hidden;
        }

        .container {
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 450px;
            width: 100%;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .container h1 {
            font-size: 28px;
            color: #2a82d6;
            margin-bottom: 30px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .container h1 i {
            font-size: 32px;
            color: #2a82d6;
        }

        .button {
            display: block;
            width: 100%;
            padding: 15px;
            margin: 15px 0;
            font-size: 16px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(90deg, #2a82d6 0%, #4a9ff5 100%);
            border: none;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(42, 130, 214, 0.3);
        }

        .button:hover {
            background: linear-gradient(90deg, #4a9ff5 0%, #2a82d6 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(42, 130, 214, 0.4);
        }

        .button i {
            margin-right: 8px;
        }

        .logout-btn {
            display: inline-block;
            padding: 15px 30px;
            font-size: 16px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(90deg, #dc3545 0%, #f15a67 100%);
            border: none;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        .logout-btn:hover {
            background: linear-gradient(90deg, #f15a67 0%, #dc3545 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4);
        }

        .logout-btn i {
            margin-right: 8px;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .container {
                padding: 30px;
                max-width: 90%;
            }

            .container h1 {
                font-size: 28px;
            }

            .menu-btn,
            .logout-btn {
                padding: 12px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-home"></i> Trang Chủ</h1>

        <!-- Nhân viên: Hiển thị 2 tùy chọn -->
        <c:if test="${sessionScope.acc.staff == 1}">
            <a href="createLeaveRequest.jsp" class="button"><i class="fas fa-file-alt"></i> Tạo đơn xin nghỉ phép</a>
            <a href="viewCreatedRequests.jsp" class="button"><i class="fas fa-eye"></i> Xem tất cả đơn đã tạo</a>
        </c:if>

        <!-- Quản lý: Hiển thị 3 tùy chọn -->
        <c:if test="${sessionScope.acc.manage == 1}">
            <a href="createLeaveRequest.jsp" class="button"><i class="fas fa-file-alt"></i> Tạo đơn xin nghỉ phép</a>
            <a href="viewAllRequests.jsp" class="button"><i class="fas fa-eye"></i> Xem tất cả đơn đã tạo</a>
            <a href="employeeStatus.jsp" class="button"><i class="fas fa-users"></i> Tình trạng lao động của nhân viên</a>
        </c:if>

        <!-- Giám đốc: Hiển thị 2 tùy chọn -->
        <c:if test="${sessionScope.acc.director == 1}">
            <a href="viewAllRequests.jsp" class="button"><i class="fas fa-eye"></i> Xem tất cả đơn đã tạo</a>
            <a href="employeeStatus.jsp" class="button"><i class="fas fa-users"></i> Tình trạng lao động của nhân viên</a>
        </c:if>

        <!-- Nút đăng xuất -->
        <a href="login.jsp" class="logout-btn" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?')"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
    </div>
</body>
</html>
