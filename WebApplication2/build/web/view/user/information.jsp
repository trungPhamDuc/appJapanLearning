<%-- 
    Document   : information
    Created on : Jul 11, 2024, 8:03:38 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">



        <title>Student Details</title>
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
                margin-top: 100px;
            }
            .profile, .report {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 10px;
                box-shadow: 0 2px 16px hsla(220, 32%, 8%, .3);

            }
            .profile {
                flex: 1;
                text-align: center;
                border: 1px solid black;

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
                border: 1px solid black;
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


            *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
                list-style: none;
                text-decoration: none;
                scroll-behavior: smooth;
            }

            :root {
                --bg-color: #ffffff;
                --text-color: #22100d;
                --second-color: #685f78;
                --main-color: #0071BA;
                --big-font: 3.8rem;
                --h2-font: 2.6 rem;
                --p-font: 1.1 rem;
            }

            body {
                background: var(--bg-color);
                color: var(--text-color);
            }

            header {
                position:  fixed;
                width: 100%;
                top: 0;
                right: 0;
                z-index: 1000;
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: var(--bg-color);
                padding: 23px 13%;
                transition: all 0.40s ease;
                box-shadow: 0 2px 16px hsla(220, 32%, 8%, .3);
            }

            .logo {
                height: auto;
                width: 160px;
                max-width: 100%;
            }

            .navbar {
                display: flex;
            }

            .navbar a {
                color: var(--text-color);
                font-weight: 600;
                font-size: var(--p-font);
                padding: 10px 22px;
                transition: all .40s ease;
            }

            .navbar a:hover {
                color: var(--main-color);
                font-weight: 800;
            }

            .header-icons {
                display: flex;
                align-items: center;

            }


            .header-icons i {
                margin-left: 10px;
                font-size: 30px;
                color: var(--text-color);
                transition: all .40s ease;
                margin-right: 15px;
            }

            .header-icons i:hover {
                transform: scale(1.2);
                color: var(--main-color);
            }

            #menu-icon {
                font-size: 34px;
                color: var(--text-color);
                z-index:  10001;
                cursor: pointer;
                display: none;
            }

            .user-pic {
                width: 34px;
                border-radius: 50%;
                cursor: pointer;
            }

            .user-wrap {
                position: absolute;
                top: 85%;
                right: 10%;
                width: 320px;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.5s;

            }

            .user-wrap.open-user-wrap{
                max-height: 400px;
            }

            .sub-user {
                background: var(--bg-color);
                margin: 20px;
                padding: 10px;
                border-radius: 10px;
            }

            .sub-user hr {
                border: 0;
                height: 1px;
                width: 100%;
                background: #ccc;
                margin: 15px 0 10px;
            }
            .user-infor {
                display: flex;
                align-items: center;
            }

            .user-infor h2 {
                font-size: var(--h2-font);
            }

            .user-infor img {
                width: 60px;
                border-radius: 50%;
                margin-right: 15px;
            }

            .user-menu {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: #525252;
                margin: 12px 0;
            }

            .user-menu p {
                color: var(--text-color);
                width: 100%;
                font-size: var(--p-font);
            }

            .user-menu i:first-child {
                font-size: 28px;
                border-radius: 50%;
                background: #e5e5e5;
                padding: 8px;
                margin-right: 15px;
            }

            .user-menu i:last-child {
                font-size: 22px;
                transition: transform 0.5s;
            }

            .user-menu:hover p {
                font-weight: 600;
            }
            .user-menu:hover i:last-child{
                transform: translateX(7px);
            }
            /* section home */
            section {
                padding: 80px 13%;
            }

            .home {
                position:  relative;
                height: 100vh;
                width: 100%;
                background: url(../img/background.jpg);
                background-size: cover;
                background-position: center;
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 1rem;
                align-items: center;
            }

            .home-text h1 {
                font-size: var(--big-font);
                margin: 15px 0 15px;
            }

            .home-text h6 {
                color: var(--main-color);
                font-size: 18px;
                font-weight: 600;
                letter-spacing: 2px;
            }

            .home-text p {
                color: var(--second-color);
                font-weight: 500;
                font-size: var(--p-font);
                margin-bottom: 48px;
            }

            .latter form {
                width: 100%;
                max-width: 460px;
                position: relative;
            }

            .latter form input:first-child {
                display: inline-block;
                width: 100%;
                outline: none;
                padding: 16px 140px 16px 15px;
                border: 1px solid var(--main-color);
                border-radius: 30px;
            }

            .latter form input:last-child {
                position: absolute;
                display: inline-block;
                border: none;
                outline: none;
                background: var(--main-color);
                color: var(--bg-color);
                padding: 16px 40px;
                border-radius: 30px;
                cursor: pointer;
                top: 1px;
                right: 0px;
            }

            .home-img img {
                height: auto;
                width: 100%;
            }

            .center-text {
                text-align: center;
            }

            .center-text h5 {
                color:  var(--main-color);
                font-size: 16px;
                font-weight: 600;
                letter-spacing: 1px;
                margin-bottom: 20px;
            }

            .center-text h2 {
                font-size: var(--h2-font);
                line-height: 1.2;
            }

            .kana-content {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 1.5rem;
                align-items: center;
                cursor: pointer;
                text-align: center;
                margin-top: 4rem;
            }

            .box {
                padding: 25px 60px;
                border: 1px solid #e9ecef;
                border-radius: 20px;
                box-shadow: -11.729px -11.729px 32px rgb(255 255 255 / 15%);
                transition: all .40s ease;
            }
            .box:hover {
                transform: translateY(-15px);
            }
            .box img{
                height: auto;
                width: 110px;
                margin-bottom: 20px;
            }

            .box h3 {
                font-size: 20px;
                font-weight: 700;
                margin-bottom: 30px;
                line-height: 30px;
                transition: all .40s ease;
            }
            .box h3:hover {
                color: var(--main-color);
            }

            .box p {
                font-size: var(--p-font);
                color: var(--second-color);
                font-weight: 500;
            }

            .main-btn {
                text-align: center;
                margin-top: 5rem;
            }

            .btn {
                display: inline-block;
                padding: 16px 30px;
                font-size: var(--p-font);
                font-weight: 700;
                background: var(--main-color);
                color: var(--bg-color);
                border-radius: 30px;
                transition: all .40s ease;

            }

            .btn:hover {
                transform: translateY(-15px);
            }



            /* courses */





            @media(max-width: 1410px){
                header {
                    padding: 10px 3%;
                    transition: .2s;
                }

                header.sticky {
                    padding: 12px 3%;
                    transition: .2s;
                }

                section {
                    padding: 70px 3%;
                    transition: .2s;
                }

            }

            @media(max-width: 1050px){
                :root {
                    --big-font: 3.2rem;
                    --h2-font: 2 rem;
                    --p-font: 1 rem;
                    transition: .1s;
                }
                .home {
                    height: 84vh;
                }
            }

            @media(max-width: 1025px){
                #menu-icon{
                    display: block;
                }
                .navbar {
                    position: absolute;
                    top: 100%;
                    right: -100%;
                    width: 300px;
                    height: 110vh;
                    background: var(--main-color);
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 170px;
                    transition: all .40s ease;
                }

                .navbar a {
                    display: block;
                    margin: 1.3rem 0;
                    color: var(--bg-color);
                }

                .navbar a:hover {
                    color: var(--bg-color);
                    transform: translateY(-5px);
                }
                .navbar.open{
                    right: 0;
                }
            }

            @media(max-width: 890px) {
                .home {
                    height: 150vh;
                    grid-template-columns: 1fr;
                    gap: 1rem;
                }

                .home-img {
                    text-align: center;
                }

                .home-img img {
                    height: auto;
                    width: 100%;
                }
            }

            @media(max-width: 600px){

            }
            .progress-bar-green {
                background-color: green;
            }

            .progress-bar-red {
                background-color: red;
            }


        </style>
    </head>
    <body>

        <header class="nvarbar-bar">
            <a href="home" class="logo">
                <img src="/view/user/img/logo.png" alt=""/>
            </a>
            <ul class="navbar">
                <li><a href="../backhome">Home</a></li>
            </ul>

            <div class="header-icons">



                <img src="http://localhost:9999/SWP391_Group6/${requestScope.avatar}" width="40" height="40"  alt="alt" class="user-pic" onclick="toggleMenu()"/>
                <div class="bx bx-menu" id="menu-icon"></div>
                <div class="user-wrap" id="user-wrap">
                    <div class="sub-user">
                        <div class="user-infor">
                            <img src="http://localhost:9999/SWP391_Group6/${requestScope.avatar}" width="50" height="50" />
                            <h2>${sessionScope.account.username}</h2>
                        </div>
                        <hr>

                        <a class="user-menu" href="../logout">
                            <i class='bx bxs-log-in-circle' ></i>
                            <p>Log out</p>
                            <i class='bx bx-chevron-right'></i>
                        </a>

                    </div>
                </div>

        </header>

        <div class="container">
            <div class="profile" >         
                <img src="http://localhost:9999/SWP391_Group6/${requestScope.avatar}" alt="Student Avatar" id="output" width="200">
                <h2>  ${requestScope.name}</h2>
                <div class="details">
                    <h3>Details</h3>
                    <div class="profile-info">
                        <div class="row">
                            <div class="col-md-6">
                                <label>User Id :</label>
                            </div>
                            <div class="col-md-6">
                                <p>${requestScope.id}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Name  :</label>
                            </div>
                            <div class="col-md-6">
                                <p>${requestScope.name}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6"  >
                                Email : <p>${requestScope.email}</p>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Phone :</label>
                            </div>
                            <div class="col-md-6">
                                <p>${requestScope.phone}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Gender :</label>
                            </div>
                            <div class="col-md-6">
                                <p>${requestScope.gender?"male":"female"}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <a href="editprofile?id=${requestScope.id}">
                        <button class="edit-button"><span class="material-symbols-outlined">
                                edit
                            </span>️ Edit</button>
                    </a>


                </div>
            </div>
            <c:if test="${sessionScope.account.userType=='student'}">
                <div class="report">
                    <h2>Progress Report</h2>
                    <c:choose>
                        <c:when test="${empty requestScope.list}">
                            <p>Not found course</p>
                        </c:when>
                        <c:otherwise>
                            <table>
                                <tr>
                                    <th>Subject Name</th>
                                    <th>Progress</th>                         
                                    <th>Status</th>

                                </tr>
                                <c:forEach items="${requestScope.list}" var="enrollment">
                                    <tr>
                                        <td>${enrollment.course_id.course_name}</td>
                                        <td>
                                            ${enrollment.progress}%
                                            <div class="progress-bar <c:if test="${enrollment.progress == 100}">progress-bar-green</c:if> <c:if test="${enrollment.progress < 100}">progress-bar-red</c:if>" style="width: ${enrollment.progress}%;"></div>
                                            </td>
                                            <td>
                                            <c:choose>
                                                <c:when test="${enrollment.progress == 100}">
                                                    <span style="color: green;">Pass</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color:red;">Studying</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>

        </div>


        <script>
            let menu = document.querySelector('#menu-icon');
            let navbar = document.querySelector('.navbar');
            menu.onclick = () => {
                menu.classList.toggle('bx-x');
                navbar.classList.toggle('open');
            }

            let user_wrap = document.getElementById("user-wrap");
            function toggleMenu() {
                user_wrap.classList.toggle("open-user-wrap");
            }

            window.onscroll = () => {
                menu.classList.remove('bx-x');
                navbar.classList.remove('open');
                user_wrap.classList.remove("open-user-wrap");
            }


            function loadFile(event) {
                var image = document.getElementById("output");
                image.src = URL.createObjectURL(event.target.files[0]);
            }



        </script>
    </body>
</html>
