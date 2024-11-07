<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quiz</title>
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/quiz.css" />

    </head>
    <body>
        <ul class="breadcrumb">
            <li><a href="home">Home</a></li>
            <li><a href="courses">Courses</a></li>
            <li><a href="lesson?course_id=${param.course_id}">Lesson</a></li>
            <li>Quiz</li>
        </ul>
        <div class="quiz_wrapper" data-course_id ="${param.course_id}" data-lesson_id="${param.lesson_id}">
            <div class="quiz_header">
                <div class="quiz_timer">
                    <i class='bx bx-time'></i>
                    <div class="quiz_timer_text">
                        <span>Time remaining</span>
                        <p id="timer">15:00</p>
                    </div>
                </div>
                <button id="quiz_submit">SUBMIT</button>
            </div>
            <div class="quiz_container">
                <div class="quiz_question">
                    <h5 id="question_count"></h5>
                    <p id="quiz_title">Loading...</p>

                    <div class="answer-box" id="answer_box">
                        Loading... 
                    </div>
                </div>
                <div class="quiz_progress">
                    <svg>
                    <circle r="70" cx="50%" cy="50%" id="track"></circle>
                    <circle r="70" cx="50%" cy="50%" id="progress"></circle>
                    </svg>
                    <span id="progress_text">0/10</span>
                </div>
            </div>
            <div class="quiz_numbers">
                <button id="quiz_prev">Prev</button>
                <ul id="question_numbers">

                </ul>
                <button id="quiz_next">Next</button>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="../view/user/js/quiz.js"></script>
    </body>
</html>
