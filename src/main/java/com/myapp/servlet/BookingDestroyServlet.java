package com.myapp.servlet;

import com.myapp.dao.BookingDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class BookingDestroyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);

                BookingDAO dao = new BookingDAO();
                dao.delete(id);

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/booking");
    }
}
