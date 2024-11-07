

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access feedback</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #ffffff;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .container h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group textarea {
                width: 100%;
                padding: 2px;
                border: 1px solid #ccc;
                border-radius: 3px;
                resize: vertical;
            }

            .form-group input[type="submit"] {
                background-color: #4caf50;
                color: #ffffff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-group input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Access feedback</h1>
            <form action="/SWP391_Group6/admin/resp" method="POST">
                <div class="form-group">
                    <textarea name="response" id="response" rows="5"></textarea>
                </div>
                <div class="form-group">
                    <input type="hidden" value="${requestScope.email}" name="email">
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>