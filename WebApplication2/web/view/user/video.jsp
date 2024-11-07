<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <title>JSP Page</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                list-style: none;
                text-decoration: none;
            }

            :root {
                --main-bg: #FFFFFF;
                --main-clr: #0071BA;
            }
            body {
                font-size: 1rem;
                width: 100%;
                font-family: 'Montserrat', sans-serif;
                min-height: 100vh;
                background-color: #F6F7FB;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                width: 1000px;
                min-height: 400px;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            ul.breadcrumb {
                margin: 20px 0 5px 0;
                padding: 20px 20px;
                background-color: #fff;
                border-radius: 5px;
                font-weight: bold;
                box-shadow: 0 .25rem 1rem 0 #282e3e14;
            }
            ul.breadcrumb li {
                display: inline;
                font-size: 16px;
            }
            ul.breadcrumb li+li:before {
                padding: 8px;
                color: var(--main-bg);
                content: "/";
            }
            ul.breadcrumb li a {
                color: #22100d;
            }
            ul.breadcrumb li a:hover {
                color: var(--main-clr);
            }

            h1 {
                margin-bottom: 20px;
                padding: 10px;
            }
            #lessons {
                width: 100%;
                height: 450px;
                margin: 5px 0;
                border-color: #3a3a3a;
                font-size: 21px;
                position: relative;
                transition: transform 0.8s ease;
                transform-style: preserve-3d;
                display: grid;
                grid-template-columns: 100%;
                justify-content: center;
                align-items: center;
                box-shadow: 0 .25rem 1rem 0 #282e3e14;
            }
            .lesson {
                margin-bottom: 40px;
            }

            .video-section {
                text-align: center;
                margin-bottom: 20px;
            }

            .description {
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            }

            button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://www.youtube.com/iframe_api"></script>
    </head>
    <body>
        <div class="container" data-course_id="${param.course_id}" data-lesson_id="${param.lesson_id}">
            <ul class="breadcrumb">
                <li><a href="home">Home</a></li>
                <li><a href="courses">Courses</a></li>
                <li><a href="lesson?course_id=${param.course_id}">Lesson</a></li>
                <li>FlashCard</li>
            </ul>
            <h1>Basic Vocabulary</h1>
            <div id="lessons">
                <div class="video-section" id="player"></div>
                <div class="description">
                    <h3></h3>
                    <p id="description"></p>
                </div>
            </div>
        </div>

        <script>
            $(window).on('load', function () {
                var courseId = $(".container").data("course_id");
                var lessonId = $(".container").data("lesson_id");

                const API_KEY = 'AIzaSyBVnPhgtK2DF-bj5oaiJsE-c6x8lIjmS-E';
                const PLAYLIST_ID = 'PLuqeHctv5uPcCDTF0byTHKW9f5Jetx0cC';

                function loadPlaylist() {
                    $.ajax({
                        url: `https://www.googleapis.com/youtube/v3/playlistItems`,
                        type: 'GET',
                        data: {
                            part: 'snippet',
                            maxResults: 10,
                            playlistId: PLAYLIST_ID,
                            key: API_KEY
                        },
                        success: function (data) {
                            const item = data.items[(lessonId - 1) % 10];
                            const videoId = item.snippet.resourceId.videoId;
                            const description = item.snippet.description;

                            
                            createPlayer('player', videoId);


                        },
                        error: function (error) {
                            console.error('Error loading playlist:', error);
                        }
                    });
                }

                function createPlayer(elementId, videoId) {
                    new YT.Player(elementId, {
                        height: '450',
                        width: '100%',
                        videoId: videoId,
                        events: {
                            'onReady': onPlayerReady,
                            'onStateChange': onPlayerStateChange
                        }
                    });
                }

                function onPlayerReady(event) {
                    event.target.playVideo();
                }

                function onPlayerStateChange(event) {
                    if (event.data == YT.PlayerState.ENDED) {
                        alert('Video đã được xem hết!');
                        $.ajax({
                            url: "../progress",
                            type: 'POST',
                            data: {
                                course_id: courseId,
                                lesson_id: lessonId,
                                video: true
                            },
                            success: function (result) {
                                console.log("SUBMIT DONE");
                            }
                        });
                    }
                }

                loadPlaylist();
            });
        </script>
    </body>
</html>
