$(document).ready(function () {
    $(".card").click(function () {
        $(this).toggleClass('flipped');
    });


    var url = "https://script.google.com/macros/s/AKfycby_e-f091Ql9T5fUq1tE9yivr86UliaJP9fnVpcN4vdJ5ggw8WiuBc2EcLcjA_nyl2gqg/exec";

    var courseId = $(".container").data("course_id");
    var lessonId = $(".container").data("lesson_id");

    console.log("Course ID:", courseId);
    console.log("Lesson ID:", lessonId);
    var flashcards = [];

    function getData() {
        $.ajax({
            url: url + '?course_id=' + courseId + '&lesson_id=' + lessonId,
            type: 'GET',
            dataType: 'json',
            success: function (data) {

                $.each(data, function (i, item) {
                    flashcards[i] = {
                        question_text: item.question_text,
                        correct_answer: item.correct_answer,
                        known: false
                    }
                });
                displayFlashCard(0);
                console.log(flashcards);
            },
            error: function (error) {
                console.error('Error fetching data:', error);
            }
        });
    }
    var currentIndex = 0;
    function displayFlashCard(index) {
        var card = flashcards[index];
        $(".front p").text(card.question_text);
        $(".back p").text(card.correct_answer);
    }

    getData();
    var currentKnown = 0;

    $("#known, #unknown").click(function () {
        var id = this.id;
        if (id === 'known') {
            flashcards[currentIndex].known = true;
        }

        do {
            currentIndex = (currentIndex + 1) % flashcards.length;
        } while (flashcards[currentIndex].known && flashcards.some(card => !card.known));

        if (flashcards.every(card => card.known)) {
            $("#progress").text("Done");
            $.ajax({
                url: "../progress",
                type: 'POST',
                data: {
                    course_id: courseId,
                    lesson_id: lessonId,
                    flashcard: true
                },
                success: function (result) {
                    
                    console.log("DONE FLASHCARD");
                }
            });
        } else {
            displayFlashCard(currentIndex);
            $("#progress").text(flashcards.filter(card => card.known).length + '/' + flashcards.length);
        }

    });
});
