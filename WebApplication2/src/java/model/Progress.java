/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoki
 */
public class Progress {

    private int progress_id;
    private int user_id;
    private int course_id, lesson_id;
    private Boolean video_complete, flashcard_complete, quiz_complete;

    public Progress() {
    }

    public Progress(int progress_id, int user_id, int course_id, int lesson_id, boolean video_complete, boolean flashcard_complete, boolean quiz_complete) {
        this.progress_id = progress_id;
        this.user_id = user_id;
        this.course_id = course_id;
        this.lesson_id = lesson_id;
        this.video_complete = video_complete;
        this.flashcard_complete = flashcard_complete;
        this.quiz_complete = quiz_complete;
    }

    public int getProgress_id() {
        return progress_id;
    }

    public void setProgress_id(int progress_id) {
        this.progress_id = progress_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public Boolean getVideo_complete() {
        return video_complete;
    }

    public void setVideo_complete(Boolean video_complete) {
        this.video_complete = video_complete;
    }

    public Boolean getFlashcard_complete() {
        return flashcard_complete;
    }

    public void setFlashcard_complete(Boolean flashcard_complete) {
        this.flashcard_complete = flashcard_complete;
    }

    public Boolean getQuiz_complete() {
        return quiz_complete;
    }

    public void setQuiz_complete(Boolean quiz_complete) {
        this.quiz_complete = quiz_complete;
    }

  

}

