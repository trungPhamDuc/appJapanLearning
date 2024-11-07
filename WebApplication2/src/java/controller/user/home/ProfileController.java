/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.home;

import dall.AccountDBContext;
import dall.EnrollmentDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Enrollment;

public class ProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);
        AccountDBContext tbla = new AccountDBContext();
        EnrollmentDB edb = new EnrollmentDB();
        ArrayList<Enrollment> list = new ArrayList<>();

        list = edb.GetProgeressByID(id);
        String email = "";
        String phone = "";
        String name = "";
        String avatar = "";
        Boolean gender = null;

        if (session != null) {
            Account acc = (Account) session.getAttribute("account");
            Integer userID = (Integer) acc.getUserid();

            if (userID != null && userID.equals(id)) {

                Account account = (Account) tbla.getAccountByIDs(id);
                email = account.getEmail();
                phone = account.getPhone();
                name = account.getUsername();
                avatar = account.getAvatar();
                gender = account.getGender();

            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acess Denied");
                return;
            }

        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Plase login");
        }
        request.setAttribute("list", list);
        request.setAttribute("id", id);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("name", name);
        request.setAttribute("avatar", avatar);
        request.setAttribute("gender", gender);
        request.getRequestDispatcher("/view/user/information.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

