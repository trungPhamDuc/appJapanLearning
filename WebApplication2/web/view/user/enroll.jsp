<%-- 
    Document   : enroll
    Created on : Jul 16, 2024, 11:24:30 AM
    Author     : ngoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enrollment Courses</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/enroll.css"/>
    </head>
    <body>

        <div class="container">
            <div class="breadcrumb">
                <a href="home">Home</a> / <a href="courses">Courses</a> / Enrollment
            </div>

            <div class="course-header">
                <img src="../view/user/img/course1.jpg" alt="Course Logo">
                <div class="course-title">${course.course_name}</div>
                <div class="course-meta">
                    <span>${numberOfEnrollment} already enrolled</span> &middot; <span></span>
                </div>
                <button class="enroll-button">Enroll for Free</button>
                <div class="course-meta">
                    <span></span>
                </div>
            </div>

            <div class="course-info" data-course_id ="${param.course_id}" >
                <div>
                    <h3>Beginner level</h3>
                    <p>Recommended experience: None</p>
                </div>
                <div>
                    <h3>16 hours to complete</h3>
                    <p>2 weeks at 5 hours a week</p>
                </div>
                <div>
                    <h3>Starts Date</h3>
                    <p>Lorem ipsum dolor sit amet.</p>

                </div>
            </div>
        </div>
                
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
            var courseId = $(".course-info").data("course_id");

            $(".enroll-button").click(function () {
                $.ajax({
                    url: "enroll?course_id=" + courseId,
                    type: 'POST',
                    
                    success: function (data) {
                        window.location.href = 'lesson?course_id=' + courseId;
                    }
                });
            });
        </script>
    </body>
</html>
