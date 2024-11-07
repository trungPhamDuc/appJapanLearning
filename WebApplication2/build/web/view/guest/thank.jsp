

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thank You</title>
        <style>
            body {
                background-color: #f1f1f1;
                font-family: Arial, sans-serif;
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 40px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            .logo {
                margin-bottom: 20px;
                width: 200px
            }

            h1 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            p {
                font-size: 16px;
                margin-bottom: 20px;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                font-size: 16px;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <img class="logo" src="../image/thank.png" alt="Logo">
            <h1>Thank You!</h1>
            <p>We appreciate your feedback.</p>
            <a class="btn" href="/SWP391_Group6/user/home">Back to Home</a>
        </div>
    </body>
</html>