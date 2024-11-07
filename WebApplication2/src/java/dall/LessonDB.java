/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dall;

import model.Courses;
import model.Lessons;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class LessonDB extends DBContext<Lessons> {

    public ArrayList<Lessons> getLessonByCourseID(int course_id) {
        ArrayList<Lessons> lessons = new ArrayList<>();
        try {
            String sql = "SELECT [lesson_id] ,[course_id],[lesson_name]\n"
                    + "   FROM [tblLessons] where course_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Lessons l = new Lessons();
                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));

                l.setCourse_id(c);
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setLesson_name(rs.getString("lesson_name"));

                lessons.add(l);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessons;
    }
    
    public ArrayList<Lessons> getAllLesson(int course_id) {
        ArrayList<Lessons> lessons = new ArrayList<>();
        try {
            String sql = "SELECT [lesson_id] ,[lesson_description],[lesson_name]\n"
                    + "   FROM [tblLessons] where course_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Lessons l = new Lessons();
                l.setLesson_id(rs.getInt("lesson_id"));
                l.setLesson_name(rs.getString("lesson_name"));
                l.setLesson_description(rs.getString("lesson_description"));
                lessons.add(l);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessons;
    }
    
    public boolean deleteLesson(int lessonId) {
        String sql = "DELETE FROM tblLessons WHERE lesson_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonId);

            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertLesson(int courseid, String lessonName) {
        String sql = "INSERT INTO tblLessons (course_id,lesson_name, lesson_description) VALUES (?,?,'')";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseid);
            stm.setString(2, lessonName);

            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateLesson(int lessonId, String lessonName,String lessondes) {
        String sql = "UPDATE tblLessons SET lesson_name = ?,lesson_description=? WHERE lesson_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lessonName);
            stm.setString(2, lessondes);
            stm.setInt(3, lessonId);
            
            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }



    @Override
    public ArrayList<Lessons> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    @Override
    public void insert(Lessons entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lessons entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lessons entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lessons get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
