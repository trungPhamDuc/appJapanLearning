<%-- 
    Document   : uploadfile
    Created on : Jul 20, 2024, 6:23:49 AM
    Author     : lmtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpoadSound" method="post" enctype="multipart/form-data">
            <!-- Các trường khác của form -->

            <!-- Sử dụng attribute 'multiple' để cho phép người dùng chọn nhiều file -->
            <input type="file" class="form-control" id="customFile2" multiple name="profileImage"/>

            <input type="submit" value="Upload Image">
        </form>
    </body>
</html>

