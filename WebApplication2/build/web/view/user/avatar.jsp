<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Update Profile Image</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        
    </head>
    <style>
        .update{
            margin-left: 687px;
        }
    </style>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if(session.getAttribute("account")==null){
               response.sendRedirect("/SWP391_Group6/login");
            }           
        %>
        <div class="fixed-top d-flex justify-content-end p-3">
            <a href="profile?id=${requestScope.id}" class="btn btn-primary btn-rounded">Trở về trang Profile</a>
        </div>

        <form action="changeavatar" method="post" enctype="multipart/form-data">
            <!--Avatar-->
            <div>
                <div class="d-flex justify-content-center mb-4">
                    <img id="selectedAvatar" src="https://mdbootstrap.com/img/Photos/Others/placeholder-avatar.jpg"
                         class="rounded-circle" style="width: 200px; height: 200px; object-fit: cover;" alt="example placeholder" />
                </div>
                <div class="d-flex justify-content-center">
                    <div data-mdb-ripple-init class="btn btn-primary btn-rounded">
                        <label class="form-label text-white m-1" for="customFile2">Choose file</label>
                        <input type="file" class="form-control d-none" id="customFile2" onchange="displaySelectedImage(event, 'selectedAvatar')" name="profileImage"/>
                    </div>
                </div>
                <br>
            </div>

            <div id="imagePreview"></div>
            <input type="submit" value="Upload Image" class="update">
            <input type="hidden" name="id" value="${sessionScope.uid}"/> 
        </form>
        <div>
            <img src="http://localhost:9999/SWP391_Group6${requestScope.img}" alt="pre"/> 
        </div>
        <script>
            function displaySelectedImage(event, elementId) {
                const selectedImage = document.getElementById(elementId);
                const fileInput = event.target;

                if (fileInput.files && fileInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        selectedImage.src = e.target.result;
                    };

                    reader.readAsDataURL(fileInput.files[0]);
                }
            }

        </script>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
    </body>
</html>