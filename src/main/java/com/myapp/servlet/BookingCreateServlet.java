package com.myapp.servlet;

import com.myapp.dao.BookingDAO;
import com.myapp.dao.TransportationDAO;
import com.myapp.model.Booking;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class BookingCreateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int transportationId = Integer.parseInt(request.getParameter("transportation_id"));
            String name = request.getParameter("name");
            String whatsapp = request.getParameter("whatsapp");
            LocalDateTime booking_date = LocalDateTime.now();
            LocalDate start_date = LocalDate.parse(request.getParameter("start_date"));
            LocalDate end_date = LocalDate.parse(request.getParameter("end_date"));

            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = new Booking();
            booking.setTransportationId(transportationId);
            booking.setName(name);
            booking.setWhatsapp(whatsapp);
            booking.setBookingDate(booking_date);
            booking.setStartDate(start_date);
            booking.setEndDate(end_date);

            bookingDAO.create(booking);
            response.sendRedirect(request.getContextPath() + "/booking");

        } catch (Exception e) {
            request.setAttribute("error", "Gagal menyimpan data transportasi " + e.getMessage());

            TransportationDAO transportationDao = new TransportationDAO();
            request.setAttribute("transportations", transportationDao.all());

            request.getRequestDispatcher("/WEB-INF/view/transportation.jsp").forward(request, response);

        }

    }
}
