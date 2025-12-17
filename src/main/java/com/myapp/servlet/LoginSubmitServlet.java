package com.myapp.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

import com.myapp.dao.UserDAO;

public class LoginSubmitServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("email") != null) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserDAO user = new UserDAO();
            boolean valid = user.validateUser(email, password);

            if (valid) {
                session.setAttribute("email", email);

                response.sendRedirect(request.getContextPath() + "/index");

            } else {
                request.setAttribute("error", "Email atau password salah!");
                request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
