package com.myapp.servlet;

import com.myapp.dao.TransportationDAO;
import com.myapp.model.Transportation;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class TransportationCreateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String model = request.getParameter("model");
            String type = request.getParameter("type");
            String plate = request.getParameter("plate");
            int pricePerDay = Integer.parseInt(request.getParameter("price_per_day"));

            TransportationDAO transportationDao = new TransportationDAO();
            Transportation transportation = new Transportation();
            transportation.setModel(model);
            transportation.setType(type);
            transportation.setPlate(plate);
            transportation.setPricePerDay(pricePerDay);

            transportationDao.create(transportation);
            response.sendRedirect(request.getContextPath() + "/transportation");

        } catch (Exception e) {
            request.setAttribute("error", "Gagal menyimpan data transportasi" + e.getMessage());

            TransportationDAO transportationDao = new TransportationDAO();
            request.setAttribute("transportations", transportationDao.all());

            request.getRequestDispatcher("/WEB-INF/view/transportation.jsp").forward(request, response);

        }

    }
}
