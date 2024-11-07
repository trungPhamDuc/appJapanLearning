package model;

import java.util.List;

/**
 *
 * @author rg
 */
public class Courses {

    private int course_id;
    private String course_name;
    private String course_description;
   private List<Lessons> lessons;


    public Courses() {
    }

    public Courses(int course_id, String course_name) {
        this.course_id = course_id;
        this.course_name = course_name;
    }
    

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_description() {
        return course_description;
    }

    public void setCourse_description(String course_description) {
        this.course_description = course_description;
    }

    public List<Lessons> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lessons> lessons) {
        this.lessons = lessons;
    }
   

}

