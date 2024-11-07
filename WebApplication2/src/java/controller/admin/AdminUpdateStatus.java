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
import org.json.JSONObject;

/**
 *
 * @author ngoki
 */
public class AdminUpdateStatus extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            // Read the request body
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = request.getReader().readLine()) != null) {
                sb.append(line);
            }
            JSONObject jsonRequest = new JSONObject(sb.toString());

            // Extract username and status from the JSON object
            String username = jsonRequest.getString("username");
            String status = jsonRequest.getString("status");

            // Update the status in the database
            AccountDBContext accDB = new AccountDBContext();
            boolean updateResult = accDB.updateStatus(username, status);

            // Prepare the JSON response
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", updateResult);

            out.print(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", false);
            out.print(jsonResponse.toString());
        } finally {
            out.flush();
            out.close();
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
