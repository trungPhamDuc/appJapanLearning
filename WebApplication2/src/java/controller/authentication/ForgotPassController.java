package controller.authentication;

import dall.AccountDBContext;
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
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class ForgotPassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String otp = request.getParameter("otp");       
        AccountDBContext accDB = new AccountDBContext();
        String token = accDB.getTokenByUsername(username);
        if(otp.equals(token)){
            response.sendRedirect("view/authentication/newpass.jsp");
        } else{
            request.getRequestDispatcher("view/authentication/OTPFail.jsp").forward(request, response);
        }       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        AccountDBContext accDB = new AccountDBContext();
        final String from = "quancvhe176299@fpt.edu.vn";
        final String password = "ddyq lqsl hndq lucd";
        HttpSession sec = request.getSession();
        sec.setAttribute("username", username);
        Random random = new Random();
        String number = String.format("%06d", random.nextInt(900000) + 100000);

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };
        Session session = Session.getInstance(properties, auth);
        String to =  accDB.getEmailByUser(username);
        response.getWriter().print(to);
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Send OTP");
            msg.setSentDate(new Date());
            msg.setText("ma cua ban la : " + number, "UTF-8");
            Transport.send(msg);
        } catch (MessagingException e) {
            System.out.println(e);
        }
        accDB.updateToken(username, number);
        response.sendRedirect("view/authentication/OTP.jsp");
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
