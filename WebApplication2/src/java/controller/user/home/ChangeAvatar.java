/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.home;

import dall.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.Account;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class ChangeAvatar extends HttpServlet {

    private static final String UPLOAD_DIR = "/view/user/img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc =(Account) session.getAttribute("account");
        Integer id = (Integer) acc.getUserid();
        request.setAttribute("id", id);
        request.getRequestDispatcher("/view/user/avatar.jsp").forward(request, response);

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Account acc =(Account) session.getAttribute("account");
        Integer id = (Integer) acc.getUserid();
        Part imagePart = request.getPart("profileImage");
        String mess = null;
        String img = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

            File uploadDirFile = new File(uploadPath);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            String filePath = Paths.get(uploadPath, fileName).toString();
            try {
                imagePart.write(filePath);
                img = UPLOAD_DIR + "/" + fileName;
                mess = "Luu hoan tat";
            } catch (IOException e) {
                e.printStackTrace();
                mess = "Luu ko tat";
                throw new ServletException("File upload failed!", e);
            }

        }
        AccountDBContext tbla = new AccountDBContext();
        Account account = new Account();
        account.setAvatar(img);
        tbla.updateAvatar(img, id);
        
        request.setAttribute("id", id);
        request.setAttribute("img", img);       
        request.getRequestDispatcher("/view/user/avatar.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
