/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import dall.LessonDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Lessons;

/**
 *
 * @author 
 */
public class LessonControllerServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lesson_id = Integer.parseInt(request.getParameter("lessonid"));
        int course_id = Integer.parseInt(request.getParameter("courseid"));
        String course_name = request.getParameter("coursename");
        LessonDB db = new LessonDB();
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            db.deleteLesson(lesson_id);
        }
        if (action != null && action.equals("update")) {
            String lesson_name = request.getParameter("lesson_name");
            String lesson_description = request.getParameter("lesson_description");
            db.updateLesson(lesson_id, lesson_name,lesson_description);
        }

        List<Lessons> lessonByCourse = db.getLessonByCourseID(course_id);

        request.setAttribute("coursename", course_name);
        request.setAttribute("courseid", course_id);

        request.setAttribute("lessonByCourse", lessonByCourse);
        request.getRequestDispatcher("../view/lecturer/Lesson.jsp").forward(request, response);

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         LessonDB db = new LessonDB();
        int course_id = Integer.parseInt(request.getParameter("courseid"));
        String course_name = request.getParameter("coursename");
        List<Lessons> lessonByCourse = db.getLessonByCourseID(course_id);

        request.setAttribute("coursename", course_name);
        request.setAttribute("courseid", course_id);

        request.setAttribute("lessonByCourse", lessonByCourse);
        request.getRequestDispatcher("../view/lecturer/Lesson.jsp").forward(request, response);

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

