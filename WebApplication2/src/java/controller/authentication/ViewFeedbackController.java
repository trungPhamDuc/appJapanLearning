/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import dall.GuestDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Guest;

/**
 *
 * @author ngoki
 */
public class ViewFeedbackController extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        GuestDBContext guestDB = new GuestDBContext();
        ArrayList<Guest> guests =(ArrayList<Guest>) guestDB.getGuest();
        request.setAttribute("guests", guests);
        request.getRequestDispatcher("../view/admin/viewFeedback.jsp").forward(request, response);       
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
