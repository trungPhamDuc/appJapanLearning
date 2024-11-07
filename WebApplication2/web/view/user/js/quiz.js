$(document).ready(function () {
    //var url = 'https://script.google.com/macros/s/AKfycbxaIRbFn3TtlaqUyaSjz--49AOWgytlPNVm691fyp2doWnQRPdD96r5lMG4u3Wdfnd6vQ/exec';
    var currentIndex = 0;
    var currentAnswerChecked = 0;

    var score = 0;
    var totalQuestions = 0;
    var questions = [];
    let listSubmit = [];
    let listResults = [];
    let isSubmit = false;

    function displayQuestion(index) {
        var question = questions[index];
        $('#question_count').text('Question ' + (index + 1) + ' of ' + totalQuestions);
        $('#quiz_title').text(question.question_text);
        $('#question_text').val(question.question_text);
        $('#question_number').val(index + 1);
        $('#answer_box').empty();
        $.each(question.answers, function (i, ans) {
            var box =
                    '<div class="box">' +
                    '<input type="radio" name="option" id="option-' + (i + 1) + '" value="' + ans + '"  \n\
                        data-custom_id = "' + question.question_id + '" required hidden/>' +
                    '<label for="option-' + (i + 1) + '" class="answer-label">' + ans + '</label>' +
                    '</div>';
            $('#answer_box').append(box);
        });
        if (isSubmit) {
            $("input[name='option']").attr('disabled', true);
        }
        $("input[name='option']").on('click', answerSelection);
    }



    // GET/POST DATA
    var url = "https://script.google.com/macros/s/AKfycby_e-f091Ql9T5fUq1tE9yivr86UliaJP9fnVpcN4vdJ5ggw8WiuBc2EcLcjA_nyl2gqg/exec";

    var courseId = $(".quiz_wrapper").data("course_id");
    var lessonId = $(".quiz_wrapper").data("lesson_id");


    function getData() {
        $.ajax({
            url: url + '?course_id=' + courseId + '&lesson_id=' + lessonId,
            type: 'GET',
            dataType: 'json',
            success: function (data) {

                $.each(data, function (i, item) {
                    questions[i] = { 
                        question_id: item.question_id,
                        question_text: item.question_text,
                        answers: item.answers
                    };
                    listResults[i] = {
                        question_id: item.question_id,
                        answer: item.correct_answer
                    };
                });
                displayQuestion(0);
                totalQuestions = questions.length;

                for (var i = 0; i < totalQuestions; i++) {
                    $('#question_numbers').append('<li id="question' + i + '">' + (i + 1) + '</li>');
                }

                console.log(questions);
                console.log(listResults);
            },
            error: function (error) {
                console.error('Error fetching data:', error);
            }
        });
    }


    

    function answerSelection() {
        var selectedAnswer = $("input[name='option']:checked").val();

        var alreadyAnswered = listSubmit[currentIndex];
        listSubmit[currentIndex] = selectedAnswer;

        if (!alreadyAnswered) {
            currentAnswerChecked++;
        }
        $("#question" + currentIndex).css({
            "background-color": "#6ca9d1"
        });

        progress();
    }


    function resultUI() {
        for (var i = 0; i < totalQuestions; i++) {
            if (listResults[i].answer == listSubmit[i]) {

                $("#question" + i).css({
                    "background-color": "#9DE0BA"
                });
                $("input[name='option'][value='" + listResults[i].answer + "'][data-custom_id='" + listResults[i].question_id + "']")
                        .next('label').css({
                    "background-color": "#9DE0BA"
                });

            } else {
                $("#question" + i).css({
                    "background-color": "#FF9393"
                });
                $("input[name='option'][value='" + listSubmit[i] + "'][data-custom_id='" + listResults[i].question_id + "']")
                        .next('label').css({
                    "background-color": "#FF9393"
                });
                $("input[name='option'][value='" + listResults[i].answer + "'][data-custom_id='" + listResults[i].question_id + "']")
                        .next('label').css({
                    "background-color": "#9DE0BA"
                });
            }
        }
    }

    //Submit button
    function submit() {
        $("#quiz_submit").click(function () {
            var confirmed = confirm("Do you want to submit?");
            if (confirmed) {
                $("#quiz_submit").hide();
                resultUI();
                for (var i = 0; i < totalQuestions; i++) {
                    if (listResults[i].answer == listSubmit[i]) {
                        score++;
                    }
                }
                console.log("listResults:", listResults);
                console.log("listSubmit:", listSubmit);
                console.log("score: ", score);
                isSubmit = true;
                console.log("isSubmit: ", isSubmit);

                $("input[name='option']").attr('disabled', true);
                progress();
            }
        });

    }


    // Previous and Next
    function nav() {
        $('#quiz_prev, #quiz_next').click(function () {
            var id = this.id;
            if (id === 'quiz_prev' && currentIndex > 0) {
                currentIndex--;
            } else if (id === 'quiz_next' && currentIndex < totalQuestions - 1) {
                currentIndex++;
            }
            displayQuestion(currentIndex);
            if (listSubmit[currentIndex]) {
                $("input[name='option'][value='" + listSubmit[currentIndex] + "']").prop('checked', true);
            } 
            if(isSubmit){ resultUI();}
        });
    }


    function progress() {
        const r = $('#progress').attr('r');
        let cir = r * 2 * Math.PI;
        $('#progress').css({
            "stroke-dasharray": cir,
        });
        let offset;
        if (isSubmit) {
            var color_text = "#FF9393";
            offset = cir - cir * score / totalQuestions;
            if (score >= totalQuestions / 2) {
                color_text = "#9DE0BA";
                $.ajax({
                    url: "../progress",
                    type: 'POST',
                    data: {
                       course_id: courseId,
                       lesson_id: lessonId,
                       quiz: true
                    },
                    success: function (result) {
                        console.log("SUBMIT DONE");
                    }
                });
            }
            $('#progress').css({
                "stroke-dashoffset": offset,
                "stroke": color_text,
            });
            $('#progress_text').css({
                "color": color_text
            });

            $('#progress_text').text(score + '/' + totalQuestions);
        } else {
            offset = cir - cir * currentAnswerChecked / totalQuestions;
            $('#progress').css({
                "stroke-dashoffset": offset,
                "stroke": "#6ca9d1",
            });
            $('#progress_text').text(currentAnswerChecked + '/' + totalQuestions);
        }



    }

    function timer() {
        var timer = 60 * 15;
        function countdown() {
            var minutes = Math.floor(timer / 60);
            var seconds = timer % 60;

            var timerString =
                    (minutes < 10 ? "0" : "") +
                    minutes +
                    ":" +
                    (seconds < 10 ? "0" : "") +
                    seconds;

            $('#timer').text(timerString);


            timer--;

            if (timer <= 0) {
                $('#timer').text("Time out");
                submit();
            }
            if (isSubmit) {
                clearInterval(intervalId);
            }

        }
        var intervalId = setInterval(countdown, 1000);
    }

    function start() {
        getData();
        setTimeout(timer, 1000);
        nav();
        submit();
    }

    start();

});

