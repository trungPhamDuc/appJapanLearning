package controller.user;

import dall.EnrollmentDB;
import dall.ProgressDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Courses;
import model.Enrollment;
import model.Progress;

public class ProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        int progress = Integer.parseInt(request.getParameter("value"));
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        int user_id = acc.getUserid();
        Enrollment e = new Enrollment();

        Courses c = new Courses();
        c.setCourse_id(course_id);

        e.setCourse_id(c);
        e.setProgress(progress);
        e.setUser_id(user_id);

        EnrollmentDB edb = new EnrollmentDB();
        edb.update(e);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        int lesson_id = Integer.parseInt(request.getParameter("lesson_id"));
        
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        int user_id = acc.getUserid();
        
        Boolean flashcard = null, video = null, quiz = null;

        try {
            if (request.getParameter("flashcard") != null) {
                flashcard = Boolean.parseBoolean(request.getParameter("flashcard"));
            }
            if (request.getParameter("quiz") != null) {
                quiz = Boolean.parseBoolean(request.getParameter("quiz"));
            }
            if (request.getParameter("video") != null) {
                video = Boolean.parseBoolean(request.getParameter("video"));
            }
        } catch (Exception e) {
            // Handle exception
        }

        // Update status
        ProgressDB p = new ProgressDB();
        ArrayList<Progress> progressList = p.getProgress(course_id, user_id);
        Progress progress = null;

        for (Progress i : progressList) {
            if (i.getCourse_id() == course_id
                    && i.getLesson_id() == lesson_id
                    && i.getUser_id() == user_id) {
                progress = i;
                break;
            }
        }

        if (progress == null) {
            progress = new Progress();
            progress.setUser_id(user_id);
            progress.setCourse_id(course_id);
            progress.setLesson_id(lesson_id);
            progress.setFlashcard_complete(flashcard);
            progress.setQuiz_complete(quiz);
            progress.setVideo_complete(video);

            p.insert(progress);
        } else {
            if (flashcard != null) {
                progress.setFlashcard_complete(flashcard);
            }
            if (quiz != null) {
                progress.setQuiz_complete(quiz);
            }
            if (video != null) {
                progress.setVideo_complete(video);
            }

            p.update(progress);
        }
    }
}

