/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dall;

import model.Quizzes;
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
public class QuizzesDB extends DBContext<Quizzes> {

    public ArrayList<Quizzes> getQuizByLessonId(int lesson_id) {
        ArrayList<Quizzes> quiz = new ArrayList<>();
        try {
            String sql = "";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizzesDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quiz;
    }

    @Override
    public ArrayList<Quizzes> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Quizzes entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Quizzes entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Quizzes entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Quizzes get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
