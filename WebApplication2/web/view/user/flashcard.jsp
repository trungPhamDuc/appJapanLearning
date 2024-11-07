<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Flashcard</title>
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/flashcard.css">

    </head>

    <body>
        <div class="container" data-course_id ="${param.course_id}" data-lesson_id="${param.lesson_id}">
            <ul class="breadcrumb">
                <li><a href="home">Home</a></li>
                <li><a href="courses">Courses</a></li>
                <li><a href="lesson?course_id=${param.course_id}">Lesson</a></li>
                <li>FlashCard</li>
            </ul>
            <h1>${course.lessons[param.lesson_id - 1].lesson_name}</h1>
            
            <div class="card">
                <div class="front" >
                    <p>Loading...</p>
                </div>
                <div class="back">
                    <p>Loading...</p>
                </div>
            </div>

            <div class="nav">
                <i class='bx bx-x-circle' id="unknown"></i>

                <span id="progress">0/10</span>

                <i class='bx bx-check-circle' id="known"></i>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="../view/user/js/flashcard.js"></script>
    </body>

</html>
