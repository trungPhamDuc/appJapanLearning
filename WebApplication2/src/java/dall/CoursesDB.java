/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dall;

import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Courses;
import model.Lessons;

/**
 *
 * @author ngoki
 */
public class CoursesDB extends DBContext<Courses> {

    public int Count() {
        int count = 0;
        try {
            String sql = "select COUNT(*) as Count from tblCourses";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public ArrayList<Courses> getTopCourses(int amount) {
        ArrayList<Courses> courses = new ArrayList<>();
        try {
            String sql = "SELECT course_id, course_name, course_description\n"
                    + "                                              FROM tblCourses\n"
                    + "                                              ORDER BY course_id\n"
                    + "                                              OFFSET 0 ROWS\n"
                    + "                                              FETCH NEXT ? ROWS ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, amount);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_description(rs.getString("course_description"));

                LessonDB lessonsdb = new LessonDB();
                List<Lessons> lessons = lessonsdb.getLessonByCourseID(c.getCourse_id());
                c.setLessons(lessons);

                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public ArrayList<Courses> getCourses(int index) {
        ArrayList<Courses> courses = new ArrayList<>();
        try {
            String sql = "select * from tblCourses\n"
                    + "                        order by course_id\n"
                    + "                        offset ? rows fetch next 3 rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, index);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_description(rs.getString("course_description"));

                LessonDB lessonsdb = new LessonDB();
                List<Lessons> lessons = lessonsdb.getLessonByCourseID(c.getCourse_id());
                c.setLessons(lessons);

                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }  
    
    
    @Override
    public ArrayList<Courses> list() {
        ArrayList<Courses> courses = new ArrayList<>();
        try {
            String sql = "SELECT course_id, course_name, course_description\n"
                    + "                         FROM tblCourses";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_description(rs.getString("course_description"));
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public List<Courses> getAllCourses() {
        ArrayList<Courses> courses = new ArrayList<>();
        String sql = "select * from [tblCourses]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                courses.add(new Courses(
                        rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (SQLException e) {
        }
        return courses;
    }

    public void insertCourse(String courseName, String courseDescription) {
        String sql = "INSERT INTO [dbo].[tblCourses]\n"
                + "           ([course_name]\n"
                + "           ,[course_description])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseName);
            stm.setString(2, courseDescription);
            stm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteCourse(int courseId) {
        String sql = "DELETE FROM tblCourses WHERE course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);

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

    public ArrayList<Courses> searchCourse(String course) {
        ArrayList<Courses> courses = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tblCourses\n"
                    + "                        WHERE course_name LIKE ?\n"
                    + "                        ORDER BY course_id ;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + course + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Courses c = new Courses();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_description(rs.getString("course_description"));

                LessonDB lessonsdb = new LessonDB();
                List<Lessons> lessons = lessonsdb.getLessonByCourseID(c.getCourse_id());
                c.setLessons(lessons);

                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public void deleteCourseByID(int courseId) {
        String sql = "DELETE FROM tblCourses WHERE course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateCourse(int courseId, String courseName) {
        String sql = "UPDATE tblCourses SET course_name = ? WHERE course_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseName);
            stm.setInt(2, courseId);

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
    public void insert(Courses entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Courses entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Courses entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Courses get(int id) {
        try {
            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "      ,[course_description]\n"
                    + "  FROM [dbo].[tblCourses]\n"
                    + "  Where course_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Courses cour = new Courses();
                cour.setCourse_id(rs.getInt("course_id"));
                cour.setCourse_name(rs.getString("course_name"));
                cour.setCourse_description(rs.getString("course_description"));
                return cour;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
