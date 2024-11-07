<%-- 
    Document   : addquestion
    Created on : Jul 26, 2024, 3:52:14 PM
    Author     : ngoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quiz Form</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <body>
        <div class="form-container" data-course_id ="${requestScope.course_id}" data-lesson_id="${requestScope.lesson_id}">

            <div class="form-group">
                <label for="question">Câu hỏi:</label>
                <input type="text" id="question" name="question" required>
            </div>
            <div class="form-group">
                <label for="answer1">Đáp án 1:</label>
                <input type="text" id="answer1" name="answer1" required>
            </div>
            <div class="form-group">
                <label for="answer2">Đáp án 2:</label>
                <input type="text" id="answer2" name="answer2" required>
            </div>
            <div class="form-group">
                <label for="answer3">Đáp án 3:</label>
                <input type="text" id="answer3" name="answer3" required>
            </div>
            <div class="form-group">
                <label for="answer4">Đáp án 4:</label>
                <input type="text" id="answer4" name="answer4" required>
            </div>
            <div class="form-group">
                <label for="correctAnswer">Đáp án đúng:</label>
                <input type="text" id="correctAnswer" name="correctAnswer" required>
            </div>
            <div class="form-group">
                <button id="submit" type="button">Submit</button>
                <button type="button" id="refresh">Refresh</button>
            </div>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#submit").click(function () {
                var url = "https://script.google.com/macros/s/AKfycby_e-f091Ql9T5fUq1tE9yivr86UliaJP9fnVpcN4vdJ5ggw8WiuBc2EcLcjA_nyl2gqg/exec";
                var courseId = $(".form-container").data("course_id");
                var lessonId = $(".form-container").data("lesson_id");
                var question = $("#question").val();
                var answer1 = $("#answer1").val();
                var answer2 = $("#answer2").val();
                var answer3 = $("#answer3").val();
                var answer4 = $("#answer4").val();
                var correctAnswer = $("#correctAnswer").val();
                if (!question || !answer1 || !answer2 || !answer3 || !answer4 || !correctAnswer) {
                    alert("Tất cả các trường đều là bắt buộc.");
                    return;
                }
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {
                        course_id: courseId,
                        lesson_id: lessonId,
                        question: question,
                        answer1: answer1,
                        answer2: answer2,
                        answer3: answer3,
                        answer4: answer4,
                        correct_answer: correctAnswer
                    },
                    success: function (response) {
                        console.log("Data written successfully");
                        // Optionally, you can show a success message or handle the response here
                    },
                    error: function (error) {
                        console.log("Error writing data: ", error);
                        // Optionally, you can show an error message here
                    }
                });
            });

            $("#refresh").click(function () {
                $("#question").val('');
                $("#answer1").val('');
                $("#answer2").val('');
                $("#answer3").val('');
                $("#answer4").val('');
                $("#correctAnswer").val('');
            });
        });
    </script>
</html>