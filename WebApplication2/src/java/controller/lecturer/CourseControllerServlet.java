/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;


import controller.authentication.BaseRBACController;
import dall.CoursesDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Courses;
import model.Role;

/**
 *
 * @author 
 */
public class CourseControllerServlet extends BaseRBACController {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        CoursesDB db = new CoursesDB();
        List<Courses> courses = db.getAllCourses();
        req.setAttribute("courses", courses);
        HttpSession session = req.getSession();
        Account acc =(Account) session.getAttribute("account");
        if(acc.getPassword().equals("123")){
            resp.sendRedirect("../view/authentication/forgotpass.jsp");
        } else{
            req.getRequestDispatcher("../view/lecturer/Course.jsp").forward(req, resp);
        }        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String course_name = req.getParameter("course_name");
        String course_description = req.getParameter("course_description");
        CoursesDB db = new CoursesDB();

        db.insertCourse(course_name, course_description);

        doGet(req, resp);
    }

}

