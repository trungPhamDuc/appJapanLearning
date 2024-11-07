/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dall;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Courses;
import model.Enrollment;
import model.Lessons;
import model.StudentCourse;

/**
 *
 * @author
 */
public class EnrollmentDB extends DBContext<Enrollment> {

   

    public ArrayList<Enrollment> getEnrollmentCourse(int userID) {
        ArrayList<Enrollment> courses = new ArrayList<>();
        try {
            String sql = "select c.course_id, c.course_name, c.course_description, e.enrollment_id\n" +
"                         from tblEnrollments e join tblCourses c \n" +
"                         on e.course_id = c.course_id\n" +
"                         where user_id = ?";
                          
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Enrollment e = new Enrollment();

                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_description(rs.getString("course_description"));

                e.setCourse_id(c);
                e.setUser_id(userID);
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                courses.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
     public ArrayList<Integer> countGroupBY() {
        ArrayList<Integer> counts = new ArrayList<>();
        try {
            String sql = "SELECT COUNT(*) as count\n"
                    + "FROM [dbo].[tblEnrollments] e\n"
                    + "GROUP BY e.course_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                int a = rs.getInt("count");
                counts.add(a);
            }
            return counts;
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
     
     public int numberOfEnrollments(int course_id) {
        int numberOfEnrollments = 0;
        try {
            String sql = "SELECT COUNT(*) as [number of enrollments]\n"
                    + "FROM tblEnrollments\n"
                    + "WHERE course_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();

            numberOfEnrollments = rs.getInt("number of enrollments");
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numberOfEnrollments;
    }
 
    
    public ArrayList<Enrollment> GetProgeressByID(int id) {
        ArrayList<Enrollment> list = new ArrayList<>();
        try {
            String sql = "SELECT c.course_description , c.course_name  ,e.enrollment_id, e.user_id,e.progress\n"
                    + "FROM tblCourses  c join tblEnrollments e  on c.course_id =e.course_id\n"
                    + "WHERE e.user_id=?\n"
                    + "Order By c.course_name";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                Courses c = new Courses();

                c.setCourse_description(rs.getString("course_description"));
                c.setCourse_name(rs.getString("course_name"));
                e.setCourse_id(c);
                e.setProgress(rs.getInt("progress"));
                list.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

     
    public int countBYCourID(int couID) {
        int a=0;
        try {
            String sql = "SELECT COUNT(*) as count\n"
                    + "FROM [dbo].[tblEnrollments] e\n"
                    + "where e.course_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, couID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                a = rs.getInt("count");
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        } return 0;
    }


    @Override
    public ArrayList<Enrollment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Enrollment entity) {
        try {
            String sql = "INSERT INTO tblEnrollments (course_id, user_id,status) VALUES (?, ?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getCourse_id().getCourse_id());
            stm.setInt(2, entity.getUser_id());
            stm.setString(3, entity.getStatus());
            ResultSet rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     @Override
    public void update(Enrollment entity) {
        try {
            String sql = "UPDATE tblEnrollments SET progress = ?\n"
                    + "WHERE user_id = ? and course_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getProgress());
            stm.setInt(2, entity.getUser_id());
            stm.setInt(3, entity.getCourse_id().getCourse_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public void delete(Enrollment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Enrollment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

