
package model;


public class Account {
    private String username;
    private String password;
    private String email;
    private String phone;
    private String userType;
    private boolean gender;
    private int userid;
    private String avatar;
    private String status;
    public Account() {
    }

    public Account(String username, String password, String email, String phone, String userType, boolean gender, int userid, String avatar, String status) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.userType = userType;
        this.gender = gender;
        this.userid = userid;
        this.avatar = avatar;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    
}
