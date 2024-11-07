/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import controller.authentication.BaseRBACController;
import dall.CoursesDB;
import model.Courses;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author
 */
public class HomeController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CoursesDB db = new CoursesDB();
        ArrayList<Courses> courses = db.getTopCourses(3);
        request.setAttribute("courses", courses);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        if (acc == null) {
            request.getRequestDispatcher("../view/user/homePage.jsp").forward(request, response);
        } else {
            if (acc.getUserType().equals("student")) {
                request.getRequestDispatcher("../view/user/homePage.jsp").forward(request, response);
            } else {
                response.getWriter().print("access denied");
            }
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
}
