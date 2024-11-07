/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dall.AccountDBContext;
import dall.CoursesDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Courses;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        CoursesDB couDb =new CoursesDB();
        Account account = db.getAccountByUserPass(username, password);
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            String userType = db.getuserType(username);
            if (userType.equals("admin")) {
                response.sendRedirect("/SWP391_Group6/admin/home");
            } else if (userType.equals("student") && account.getStatus().equals("active")) {
                response.sendRedirect("/SWP391_Group6/user/home");
            } else if (userType.equals("instructor") && account.getStatus().equals("active")) {
                if (password.equals("123")) {
                    response.sendRedirect("view/authentication/forgotpass.jsp");
                } else {
                    response.sendRedirect("/SWP391_Group6/lecturer/course");
                }
            }
        } else {
            request.getRequestDispatcher("view/authentication/loginFail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
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
