<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course List</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../view/lecturer/css/style.css">
        <style>
            .course-card {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 16px;
                margin: 16px;
                text-align: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                cursor: pointer;
                background-color: rgb(172, 204, 246);
            }
            .course-card img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
            }
            .course-card h3 {
                margin-top: 12px;
            }
            .course-card a {
                display: inline-block;
                margin: 10px 5px 0 5px;
                padding: 8px 16px;
                background-color: #f6f6f6;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .course-card a:hover {
                background-color: #0056b3;
            }
            .course-card a.delete {
                background-color: red;
            }
            .course-card a.delete:hover {
                background-color: darkred;
            }
            .sidebar {
                transform: translateX(0);
                transition: transform 0.3s ease;
            }
            .sidebar-open {
                transform: translateX(-100%);
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if(session.getAttribute("account")==null){
               response.sendRedirect("/SWP391_Group6/login");
            }           
        %>


        <div class="sidebar"">           
            <div class="sidebar-main">               
                <div class="sidebar-user">
                    <div class="user-wrap" id="user-wrap-sidebar">
                        <div class="sub-user">
                            <div class="user-infor">
                                <img src="http://localhost:9999/SWP391_Group6${sessionScope.account.avatar}" alt="" />
                                <h2>${sessionScope.account.username}</h2>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="sidebar-menu">
                <div class="menu-head">
                    <span>Bảng điều khiển</span>                   
                </div>
                <ul id="menu-list">
                    <li>
                        <a href="/SWP391_Group6/user/profile?id=${sessionScope.account.userid}">
                            <i class='bx bxs-user'></i>
                            <p>Profile</p>
                            <i class='bx bx-chevron-right'></i>
                        </a>
                    </li>
                    <li>
                        <a href="/SWP391_Group6/logout">
                            <i class='bx bxs-log-in-circle'></i>
                            <p>Log out</p>
                            <i class='bx bx-chevron-right'></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <script>
            function toggleSidebar() {
                var sidebar = document.querySelector('.sidebar');
                sidebar.classList.toggle('sidebar-open');
            }

        </script>
        <div class="main-content">

            <main>
                                 
                    <span class="las la-bars" onclick="toggleSidebar()"></span>

                <!-- Add Course Modal -->
                <div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="courseModalLabel">Add Course</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="addCourseForm" method="post" action="course">
                                    <input type="hidden" name="action" value="add">
                                    <div class="mb-3">
                                        <label for="add_course_name" class="form-label">Course Name</label>
                                        <input type="text" class="form-control" id="add_course_name" name="course_name" required>
                                        <label for="add_course_name" class="form-label">Course Description</label>
                                        <input type="text" class="form-control" id="add_course_name" name="course_description" required>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" form="addCourseForm" class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </div>
                </div>

                <h1>Course List</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">Add Course</button>
                <div class="container">
                    <div class="row">
                        <c:forEach var="cou" items="${courses}">
                            <div class="col-md-4">
                                <div class="course-card">
                                    <form action="/SWP391_Group6/lecturer/lesson" method="post" id="course-${cou.course_id}" onclick="submitForm(${cou.course_id})">
                                        <img src="../view/user/img/course.jpg" alt="${cou.course_name}">
                                        <h4 style="margin-top: 20px">${cou.course_name}</h4>
                                        <input type="hidden" name="courseid" value="${cou.course_id}">
                                        <input type="hidden" name="coursename" value="${cou.course_name}">
                                    </form>

                                    <button type="button" class="btn btn-primary updateCourseBtn" data-bs-toggle="modal" data-bs-target="#updateCourseModal${cou.course_id}" data-course-name="${cou.course_name}" data-course-id="${cou.course_id}">Update</button>
                                    <a href="UpdateDeleteCourse?action=delete&courseid=${cou.course_id}" class="btn btn-danger delete">Delete</a>


                                </div>

                            </div>
                            <!-- Update Course Modal -->
                            <div class="modal fade" id="updateCourseModal${cou.course_id}" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="courseModalLabel">Update Course</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form class="updateCourseForm" method="get" action="UpdateDeleteCourse">
                                            <div class="modal-body">
                                                <input type="hidden" name="courseid" value="${cou.course_id}">
                                                <input type="hidden" name="action" value="update">
                                                <div class="mb-3">
                                                    <label for="update_course_name_${cou.course_id}" class="form-label">Course Name</label>
                                                    <input type="text" class="form-control" id="update_course_name_${cou.course_id}" name="course_name" value="${cou.course_name}" required>
                                                </div>
                                            </div>
                                            <input type="hidden" name="action" value="update">
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </main>
        </div>
        <script>
            function submitForm(courseid) {
                var form = document.getElementById('course-' + courseid);
                form.submit();
            }

            document.addEventListener('DOMContentLoaded', function () {
                // Handle update button click
                document.querySelectorAll('.updateCourseBtn').forEach(function (button) {
                    button.addEventListener('click', function () {
                        var courseName = button.getAttribute('data-course-name');
                        var courseId = button.getAttribute('data-course-id');
                        var modal = document.getElementById('updateCourseModal' + courseId);
                        var input = modal.querySelector('input[name="course_name"]');
                        input.value = courseName;
                    });
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
