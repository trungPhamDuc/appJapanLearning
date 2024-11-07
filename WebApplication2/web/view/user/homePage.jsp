
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/homePage.css"/>
    </head>

    <body>
        <!-- Start header -->
        <header>
            <a href="" class="logo">
                <img src="../view/user/img/logo.png" alt=""/>
            </a>
            <c:if test="${sessionScope.account==null}">
                <ul class="navbar">
                    <li><a href="#home">Home</a></li>
                    
                    <li><a href="#kana">Kana</a></li>
                    <li><a href="#courses">Courses</a></li>
                    <li><a href="../guest/feedback">Contact</a></li>
                </ul>
            </c:if>

            <c:if test="${sessionScope.account!=null}">
                <ul class="navbar">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#kana">Kana</a></li>
                    <li><a href="#courses">Courses</a></li>
                    <li><a href="dictionary">Dictionary</a></li>
                </ul>
            </c:if>
            <div class="header-icons">
                <c:if test="${sessionScope.account==null}">
                    <i class='bx bx-user' onclick="toggleMenu()"></i>
                    <div class="bx bx-menu" id="menu-icon"></div>

                    <div class="user-wrap" id="user-wrap">
                        <div class="sub-user">
                            <hr>
                            <a class="user-menu" href="/SWP391_Group6/login">
                                <i class='bx bxs-user'></i>
                                <p>Log in </p>
                                <i class='bx bx-chevron-right'></i>

                            </a>

                            <a class="user-menu" href="/SWP391_Group6/signup">
                                <i class='bx bxs-log-in-circle' ></i>
                                <p>Sign up</p>
                                <i class='bx bx-chevron-right'></i>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account!=null}">
                    <img src="http://localhost:9999/SWP391_Group6/${sessionScope.account.avatar}" alt="alt" class="user-pic" onclick="toggleMenu()"/>
                    <div class="bx bx-menu" id="menu-icon"></div>

                    <div class="user-wrap" id="user-wrap">
                        <div class="sub-user">
                            <div class="user-infor">
                                <img src="http://localhost:9999/SWP391_Group6/${sessionScope.account.avatar}"/>
                                <h2>${sessionScope.account.username}</h2>
                            </div>
                            <hr>
                            <a class="user-menu" href="/SWP391_Group6/user/profile?id=${sessionScope.account.userid}">
                                <i class='bx bxs-user'></i>
                                <p>Profile</p>
                                <i class='bx bx-chevron-right'></i>

                            </a>

                            <a class="user-menu" href="/SWP391_Group6/logout">
                                <i class='bx bxs-log-in-circle' ></i>
                                <p>Log out</p>
                                <i class='bx bx-chevron-right'></i>
                            </a>
                        </div>
                    </div>
                </c:if>

            </div>

        </header>


        <!-- start home section -->
        <section class="home" id="home">
            <div class="home-text">
                <h6>Best online learning platform</h6>
                <h1>Accessible Online Courses For All</h1>
                <p>Own your future learning new skills online</p>
            </div>
            <div class="home-img">
                <img src="../view/user/img/heroman.png" alt="alt">
            </div>
        </section>


        <!-- start kana section -->
        <section class="kana" id="kana">
            <div class="center-text">
                <h5>Kana</h5>
                <h2>Kana For Learning</h2>
            </div>
            <div class="kana-content">

                <div class="box" onclick="window.location.href = '/SWP391_Group6/view/hiragana.html'">
                    <img src="../view/user/img/higarana.png" alt="alt"/>
                    <h3>Higarana</h3>

<!--                    <p>5 Courses</p>-->
                    <a></a>

                </div>

                <div class="box" onclick="window.location.href = '/SWP391_Group6/view/katakana.html'">
                    <img src="../view/user/img/katakana.png" alt="alt"/>
                    <h3>Katakana</h3>
<!--                    <p>5 Courses</p>                   -->

                </div>

                <div class="box" onclick="window.location.href = '/SWP391_Group6/view/kanji.html'">
                    <img src="../view/user/img/kanji.png" alt="alt"/>
                    <h3>Kanji</h3>
                    <!--<p>5 Courses</p>-->
                </div>


            </div>
        </section>


        <section class="courses" id="courses">
            <div class="center-text">
                <h5>COURSES</h5>
                <h2>Explore Popular Courses</h2>
            </div>

            <div class="courses-content">
                <c:forEach begin="0" end="2" items="${requestScope.courses}" var="c">
                    <div class="row">
                        <img src="../view/user/img/course1.jpg" alt="alt"/>
                        <div class="courses-text">
                            <h5>$0.00</h5>
                            <h3>${c.course_name}</h3>
                            <h6>${c.course_description}</h6>
                            <div class="rating">
                                <div class="star">
                                    <a href=""><i class='bx bxs-star'></i></a>
                                    <a href=""><i class='bx bxs-star'></i></a>
                                    <a href=""><i class='bx bxs-star'></i></a>
                                    <a href=""><i class='bx bxs-star'></i></a>
                                    <a href=""><i class='bx bxs-star'></i></a>
                                </div>
                                <div class="review">
                                    <p>5 Review</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <%--<c:if test="${sessionScope.account!=null}">--%>
                <div class="main-btn">
                    <a href="courses" class="btn">All Courses</a>
                </div>
            <%--</c:if>--%>
        </section>


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

        </script>
        
    </body>
</html>

