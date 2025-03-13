<%-- 
    Document   : viewCreatedRequests
    Created on : 4 thg 3, 2025, 23:22:51
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem Đơn Đã Tạo</title>
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
            max-width: 900px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th,
        table td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        table th {
            background: #f8f9fa;
            color: #2a82d6;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
        }

        table td {
            color: #444;
            font-size: 14px;
        }

        table tr {
            transition: all 0.3s ease;
        }

        table tr:hover {
            background: #f0f7ff;
            transform: scale(1.005);
        }

        table td a {
            color: #2a82d6;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        table td a:hover {
            color: #4a9ff5;
        }

        .status.inprogress {
            color: #ffc107;
            font-weight: 500;
            background: #fff3cd;
            padding: 5px 10px;
            border-radius: 12px;
        }

        .status.rejected {
            color: #dc3545;
            font-weight: 500;
            background: #f8d7da;
            padding: 5px 10px;
            border-radius: 12px;
        }

        .back-btn {
            display: inline-block;
            width: 100%;
            padding: 15px;
            font-size: 16px;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(90deg, #6c757d 0%, #adb5bd 100%);
            border: none;
            border-radius: 30px;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(108, 117, 125, 0.3);
        }

        .back-btn:hover {
            background: linear-gradient(90deg, #adb5bd 0%, #6c757d 100%);
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(108, 117, 125, 0.4);
        }

        .back-btn i {
            margin-right: 8px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
                max-width: 90%;
            }

            table th,
            table td {
                font-size: 12px;
                padding: 10px;
            }

            .container h1 {
                font-size: 24px;
            }

            .back-btn {
                padding: 12px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-eye"></i> Tất Cả Đơn Đã Tạo</h1>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Created By</th>
                    <th>Status</th>
                    <th>Processed By</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="ApproveLeaveRequest.jsp?requestId=1">Xin nghỉ</a></td>
                    <td>1/1/2025</td>
                    <td>3/1/2025</td>
                    <td>Mr F</td>
                    <td class="status inprogress">Inprogress</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td><a href="ApproveLeaveRequest.jsp?requestId=2">Xin nghỉ đi chơi</a></td>
                    <td>1/1/2025</td>
                    <td>5/1/2025</td>
                    <td>Mr E</td>
                    <td class="status rejected">Rejected</td>
                    <td>Mr B</td>
                </tr>
                <!-- Thêm các hàng khác nếu cần -->
            </tbody>
        </table>
        <a href="manage.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Quay Lại</a>
    </div>
</body>
</html>
