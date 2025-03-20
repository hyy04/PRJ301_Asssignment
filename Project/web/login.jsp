<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }
            body {
                background: linear-gradient(to right, #FF416C, #FF4B2B);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                display: flex;
                width: 750px;
                background: white;
                border-radius: 12px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                overflow: hidden;
            }
            .left {
                width: 40%;
                background: url('https://th.bing.com/th/id/R.145e8621363ba956ec3c3909aa15340d?rik=SBjWJNrdjdICYA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f04%2f10%2fhinh-nen-thung-lung-nui-doi-dep_052339827.jpg&ehk=FT1q8tgpy3AkEhHO4u1S9Iaui7ukPaE%2flbeOn3h%2bPQE%3d&risl=&pid=ImgRaw&r=0') no-repeat center;
                background-size: cover;
            }
            .right {
                width: 60%;
                padding: 40px;
                text-align: center;
            }
            h3 {
                margin-bottom: 20px;
                color: #333;
                font-size: 24px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                outline: none;
                transition: 0.3s;
                font-size: 16px;
            }
            input[type="text"]:focus, input[type="password"]:focus {
                border-color: #FF4B2B;
                box-shadow: 0px 0px 8px rgba(255, 75, 43, 0.5);
            }
            input[type="submit"] {
                background: #FF4B2B;
                color: white;
                border: none;
                padding: 12px;
                width: 100%;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s;
                font-size: 16px;
                font-weight: bold;
            }
            input[type="submit"]:hover {
                background: #E04020;
            }
            .remember {
                display: flex;
                align-items: center;
                justify-content: start;
                margin: 10px 0;
            }
            .remember input {
                margin-right: 5px;
            }
            a {
                display: inline-block;
                margin-top: 15px;
                color: #FF4B2B;
                text-decoration: none;
                font-weight: bold;
                transition: 0.3s;
            }
            a:hover {
                text-decoration: underline;
            }
            .error {
                color: red;
                margin-top: 10px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="left"></div>
            <div class="right">
                <h3>Login Form</h3>
                <c:if test="${not empty ERROR}">
                    <div class="error">${ERROR}</div>
                </c:if>
                    
                <form method="post" action="login">
                    <input type="text" id="username" name="username" value="${cookie.cookieUser.value}" placeholder="Username" required>
                    <input type="password" id="password" name="password" value="${cookie.cookiePass.value}" placeholder="Password" required>

                    <div class="remember">
                        <input type="checkbox" ${cookie.cookieRemember!=null?'checked':''} name="remember" value="ON">
                        <label>Remember me</label>
                    </div>

                    <input type="submit" value="Login">
                    <p>Don't have an account? <a href="register"> Sign up now</a></p>

                </form>

            </div>
        </div>
    </body>
</html>
