package com.myapp.servlet;

import com.myapp.dao.BookingDAO;
import com.myapp.dao.TransportationDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TransportationDAO transportation = new TransportationDAO();
        BookingDAO booking = new BookingDAO();

        request.setAttribute("totalTransportations", transportation.getCount());
        request.setAttribute("totalBookings", booking.getCount());
        request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
    }
}
