/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dall.CoursesDB;
import dall.EnrollmentDB;
import jakarta.mail.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Courses;
import model.Enrollment;

/**
 *
 * @author ngoki
 */
public class EnrollmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        CoursesDB cdb = new CoursesDB();
        Courses course = cdb.get(course_id);

        EnrollmentDB edb = new EnrollmentDB();
        int numberOfEnrollment = edb.numberOfEnrollments(course_id);
        request.setAttribute("numberOfEnrollment", numberOfEnrollment);

        request.setAttribute("course", course);
        request.getRequestDispatcher("../view/user/enroll.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        CoursesDB cdb = new CoursesDB();
        Courses course = cdb.get(course_id);

        Enrollment enroll = new Enrollment();
        enroll.setCourse_id(course);
        enroll.setUser_id(acc.getUserid());
        enroll.setStatus("studying");
        EnrollmentDB edb = new EnrollmentDB();
        edb.insert(enroll);
    }

}

