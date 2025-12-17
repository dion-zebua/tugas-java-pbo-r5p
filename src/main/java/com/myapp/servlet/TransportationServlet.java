package com.myapp.servlet;

import com.myapp.dao.TransportationDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class TransportationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TransportationDAO transportation = new TransportationDAO();

        request.setAttribute("transportations", transportation.all());
        request.getRequestDispatcher("/WEB-INF/view/transportation.jsp").forward(request, response);
    }
}
