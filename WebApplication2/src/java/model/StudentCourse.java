/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ngoki
 */
public class StudentCourse {
    private Account account ;
    private Courses course;
    private Enrollment enroll;
    public StudentCourse() {
    }

    public StudentCourse(Account account, Courses course, Enrollment enroll) {
        this.account = account;
        this.course = course;
        this.enroll = enroll;
    }

    public Enrollment getEnroll() {
        return enroll;
    }

    public void setEnroll(Enrollment enroll) {
        this.enroll = enroll;
    }

    

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Courses getCourse() {
        return course;
    }

    public void setCourse(Courses course) {
        this.course = course;
    }

   
}
