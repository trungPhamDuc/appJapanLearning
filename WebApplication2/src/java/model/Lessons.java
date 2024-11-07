/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author 
 */
public class Lessons {
    private int lesson_id;
    private Courses course_id;
    private String lesson_name;
    private String lesson_description;
    
    public Lessons() {
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public Courses getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Courses course_id) {
        this.course_id = course_id;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public void setLesson_name(String lesson_name) {
        this.lesson_name = lesson_name;
    }

    public String getLesson_description() {
        return lesson_description;
    }

    public void setLesson_description(String lesson_description) {
        this.lesson_description = lesson_description;
    }

    
    
}
