

package dall;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class SignupDBContext extends DBContext<Account> {

    public void updateAccountInDB(String user, String pass, String email, String phone,String userType,boolean gender,String status) {
        try {
            String sql = "INSERT INTO [dbo].[tblAccounts]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[userType]\n"
                    + "           ,[phone]\n"
                    + "           ,[gender]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.setString(3, email);
            stm.setString(4, userType);
            stm.setString(5, phone);            
            stm.setBoolean(6, gender);
            stm.setString(7, status);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SignupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
