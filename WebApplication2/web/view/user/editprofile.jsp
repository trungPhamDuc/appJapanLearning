<%-- 
    Document   : editinformation
    Created on : Jul 17, 2024, 3:55:26 PM
    Author     : lmtha
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #33ccff;
                margin: 0;
                padding: 0;
            }
            .container {
                display: flex;
                margin: 20px;
                margin-top: 70px;
            }
            .profile, .report {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 10px;
            }
            .profile {
                flex: 0 0 410px;
                text-align: center;
                border: 3px solid black;
                max-width: 100%;
                margin: auto;

            }
            .profile img {
                border-radius: 50%;
                width: 100px;
                height: 100px;
            }
            .profile h2 {
                margin: 10px 0 5px;
            }
            .profile p {
                margin: 5px 0;
                color: #888;
            }
            .stats {
                display: flex;
                justify-content: space-around;
                margin: 20px 0;
            }
            .stats div {
                text-align: center;
            }
            .stats div span {
                display: block;
                font-size: 1.5em;
                margin-bottom: 5px;
            }
            .details {
                text-align: left;
            }
            .details p {
                margin: 5px 0;
            }
            .report {
                flex: 2;
                border: 3px solid black;
            }
            .report h2 {
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            .progress-bar {
                height: 10px;
                border-radius: 5px;
                margin-top: 5px;
            }
            .progress-bar-green {
                background-color: #28a745;
            }
            .progress-bar-yellow {
                background-color: #ffc107;
            }
            .progress-bar-orange {
                background-color: #fd7e14;
            }
            .progress-bar-blue {
                background-color: #007bff;
            }
            .grade {
                font-weight: bold;
            }
            .grade-A {
                color: #28a745;
            }
            .grade-B {
                color: #ffc107;
            }
            .grade-C {
                color: #fd7e14;
            }
            .grade-E {
                color: #dc3545;
            }
            .buttons {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                font-size: 20px;
            }
            .edit-button, .delete-button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                color: #fff;
                cursor: pointer;
                margin: 0 10px;
                font-size: 1em;
            }
            .edit-button {
                background-color: #007bff;
            }
            .delete-button {
                background-color: #fd7e14;
            }
            .edit-button:hover {
                background-color: #0056b3;
            }
            .delete-button:hover {
                background-color: #e55300;
            }
            .material-symbols-outlined2 {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }
            /*avatar*/
            .object-center {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .profile-pic {
                color: transparent;
                transition: all .3s ease;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
                transition: all .3s ease;

                input {
                    display: none;
                }

                img {
                    position: absolute;
                    object-fit: cover;
                    width: 165px;
                    height: 165px;
                    box-shadow: 0 0 10px 0 rgba(255,255,255,.35);
                    border-radius: 100px;
                    z-index: 0;
                }

                .-label {
                    cursor: pointer;
                    height: 165px;
                    width: 165px;
                }

                &:hover {
                    .-label {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        background-color: rgba(0,0,0,.8);
                        z-index: 10000;
                        color: rgb(250,250,250);
                        transition: background-color .2s ease-in-out;
                        border-radius: 100px;
                        margin-bottom: 0;
                    }
                }

                span {
                    display: inline-flex;
                    padding: .2em;
                    height: 2em;
                }
            }



            a:hover {
                text-decoration: none;
            }

            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
            }


            /* Thêm CSS cho form */
            .details {
                text-align: left; /* Để văn bản căn lề trái */
                margin-bottom: 20px; /* Thêm độ lệch dưới cho phần chi tiết */
            }

            .details label {
                display: inline-block; /* Để label hiển thị như block-level element */
                width: 100px; /* Thiết lập độ rộng cho label */
                margin-bottom: 5px; /* Thêm độ lệch dưới cho label */
            }

            .details input[type="text"],
            .details input[type="tel"] {
                width: 100%; /* Để input chiếm toàn bộ độ rộng của cha */
                padding: 10px; /* Thêm padding cho input */
                border: 1px solid #ddd; /* Thiết lập kiểu border */
                border-radius: 4px; /* Thiết lập border radius */
            }

            .details button {
                background-color: #007bff; /* Màu nền cho button */
                color: white; /* Màu chữ cho button */
                padding: 10px 20px; /* Thêm padding cho button */
                border: none; /* Không hiển thị border */
                border-radius: 5px; /* Thiết lập border radius */
                cursor: pointer; /* Đổi con trỏ thành kiểu con trỏ click khi hover */
            }

            .details button:hover {
                background-color: #0056b3; /* Thay đổi màu nền khi hover */
            }



        </style>
    </head>
    <body>
        <div class="container">
            <div class="profile">
                <form action="editprofile" method="post" id="editProfileForm" enctype="multipart/form-data">
                    <div class="profile-pic">
                        <label class="-label" for="file">
                            <span>Change Image</span>
                        </label>
                        <input id="file" type="file" name="profileImage" onchange="loadFile(event)"/>
                        <img src="http://localhost:9999/SWP391_Group6/${requestScope.avatar}" alt="Student Avatar" id="output" width="200">
                    </div>

                    <div class="details">


                        <div>
                            <label for="userId">User ID:</label>
                            <input type="text" id="userId" name="userId" value="${requestScope.id}" disabled>
                            <input type="hidden" id="id" name="usersID" value="${requestScope.id}"/>
                        </div>
                        <div>
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" value="${requestScope.name}" required>
                        </div>             

                        <div>
                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" value="${requestScope.phone}" required>
                        </div>
                        <div class="gender">
                            <label for="gender">Gender:</label>
                            <input type="radio" id="male" name="gender" value="true" <%= ( (boolean) request.getAttribute("gender")) ? "checked" : "" %>> Male
                            <input type="radio" id="female" name="gender" value="false" <%= ( !(boolean) request.getAttribute("gender")) ? "checked" : "" %>> Female
                        </div>
                        <div class="password">
                            <input type="hidden" value="${requestScope.password}" name="password">
                        </div>
                        <div>
                            <button type="submit"><span class="material-symbols-outlined">
                                    save_as
                                </span>Save Changes</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>

        <script>
            function loadFile(event) {
                var image = document.getElementById("output");
                image.src = URL.createObjectURL(event.target.files[0]);
            }
        </script>
    </body>
</html>

</body>
</html>