/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dall.AccountDBContext;
import dall.Role_AccountDBContext;
import dall.SignupDBContext;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Properties;

/**
 *
 * @author ngoki
 */
public class AddLecturerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SignupDBContext signDB = new SignupDBContext();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String genderParam = request.getParameter("gender");
        boolean gender = false;
        if (genderParam != null && genderParam.equals("1")) {
            gender = true;
        }
        String role = request.getParameter("role");
        signDB.updateAccountInDB(username, password, email, phone, role, gender,"active");

        final String from = "quancvhe176299@fpt.edu.vn";
        final String epassword = "ddyq lqsl hndq lucd";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, epassword);
            }
        };
        Session session = Session.getInstance(properties, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
            msg.setSubject("Access feedback");
            msg.setSentDate(new Date());
            msg.setText("Tài khoản của bạn đã được tạo thành công"+"\n"+"username :"+username+"\n"+
                    "password : "+password+"\n"+"Hãy đổi lại mật khẩu mới để sử dụng web"
                    , "UTF-8");
            Transport.send(msg);
        } catch (MessagingException e) {
            System.out.println(e);
        }
        AccountDBContext accDB = new AccountDBContext();
        Role_AccountDBContext roAccDB = new Role_AccountDBContext();
        int userID=(int)accDB.getIDByUsername(username);
        roAccDB.insert(userID,2);
        response.sendRedirect("../admin/lecturermanage");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
