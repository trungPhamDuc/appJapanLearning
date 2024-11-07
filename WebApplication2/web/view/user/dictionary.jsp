<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Jisho Dictionary</title>
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../view/user/css/dictionary.css"/>
    </head>
    <body>
        <div class="back">
            <i class='bx bx-chevron-left' ></i>
        </div>
        <div class="container">
            <div class="search-box">
                <input type="text" id="query" placeholder="Enter a word" />
                <button id="search-btn" onclick="search()">Search</button>
            </div>
            <div class="result" id="result"></div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                    function search() {
                        $("#result").empty();
                        const query = document.getElementById("query").value;

                        $.ajax({

                            url: "dictionary?query=" + query,
                            type: 'POST',
                            data: {
                                query: query
                            },
                            success: function (result) {
                                $.each(result.data, function (index, item) {
                                    var res = '<h1>' + item.japanese[index].word + '</h1>' +
                                            '<h1>' + item.japanese[index].reading + '</h1>' +
                                            '<h1>' + item.senses[index].english_definitions + '</h1>';

                                    var results =
                                            '<div class="word">' +
                                            '<h3>' + item.japanese[index].word + '</h3>' +
                                            '<button onclick="playSound()">' +
                                            '<i class="bx bxs-volume-full"></i>' +
                                            '</button>' +
                                            '</div>' +
                                            '<div class="details">' +
                                            '<p>' + item.japanese[index].reading + '</p>' +
                                            '<p></p>' +
                                            '</div>' +
                                            '<p class="word-meaning">' + item.senses[index].english_definitions + '</p>' +
                                            '<p class="word-example"></p>'

                                    $("#result").append(results);
                                });
                            }
                        });
                    }
                    $(".back").click(function () {
                        window.location.href = 'home';
                    });
        </script>
    </body>
</html>
