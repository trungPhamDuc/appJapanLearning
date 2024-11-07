/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dall;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Courses;
import model.Enrollment;
import model.StudentCourse;

/**
 *
 * @author ngoki
 */
public class StudentCouDBContext extends DBContext<StudentCourse> {

    public ArrayList<StudentCourse> getStudentEnrollmentCourse() {
        ArrayList<StudentCourse> studentcous = new ArrayList<>();
        try {
            String sql = "SELECT a.user_id ,a.username,c.course_name,c.course_id,e.status,e.progress\n"
                    + "from [dbo].[tblAccounts] a \n"
                    + "join [dbo].[tblEnrollments] e on a.user_id= e.user_id\n"
                    + "join [dbo].[tblCourses] c on e.course_id=c.course_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                StudentCourse stuco = new StudentCourse();
                Account acc = new Account();
                Courses cour = new Courses();
                Enrollment enroll = new Enrollment();
                enroll.setStatus(rs.getString("status"));
                enroll.setProgress(rs.getInt("progress"));
                stuco.setEnroll(enroll);
                acc.setUserid(rs.getInt("user_id"));
                acc.setUsername(rs.getString(("username")));
                stuco.setAccount(acc);
                cour.setCourse_id(rs.getInt("course_id"));
                cour.setCourse_name(rs.getString("course_name"));
                stuco.setCourse(cour);
                studentcous.add(stuco);
            }
            return studentcous;
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<StudentCourse> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(StudentCourse entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(StudentCourse entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(StudentCourse entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public StudentCourse get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
