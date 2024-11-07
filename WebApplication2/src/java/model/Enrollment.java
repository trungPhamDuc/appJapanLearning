/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Enrollment {
    private int enrollment_id;
    private int user_id;
    private Courses course_id;
    private int progress;
    private String status;
    public Enrollment() {
    }

    public Enrollment(int enrollment_id, int user_id, Courses course_id, int progress, String status) {
        this.enrollment_id = enrollment_id;
        this.user_id = user_id;
        this.course_id = course_id;
        this.progress = progress;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }   

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public int getEnrollment_id() {
        return enrollment_id;
    }

    public void setEnrollment_id(int enrollment_id) {
        this.enrollment_id = enrollment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Courses getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Courses course_id) {
        this.course_id = course_id;
    }
    
    
}
