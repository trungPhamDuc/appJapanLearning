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
import model.Guest;

/**
 *
 * @author ngoki
 */
public class GuestDBContext extends DBContext<Guest> {

    public void insertIntoGuest(String hoten, String email, String phone, String feedback) {
        try {
            String sql = "INSERT INTO [dbo].[tblGuest]\n"
                    + "           ([hoten]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[feedback])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, hoten);
            stm.setString(2, email);
            stm.setString(3, phone);
            stm.setString(4, feedback);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Guest> getGuest() {
        ArrayList<Guest> guests = new ArrayList<>();
        try {
            String sql = "SELECT [hoten]\n"
                    + "      ,[email]\n"
                    + "      ,[id]\n"
                    + "      ,[phone]\n"
                    + "      ,[feedback]\n"
                    + "  FROM [dbo].[tblGuest]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Guest guest = new Guest();
                guest.setHoten(rs.getString("hoten"));
                guest.setEmail(rs.getString("email"));
                guest.setPhone(rs.getString("phone"));
                guest.setFeedback(rs.getString("feedback"));
                guest.setId(rs.getInt("id"));
                guests.add(guest);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return guests;
    }

    public void deleteGuestByID(String id) {
        try {
            String sql = "DELETE FROM [dbo].[tblGuest]\n"
                    + "      WHERE id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Guest> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Guest entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Guest entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Guest entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Guest get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
