package com.myapp.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;


public class LogoutSubmitServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/index");
    }
}
