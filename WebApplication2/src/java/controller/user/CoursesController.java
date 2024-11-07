package controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dall.CoursesDB;
import dall.EnrollmentDB;
import model.Courses;
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
import model.Enrollment;

/**
 *
 * @author
 */
public class CoursesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CoursesDB cdb = new CoursesDB();
        ArrayList<Courses> courses = cdb.getCourses(0);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        EnrollmentDB edb = new EnrollmentDB();
        ArrayList<Enrollment> enrollmentCourse = null;
        if (acc != null) {
            enrollmentCourse = edb.getEnrollmentCourse(acc.getUserid());
        }

        request.setAttribute("courses", courses);
        request.setAttribute("enrollmentCourse", enrollmentCourse);
        request.getRequestDispatcher("../view/user/courses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CoursesDB cdb = new CoursesDB();
        ArrayList<Courses> courses = null;
        if (action.equals("search")) {
            String txtSearch = request.getParameter("txt");
            courses = cdb.searchCourse(txtSearch);
        } else if (action.equals("get")) {
            int total = Integer.parseInt(request.getParameter("total"));
            courses = cdb.getCourses(total);
        }
        courses.removeIf(course -> course == null);
        Gson gson = new Gson();
        JsonObject jsonObj = new JsonObject();

        String jsonCourses = gson.toJson(courses);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        ArrayList<Enrollment> enrollmentCourse = null;

        if (acc != null) {
            EnrollmentDB edb = new EnrollmentDB();
            enrollmentCourse = edb.getEnrollmentCourse(acc.getUserid());
            String jsonEnroll = gson.toJson(enrollmentCourse);
            jsonObj.add("enrollmentCourse", JsonParser.parseString(jsonEnroll));
        }

        jsonObj.add("courses", JsonParser.parseString(jsonCourses));
        // Set content type and write JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObj.toString());

    }

}

