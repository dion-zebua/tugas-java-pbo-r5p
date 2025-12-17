package com.myapp.servlet;

import com.myapp.dao.TransportationDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class TransportationDestroyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);

                TransportationDAO dao = new TransportationDAO();
                dao.delete(id);

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/transportation");
    }
}
