<%-- 
    Document   : createLeaveRequest
    Created on : 4 thg 3, 2025, 22:55:46
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo Đơn Xin Nghỉ Phép</title>
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
            max-width: 600px;
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
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .container h1 i {
            font-size: 32px;
            color: #2a82d6;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #2a82d6;
            box-shadow: 0 0 8px rgba(42, 130, 214, 0.2);
        }

        .form-group textarea {
            height: 100px;
            resize: none;
        }

        .form-group input[type="date"] {
            color: #555;
        }

        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .submit-btn,
        .back-btn {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            font-weight: 500;
            color: #fff;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn {
            background: linear-gradient(90deg, #2a82d6 0%, #4a9ff5 100%);
            box-shadow: 0 5px 15px rgba(42, 130, 214, 0.3);
        }

        .submit-btn:hover {
            background: linear-gradient(90deg, #4a9ff5 0%, #2a82d6 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(42, 130, 214, 0.4);
        }

        .back-btn {
            background: linear-gradient(90deg, #6c757d 0%, #adb5bd 100%);
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.3);
        }

        .back-btn:hover {
            background: linear-gradient(90deg, #adb5bd 0%, #6c757d 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(108, 117, 125, 0.4);
        }

        .submit-btn i,
        .back-btn i {
            margin-right: 8px;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .container {
                padding: 30px;
                max-width: 90%;
            }

            .container h1 {
                font-size: 24px;
            }

            .submit-btn,
            .back-btn {
                padding: 12px;
                font-size: 14px;
            }

            .buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-file-alt"></i> Đơn Xin Nghỉ Phép</h1>
        <form action="SubmitLeave" method="post">
            <div class="form-group">
                <label for="fullName">Họ & Tên</label>
                <input type="text" id="fullName" name="fullName" placeholder="Nhập họ và tên" required>
            </div>
<!--            <div class="form-group">
                <label for="position">Chức Vụ</label>
                <input type="text" id="position" name="position" placeholder="Nhập chức vụ" required>
            </div>
            <div class="form-group">
                <label for="department">Phòng Ban</label>
                <input type="text" id="department" name="department" placeholder="Nhập phòng ban" required>
            </div>-->
            <div class="form-group">
                <label for="startDate">Từ Ngày</label>
                <input type="date" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">Đến Ngày</label>
                <input type="date" id="endDate" name="endDate" required>
            </div>
            <div class="form-group">
                <label for="reason">Lý Do</label>
                <textarea id="reason" name="reason" placeholder="Nhập lý do xin nghỉ phép" required></textarea>
            </div>
            <div class="buttons">
                <button type="submit" class="submit-btn"><i class="fas fa-paper-plane"></i> Gửi</button>
                <a href="staff.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Quay Lại</a>
            </div>
        </form>
    </div>
</body>
</html>