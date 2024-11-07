/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dall.AccountDBContext;
import dall.SignupDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author ngoki
 */
public class LecturerManageController extends HttpServlet {  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<Account> listLecturer = new ArrayList<>();
        AccountDBContext accDB = new AccountDBContext();
        ArrayList<Account> accounts =(ArrayList<Account>) accDB.getAccount();
        for(Account acc : accounts){
            if(acc.getUserType().equals("instructor")){
                listLecturer.add(acc);
            }
        }
        request.setAttribute("listLecturer",listLecturer);
        request.getRequestDispatcher("../view/admin/LecturerManage.jsp").forward(request, response);
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
