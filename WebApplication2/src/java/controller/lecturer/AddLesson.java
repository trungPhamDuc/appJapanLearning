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
public class AddLesson extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int course_id = Integer.parseInt(request.getParameter("courseid"));
        String course_name = request.getParameter("coursename");
        String lesson_name = request.getParameter("lesson_name");
        LessonDB db = new LessonDB();
        db.insertLesson(course_id, lesson_name);

        List<Lessons> lessonByCourse = db.getLessonByCourseID(course_id);

        request.setAttribute("coursename", course_name);
        request.setAttribute("courseid", course_id);

        request.setAttribute("lessonByCourse", lessonByCourse);
        request.getRequestDispatcher("../view/lecturer/Lesson.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

