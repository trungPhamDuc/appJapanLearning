/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dall.CoursesDB;
import dall.StudentCouDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Courses;
import model.StudentCourse;

/**
 *
 * @author ngoki
 */
public class CheckPopularCourse extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StudentCouDBContext stuDb =new StudentCouDBContext();
        ArrayList<StudentCourse> studentcous =(ArrayList<StudentCourse>) stuDb.getStudentEnrollmentCourse();
        request.setAttribute("studentcous", studentcous);
        CoursesDB cou = new CoursesDB();
        List<Courses> courses = cou.getAllCourses();
        request.setAttribute("courses", courses);
        ArrayList<String> usernames = new ArrayList<>();
        for (StudentCourse stc : studentcous) {
            if(!usernames.contains(stc.getAccount().getUsername())){
                usernames.add(stc.getAccount().getUsername());
            }
        }
        request.setAttribute("usernames", usernames);
        request.getRequestDispatcher("../view/admin/checkpopular.jsp").forward(request, response);
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
