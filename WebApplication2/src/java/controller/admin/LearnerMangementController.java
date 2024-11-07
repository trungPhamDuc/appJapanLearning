/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dall.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author ngoki
 */
public class LearnerMangementController extends HttpServlet {  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDBContext accDB  = new AccountDBContext();
        ArrayList<Account> accounts = (ArrayList<Account>) accDB.getAccount();
        ArrayList<Account> listLearner = new ArrayList<>();
        for (Account acc : accounts){
            if(acc.getUserType().equals("student")){
                listLearner.add(acc);
            }
        }
        request.setAttribute("listLearner", listLearner);
        request.getRequestDispatcher("../view/admin/studentmanage.jsp").forward(request, response);
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
