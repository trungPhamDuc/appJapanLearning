<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Courses</title>
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/course.css"/>
    </head>
    <body>
        <header>
            <a href="" class="logo">
                <img src="../view/user/img/logo.png" alt=""/>
            </a>
            <c:if test="${sessionScope.account==null}">
                <ul class="navbar">
                    <li><a href="home">Home</a></li>

                    <li><a href="home#kana">Kana</a></li>
                    <li><a href="home#courses">Courses</a></li>
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

        <c:if test="${sessionScope.account != null}">
            <section class="courses">
                <div class="center-text">
                    <h5>YOUR COURSES</h5>
                </div>
                <div class="courses-content">
                    <c:forEach items="${requestScope.enrollmentCourse}" var="e">
                        <div class="row" onclick="window.location.href = 'lesson?course_id=${e.course_id.course_id}'">
                            <img src="../view/user/img/basicvocab.jpg" alt="alt"/>
                            <div class="courses-text">
                                <h5>$0.00</h5>
                                <h3>${e.course_id.course_name}</h3>
                                <h6>${e.course_id.course_description}</h6>
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
            </section>
        </c:if>

        <section class="courses" id="courses">
            <div class="center-text">
                <h5>COURSES</h5>
                <h2>Explore All Courses</h2>
            </div>
            <div class="search-bar">
                <form>
                    <input type="text" placeholder="Search..." name="search" oninput="searchCourses(this)">
                    <button type="button"><i class='bx bx-search'></i></button>
                </form>
            </div>
            <div class="courses-content" id="all-courses" data-enroll="${enrollmentCourse}">
                <c:forEach items="${courses}" var="c">
                    <c:set var="isEnroll" value="false" />
                    <c:forEach items="${enrollmentCourse}" var="e">
                        <c:if test="${c.course_id == e.course_id.course_id}">
                            <c:set var="isEnroll" value="true" />
                        </c:if>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <c:choose>
                                <c:when test="${isEnroll}">
                                    <c:set var="courseUrl" value="lesson?course_id=${c.course_id}" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="courseUrl" value="enroll?course_id=${c.course_id}" />
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <c:set var="courseUrl" value="lesson?course_id=${c.course_id}" />
                        </c:otherwise>
                    </c:choose>
                    <div class="row more-courses" onclick="window.location.href = '${courseUrl}'">
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
            <div class="main-btn" onclick="getNext3Courses()">
                <a class="btn">More</a>
            </div>

        </section>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
                let menu = document.querySelector('#menu-icon');
                let navbar = document.querySelector('.navbar');
                menu.onclick = () => {
                    menu.classList.toggle('bx-x');
                    navbar.classList.toggle('open');
                };

                let user_wrap = document.getElementById("user-wrap");
                function toggleMenu() {
                    user_wrap.classList.toggle("open-user-wrap");
                }

                window.onscroll = () => {
                    menu.classList.remove('bx-x');
                    navbar.classList.remove('open');
                    user_wrap.classList.remove("open-user-wrap");
                };

                var currentSearchResult = [];
                var enroll = [];

                function searchCourses(param) {
                    var txtSearch = param.value;
                    if (txtSearch === "") {
                        currentSearchResult = [];
                        return;
                    }
                    $.ajax({
                        url: 'courses',
                        type: 'POST',
                        data: {
                            action: 'search',
                            txt: txtSearch
                        },
                        success: function (response) {
                            currentSearchResult = response.courses;
                            console.log("Current Search: ", currentSearchResult);
                            enroll = response.enrollmentCourse;

                            console.log("Current Enroll ", enroll);
                            ;
                            $('#all-courses').empty();

                            $.each(currentSearchResult, function (index, item) {
                                var isEnroll = false;

                                $.each(enroll, function (index, e) {
                                    if (item.course_id === e.course_id.course_id) {
                                        console.log("This");
                                        isEnroll = true;
                                        return false;
                                    }
                                });

                                var courseUrl = !isEnroll ? "enroll?course_id=" + item.course_id : "lesson?course_id=" + item.course_id;

                                var course =
                                        '<div class="row" onclick="window.location.href=\'' + courseUrl + '\'">' +
                                        '<img src="../view/user/img/course1.jpg" alt="alt"/>' +
                                        '<div class="courses-text">' +
                                        '<h5>$0.00</h5>' +
                                        '<h3>' + item.course_name + '</h3>' +
                                        '<h6>' + item.course_description + '</h6>' +
                                        '<div class="rating">' +
                                        '<div class="star">' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '</div>' +
                                        '<div class="review">' +
                                        '<p>5 Review</p>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';

                                $('#all-courses').append(course);
                            });
                        },
                        error: function (xhr, status, error) {
                            console.error('Error:', status, error);
                        }
                    });
                    $('.main-btn').hide();

                }

                function getNext3Courses() {
                    var total = $('.more-courses').length;
                    $.ajax({
                        url: 'courses',
                        type: 'POST',
                        data: {
                            action: 'get',
                            total: total
                        },
                        success: function (response) {
                            console.log("Get next");
                            var currentEnrollments = response.enrollmentCourse || [];
                            $.each(response.courses, function (index, item) {
                                var isEnroll = false;

                                $.each(currentEnrollments, function (index, e) {
                                    if (item.course_id === e.course_id.course_id) {
                                        isEnroll = true;
                                        return false;
                                    }
                                });


                                var courseUrl = currentEnrollments.length === 0 ? "lesson?course_id=" + item.course_id :
                                        (!isEnroll ? "enroll?course_id=" + item.course_id : "lesson?course_id=" + item.course_id);

                                console.log("URL", courseUrl);
                                var course =
                                        '<div class="row more-courses" onclick="window.location.href=\'' + courseUrl + '\'">' +
                                        '<img src="../view/user/img/course1.jpg" alt="alt"/>' +
                                        '<div class="courses-text">' +
                                        '<h5>$0.00</h5>' +
                                        '<h3>' + item.course_name + '</h3>' +
                                        '<h6>' + item.course_description + '</h6>' +
                                        '<div class="rating">' +
                                        '<div class="star">' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '<a href=""><i class=\'bx bxs-star\'></i></a>' +
                                        '</div>' +
                                        '<div class="review">' +
                                        '<p>5 Review</p>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';
                                $('#all-courses').append(course);
                            });
                        }
                    });
                }


        </script>

    </body>
</html>
