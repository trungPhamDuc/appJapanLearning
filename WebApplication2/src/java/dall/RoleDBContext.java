package dall;

import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

public class RoleDBContext extends DBContext<Role> {

    public ArrayList<Role> getByUsernameAndUrl(int userid, String url) {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = "SELECT r.roleid,r.rolename FROM tblAccounts a \n" +
"                    	INNER JOIN [tblRole_Account] ra ON ra.use_id = a.user_id\n" +
"                    	INNER JOIN [tblRoles] r ON r.roleid = ra.roleid\n" +
"                    	INNER JOIN [tblRole_Feature] rf ON rf.roleid = r.roleid\n" +
"                    	INNER JOIN [tblFeature] f ON f.fid = rf.fid \n" +
"                    WHERE a.user_id = ? AND f.url = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setId(rs.getInt("roleid"));
                r.setName(rs.getString("rolename"));
                roles.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }
    public void DeleteRoleAccount(int userID) {
        try {
            String sql = "DELETE FROM [dbo].[tblRole_Account]\n"
                    + "      WHERE [use_id]=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public ArrayList<Role> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Role entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Role get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
