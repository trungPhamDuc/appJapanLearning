/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import controller.authentication.BaseRBACController;
import dall.AccountDBContext;
import dall.CoursesDB;
import dall.EnrollmentDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Courses;
import model.Role;


public class AdminHome extends BaseRBACController {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<Integer> counts = new ArrayList<>();
        AccountDBContext accDb = new AccountDBContext();
        CoursesDB couDb = new CoursesDB();
        EnrollmentDB enDB = new EnrollmentDB();
        List<Courses> courses = couDb.getAllCourses();
        int countCou = couDb.Count();
        int countLec = accDb.countUser("instructor");
        int countUser = accDb.countUser("student");
        request.setAttribute("countCou", countCou);
        request.setAttribute("countLecturer", countLec);
        request.setAttribute("countUser", countUser);
        request.setAttribute("courses", courses);
        for(Courses c : courses){
            int a= enDB.countBYCourID(c.getCourse_id());
            counts.add(a);            
        }
        request.setAttribute("counts", counts);
        request.getRequestDispatcher("../view/admin/homeUser.jsp").forward(request, response);
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
