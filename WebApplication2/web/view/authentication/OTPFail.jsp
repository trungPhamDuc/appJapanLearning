<%-- 
    Document   : loginFail
    Created on : May 22, 2024, 4:16:32 PM
    Author     : ngoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Failed</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .error-container {
                background-color: white;
                padding: 30px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            img{
                max-width: 100px; 
            }

            h1 {
                color: #dc3545;
                margin-bottom: 20px;
            }

            a {
                display: inline-block;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="error-container">      
            <h1>OTP Failed</h1>
            <img src="view/image/fail.jpg" alt="Logo">
            <p>Sorry, your login attempt was unsuccessful. Please try again.</p>
            <a href="/SWP391_Group6/view/authentication/OTP.jsp">Try Again</a>
        </div>
    </body>
</html>
