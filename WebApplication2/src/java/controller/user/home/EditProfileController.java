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
public class EditProfileController extends HttpServlet {
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

        int id = Integer.parseInt(request.getParameter("id"));

        AccountDBContext tbla = new AccountDBContext();

        Account tba = new Account();
        tba = tbla.getAccountByIDs(id);
        

        String phone = tba.getPhone();
        String name = tba.getUsername();
        Boolean gender = tba.getGender();
        String password = tba.getPassword();
        request.setAttribute("id", id);
        request.setAttribute("phone", phone);
        request.setAttribute("name", name);
        request.setAttribute("gender", gender);
        request.setAttribute("password", password);
        request.getRequestDispatcher("/view/user/editprofile.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("usersID"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String password = request.getParameter("password");
        Account a = new Account();
        a.setUsername(name);
        a.setPhone(phone);
        a.setGender(gender);
        a.setUserid(id);
        a.setPassword(password);
        HttpSession session = request.getSession(false);
        Account acc =(Account) session.getAttribute("account");
        a.setUserType(acc.getUserType());
        Integer useid = (Integer) acc.getUserid();
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
        
        a.setAvatar(img);
        session.setAttribute("account",a);
        tbla.updateAvatar(img, useid);
        AccountDBContext tbladb = new AccountDBContext();
        tbladb.UpdateProfile(a);
        request.setAttribute("id", id);
        response.sendRedirect("profile?id=" + id);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
