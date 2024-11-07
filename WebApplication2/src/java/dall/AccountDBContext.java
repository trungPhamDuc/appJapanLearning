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

public class AccountDBContext extends DBContext<Account> {

    public Account getAccountByUserPass(String username, String password) {
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[user_id]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[userType]\n"
                    + "      ,[gender]\n"
                    + "      ,[avatar]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[tblAccounts]\n"
                    + "  WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUserid(rs.getInt("user_id"));
                account.setUsername(username);
                account.setPassword(password);
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setUserType(rs.getString("userType"));
                account.setGender(rs.getBoolean("gender"));
                account.setAvatar(rs.getString("avatar"));
                account.setStatus(rs.getString("status"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public int countUser(String role){
        int count=0;
        try{
            String sql ="SELECT [user_id] FROM [dbo].[tblAccounts] WHERE [userType]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, role);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                count++;               
            }
        }catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } return count;
    }
    public ArrayList<String> selectUser() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            String sql = "SELECT [username]\n"
                    + "FROM [dbo].[tblAccounts]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("username"));
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<String> selectEmail() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            String sql = "SELECT [email]\n"
                    + "FROM [dbo].[tblAccounts]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("email"));
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean updateStatus(String username,String status){
        try {
            String sql = "    UPDATE [dbo].[tblAccounts]\n"
                    + "SET [status] = ?\n"
                    + "WHERE username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, username);
            int rowsUpdated = stm.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } return false;
    }

    public String getEmailByUser(String username) {
        try {
            String sql = "SELECT [email]\n"
                    + "FROM [dbo].[tblAccounts]\n"
                    + "Where username= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                return email;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateToken(String username, String token) {
        try {
            String sql = "    UPDATE [dbo].[tblAccounts]\n"
                    + "SET [resetToken] = ?\n"
                    + "WHERE username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void UpdateProfile(Account accounts) {
        try {
            String sql = "  UPDATE [tblAccounts]\n"
                    + "SET [username] = ?, [phone] = ?, [gender] = ?\n"
                    + "WHERE [user_id]=?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            stm.setString(1, accounts.getUsername());
            stm.setString(2, accounts.getPhone());
            stm.setBoolean(3, accounts.getGender());
            stm.setInt(4, accounts.getUserid());
            int n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public Account getAccountByIDs(int id) {
        try {
            String sql = " SELECT  [user_id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "      ,[userType]\n"
                    + "      ,[avatar]\n"
                    + "  FROM [tblAccounts]\n"
                    + "  WHERE [user_id]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUserid(rs.getInt("user_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));               
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setGender(rs.getBoolean("gender"));
                a.setUserType(rs.getString("userType"));
                a.setAvatar(rs.getString("avatar"));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateAvatar(String avatar, int id) {

        try {
            String sql = " update [tblAccounts]\n"
                    + "  set [avatar]=?\n"
                    + "  Where [user_id]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, avatar);
            stm.setInt(2, id);
            int n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public String getTokenByUsername(String username) {
        try {
            String sql = "SELECT [resetToken]\n"
                    + "FROM [dbo].[tblAccounts]\n"
                    + "Where username= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String token = rs.getString("resetToken");
                return token;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updatePassWord(String username, String password) {
        try {
            String sql = "    UPDATE [dbo].[tblAccounts]\n"
                    + "SET [password] = ?\n"
                    + "WHERE username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getuserType(String username) {
        try {
            String sql = "SELECT [userType]\n"
                    + "FROM [dbo].[tblAccounts]\n"
                    + "Where username= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String userType = rs.getString("userType");
                return userType;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Account> getAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[userType]\n"
                    + "      ,[gender]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[tblAccounts]\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setEmail(rs.getString("email"));
                acc.setUserType(rs.getString("userType"));
                acc.setPhone(rs.getString("phone"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setStatus(rs.getString("status"));
                accounts.add(acc);
            }
            return accounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void DeleteAccount(String username) {
        try {
            String sql = "DELETE FROM [dbo].[tblAccounts]\n"
                    + "      WHERE [username]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getIDByUsername(String username ){
        try{
            String sql = "SELECT [user_id] FROM [dbo].[tblAccounts] WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs =  stm.executeQuery();
            while(rs.next()){
                int id=(int)rs.getInt("user_id");
                return id;
            }
        }catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
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
