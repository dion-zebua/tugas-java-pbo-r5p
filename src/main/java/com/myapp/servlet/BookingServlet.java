package com.myapp.servlet;

import com.myapp.dao.BookingDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingDAO booking = new BookingDAO();

        request.setAttribute("bookings", booking.all());
        request.getRequestDispatcher("/WEB-INF/view/booking.jsp").forward(request, response);
    }
}
