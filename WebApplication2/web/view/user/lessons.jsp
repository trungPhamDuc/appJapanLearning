<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/lesson.css">
    </head>
    <body>

        <div class="container">
            <ul class="breadcrumb">
                <li><a href="home">Home</a></li>
                <li><a href="courses">Courses</a></li>
                <li>Lesson</li>

            </ul>
            <ul class="accordion" id="${course.course_id}">
                <div class="head">
                    <h1>${course.course_name}</h1>
                    <div>
                        <label for="progress" class="progress"></label>
                        <progress id="progress" value="0" max="100"></progress>
                    </div>
                </div>

                <c:forEach items="${lessons}" var="l" varStatus="i">
                    <li class="lesson-item${i.index} item disabled">
                        <input type="radio" name="acc" id="lesson+${i.index}">
                        <label for="lesson+${i.index}">
                            <h2>${i.index+1}</h2>
                            <h3>${l.lesson_name}</h3>
                        </label>
                        <div class="content">
                            <ul class="step-list" data-lesson-id="${l.lesson_id}">
                                <li class="step-item current-item" id="video${i.index+1}" 
                                    data-link="video?course_id=${course.course_id}&lesson_id=${l.lesson_id}">
                                    <span class="progress-count">1</span>
                                    <span class="progress-label">Video</span>
                                </li>
                                <li class="step-item disabled" id="flashcard${i.index+1}"
                                    data-link="flashcard?course_id=${course.course_id}&lesson_id=${l.lesson_id}">
                                    <span class="progress-count">2</span>
                                    <span class="progress-label">FlashCard</span>
                                </li>
                                <li class="step-item disabled" id="quiz${i.index+1}" 
                                    data-link="quiz?course_id=${course.course_id}&lesson_id=${l.lesson_id}">
                                    <span class="progress-count">3</span>
                                    <span class="progress-label">Quiz</span>
                                </li>

                            </ul>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>

            var courseId = ${param.course_id};
            var lessonId = $(".step-list").data("lesson_id");
            var currentLesson = $(".step-list").length;

            $.ajax({
                url: "lesson",
                type: 'POST',
                dataType: 'json',
                data: {
                    course_id: courseId
                },
                success: function (result) {


                    if (!result.isLogin) {
                        $(".item").first().removeClass("disabled");

                        $(".step-item").click(function () {
                            window.location.href = "../login";
                        });
                    } else {
                        if (result.progress.length === 0) {
                            $(".item").first().removeClass("disabled");
                        }
                        var currentLessonDone = 0;

                        $.each(result.progress, function (index, item) {
                            var video = item.video;
                            var flashcard = item.flashcard;
                            var quiz = item.quiz;
                            console.log("Current Done: ", currentLessonDone);
                            console.log(video, flashcard, quiz, "OK");
                            if (video == 1) {
                                $("#video" + (index + 1)).removeClass("current-item");
                                $("#flashcard" + (index + 1)).addClass("current-item");
                                $(".lesson-item" + index).removeClass("disabled");
                                $("#flashcard" + (index + 1)).removeClass("disabled");
                            }
                            if (flashcard == 1) {
                                $("#flashcard" + (index + 1)).removeClass("current-item");
                                $("#quiz" + (index + 1)).addClass("current-item");
                                $("#quiz" + (index + 1)).removeClass("disabled");
                            }
                            if (quiz == 1) {
                                $("#video" + (index + 1)).removeClass("current-item");
                                $("#flashcard" + (index + 1)).removeClass("current-item");
                                $("#quiz" + (index + 1)).removeClass("current-item");
                                $(".lesson-item" + (index + 1)).removeClass("disabled");
                                currentLessonDone++;
                                $('#progress').attr('value', currentLessonDone / currentLesson * 100);
                                $('.progress').text("Progress " + currentLessonDone / currentLesson * 100 + "%");
                                
                                $.ajax({
                                    url: "../progress",
                                    type: 'GET',
                                    data: {
                                        course_id: courseId,
                                        value: currentLessonDone / currentLesson * 100
                                    },
                                    success: function (result) {
                                        console.log("DONE FLASHCARD");
                                    }
                                });

                            }


                        });

                        $(".step-item").click(function () {
                            var link = $(this).data("link");
                            if (link) {
                                window.location.href = link;
                            }
                        });
                        
                    }


                },
                error: function (jqXHR, textStatus, errorThrown) {

                    console.log("AJAX error: " + textStatus + ' : ' + errorThrown);
                }
            });

        </script>

    </body>
</html>
