<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ</title>
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
            min-height: 100vh;
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            padding: 20px;
        }

        .container {
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .container h1 {
            font-size: 36px;
            color: #2a82d6;
            margin-bottom: 40px;
            font-weight: 600;
        }

        .menu-btn {
            display: block;
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            font-size: 16px;
            font-weight: 500;
            color: #333;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .menu-btn:hover {
            background: #f0f7ff;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            color: #2a82d6;
        }

        .menu-btn i {
            margin-right: 10px;
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
        <h1>Home</h1>
        <a href="createLeaveRequest.jsp" class="menu-btn"><i class="fas fa-plus"></i> tạo đơn xin nghỉ phép</a>
        <a href="viewCreatedRequests.jsp" class="menu-btn"><i class="fas fa-eye"></i> xem đơn đã tạo</a>
        <a href="employeeCreatedRequests.jsp" class="menu-btn"><i class="fas fa-users"></i> tình trạng lao động của nhân viên</a>
        <a href="login.jsp" class="logout-btn" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?')"><i class="fas fa-sign-out-alt"></i> đăng xuất</a>
    </div>
</body>
</html>