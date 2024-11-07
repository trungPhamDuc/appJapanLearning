<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../view/lecturer/css/style.css">
        <style>
            .lesson-list {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }
            .lesson-card {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .lesson-card:hover {
                transform: scale(1.05);
            }
            .lesson-card h2 {
                font-size: 18px;
                margin: 0;
                color: #333;
            }
            .lesson-card a {
                display: inline-block;
                margin-left: 10px;
                padding: 8px 16px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .lesson-card a:hover {
                background-color: #0056b3;
            }
            .lesson-card a.delete {
                background-color: red;
            }
            .lesson-card a.delete:hover {
                background-color: darkred;
            }
            .sidebar {
                transform: translateX(0);
                transition: transform 0.3s ease;
            }
            .sidebar-open {
                transform: translateX(-100%);
            }
            .btn-add-question {
                background-color: #0071BA;
                color :#fff;
                margin-left: 20px;
            }

            .btn-add-question:hover {
                background-color: #0056b3;
            }

            .modal-body {
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

        </style>
    </head>
    <body>
        <div class="sidebar"">           
            <div class="sidebar-main">               
                <div class="sidebar-user">
                    <div class="user-wrap" id="user-wrap-sidebar">
                        <div class="sub-user">
                            <div class="user-infor">
                                <img src="http://localhost:9999/SWP391_Group6/${sessionScope.account.avatar}" alt="alt" />
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
            <header>                                   
                <span class="las la-bars" onclick="toggleSidebar()"></span>

            </header>
            <main>
                <!-- Add Lesson Modal -->
                <div class="modal fade" id="addLessonModal" tabindex="-1" aria-labelledby="lessonModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="lessonModalLabel">Add Lesson</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="addLessonForm" method="post" action="/SWP391_Group6/lecturer/addLesson">
                                    <input type="hidden" name="action" value="add">
                                    <div class="mb-3">
                                        <label for="add_lesson_name" class="form-label">Lesson Name</label>
                                        <input type="text" class="form-control" id="add_lesson_name" name="lesson_name" required>
                                    </div>
                                    <input type="hidden" name="coursename" value="${coursename}">
                                    <input type="hidden" name="courseid" value="${courseid}">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" form="addLessonForm" class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
                <h1>Course: ${coursename}</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addLessonModal">Add Lesson</button>
                <div class="lesson-list">
                    <c:forEach var="les" items="${lessonByCourse}" varStatus="status">
                        <div class="lesson-card">
                            <p style="color:red; font-size: 1.5rem">${status.index + 1}</p>
                            <h2>${les.lesson_name}</h2>
                            <div>
                                <button class="btn btn-primary updateLessonBtn" data-bs-toggle="modal" data-bs-target="#updateLessonModal${les.lesson_id}" data-lesson-name="${les.lesson_name}" data-lesson-id="${les.lesson_id}" data-lesson_description="${les.lesson_description}">Update</button>
                                <button class="btn btn-danger" style="background-color:red" data-bs-toggle="modal" data-bs-target="#deleteLessonModal${les.lesson_id}" data-lesson-name="${les.lesson_name}" data-lesson-id="${les.lesson_id}">Delete</button>
                            </div>
                        </div>
                        <!-- Update Lesson Modal -->
                        <div class="modal fade" id="updateLessonModal${les.lesson_id}" tabindex="-1" aria-labelledby="lessonModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="lessonModalLabel">Update Lesson</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form class="updateLessonForm" method="get" action="lesson">
                                        <div class="modal-body">

                                            <input type="hidden" name="lessonid" value="${les.lesson_id}">
                                            <input type="hidden" name="action" value="update">
                                            <div class="mb-3">
                                                <label for="update_lesson_name_${les.lesson_id}" class="form-label">Lesson Name</label>

                                                <input type="text" class="form-control" id="update_lesson_name_${les.lesson_id}" name="lesson_name" value="${les.lesson_name}" required><br>
                                                <label for="update_lesson_description_${les.lesson_id}" class="form-label">Lesson Description</label>
                                                <input type="text" class="form-control" id="update_lesson_description_${les.lesson_id}" name="lesson_description" value="${les.lesson_description}" required>
                                            </div>
                                            <input type="hidden" name="coursename" value="${coursename}">
                                            <input type="hidden" name="courseid" value="${courseid}">
                                        </div>
                                        <button type="button" class="btn btn-add-question" onclick="location.href = '../lecturer/addquestion?course_id=${courseid}&lesson_id=${les.lesson_id}'">Add question</button>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="deleteLessonModal${les.lesson_id}" tabindex="-1" aria-labelledby="deleteLessonModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteLessonModalLabel">Delete Lesson</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete this lesson?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <a href="lesson?coursename=${coursename}&courseid=${courseid}&lessonid=${les.lesson_id}&action=delete" class="btn btn-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </main>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
                                            document.addEventListener('DOMContentLoaded', function () {
                                                // Handle update button click
                                                document.querySelectorAll('.updateLessonBtn').forEach(function (button) {
                                                    button.addEventListener('click', function () {
                                                        var lessonName = button.getAttribute('data-lesson-name');
                                                        var lessonId = button.getAttribute('data-lesson-id');
                                                        var modal = document.getElementById('updateLessonModal' + lessonId);
                                                        var input = modal.querySelector('input[name="lesson_name"]');
                                                        input.value = lessonName;
                                                    });
                                                });
                                            });
        </script>
    </body>
</html>
