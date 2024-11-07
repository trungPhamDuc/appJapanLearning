package controller.authentication;

import dall.AccountDBContext;
import dall.Role_AccountDBContext;
import dall.SignupDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SignUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String usertype = request.getParameter("role");
        String genderParam = request.getParameter("gender");
        boolean gender = false;
        if (genderParam != null && genderParam.equals("1")) {
            gender = true;
        }
        AccountDBContext accDB = new AccountDBContext();
        ArrayList<String> arr = (ArrayList<String>) accDB.selectUser();
        for (int i = 0; i < arr.size(); i++) {
            if (arr.get(i).equals(username)) {
                response.getWriter().print("username already exits");
            } else {
                SignupDBContext signDB = new SignupDBContext();
                signDB.updateAccountInDB(username, password, email, phone, usertype, gender,"active");                
            }
        }
        Role_AccountDBContext roAccDB = new Role_AccountDBContext();
        int userID=(int)accDB.getIDByUsername(username);
        roAccDB.insert(userID,1);
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/signup.jsp").forward(request, response);
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
