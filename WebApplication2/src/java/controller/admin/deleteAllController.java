/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dall.AccountDBContext;
import dall.RoleDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class deleteAllController extends HttpServlet {
       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDBContext accDB = new AccountDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        String [] listSelect = request.getParameterValues("selectedItems");
        for (String name : listSelect) {           
            int userID = accDB.getIDByUsername(name);
            roleDB.DeleteRoleAccount(userID);
            accDB.DeleteAccount(name);
        }
        request.getRequestDispatcher("../admin/lecturermanage").forward(request, response);
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
