<%-- 
    Document   : ApproveLeaveRequest
    Created on : 4 thg 3, 2025, 23:50:33
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyệt Đơn Xin Nghỉ Phép</title>
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
            background: #f8f9fa;
            color: #555;
        }

        .form-group textarea {
            height: 100px;
            resize: none;
        }

        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .approve-btn,
        .reject-btn {
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

        .approve-btn {
            background: linear-gradient(90deg, #28a745 0%, #34c759 100%);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .approve-btn:hover {
            background: linear-gradient(90deg, #34c759 0%, #28a745 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.4);
        }

        .reject-btn {
            background: linear-gradient(90deg, #dc3545 0%, #f15a67 100%);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        .reject-btn:hover {
            background: linear-gradient(90deg, #f15a67 0%, #dc3545 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4);
        }

        .approve-btn i,
        .reject-btn i {
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

            .approve-btn,
            .reject-btn {
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
        <h1><i class="fas fa-file-alt"></i> Duyệt Đơn Xin Nghỉ Phép</h1>
        <form action="processLeaveRequest" method="post">
            <div class="form-group">
                <label for="fullName">Họ & Tên</label>
                <input type="text" id="fullName" name="fullName" value="Mr F" readonly>
            </div>
            <div class="form-group">
                <label for="position">Chức Vụ</label>
                <input type="text" id="position" name="position" value="Nhân viên" readonly>
            </div>
            <div class="form-group">
                <label for="department">Phòng Ban</label>
                ` <input type="text" id="department" name="department" value="Phòng IT" readonly>
            </div>
            <div class="form-group">
                <label for="startDate">Từ Ngày</label>
                <input type="text" id="startDate" name="startDate" value="1/1/2025" readonly>
            </div>
            <div class="form-group">
                <label for="endDate">Đến Ngày</label>
                <input type="text" id="endDate" name="endDate" value="3/1/2025" readonly>
            </div>
            <div class="form-group">
                <label for="reason">Lý Do</label>
                <textarea id="reason" name="reason" readonly>Xin nghỉ để đi du lịch</textarea>
            </div>
            <div class="buttons">
                <button type="submit" name="action" value="reject" class="reject-btn"><i class="fas fa-times"></i> Reject</button>
                <button type="submit" name="action" value="approve" class="approve-btn"><i class="fas fa-check"></i> Approve</button>
            </div>
        </form>
    </div>
</body>
</html>
