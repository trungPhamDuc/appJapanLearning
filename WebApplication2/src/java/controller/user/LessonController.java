/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dall.CoursesDB;
import dall.LessonDB;
import dall.ProgressDB;
import model.Lessons;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Courses;
import model.Progress;

public class LessonController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        LessonDB db = new LessonDB();
        ArrayList<Lessons> lessons = db.getLessonByCourseID(course_id);
        CoursesDB cdb = new CoursesDB();
        Courses course = cdb.get(course_id);
        request.setAttribute("lessons", lessons);
        request.setAttribute("course", course);
        request.getRequestDispatcher("../view/user/lessons.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
//        int lesson_id = Integer.parseInt(request.getParameter("lesson_id"));
//        String flashcard = request.getParameter("flashcard");
//        String quiz = request.getParameter("quiz");
//        String video = request.getParameter("video");
//        if (flashcard == null) {
//            flashcard = "0";
//        }
//        if (quiz == null) {
//            quiz = "0";
//        }
//        if (video == null) {
//            video = "0";
//        }
//        //Update status
        ProgressDB p = new ProgressDB();
//        Progress progress = new Progress();
//        progress.setCourse_id(course_id);
//        progress.setLesson_id(lesson_id);
//        progress.setVideo_complete(Boolean.parseBoolean(video));
//        progress.setFlashcard_complete(Boolean.parseBoolean(flashcard));
//        progress.setQuiz_complete(Boolean.parseBoolean(quiz));

        //Get progress 
        Gson gson = new Gson();
        JsonArray jsonArray = new JsonArray();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        boolean isLogin = (acc != null);

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("isLogin", isLogin);
        if (isLogin) {
            int user_id = acc.getUserid();
            ArrayList<Progress> progressList = p.getProgress(course_id, user_id);
            for (Progress i : progressList) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("video", i.getVideo_complete());
                jsonObject.addProperty("flashcard", i.getFlashcard_complete());
                jsonObject.addProperty("quiz", i.getQuiz_complete());
                jsonArray.add(jsonObject);
            }
            jsonResponse.add("progress", jsonArray);
        } 

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

}

