package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

public class AddDoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");

        String specialization =
                req.getParameter("specialization");

        String contact =
                req.getParameter("phone");

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(

                "INSERT INTO doctors(name, specialization, phone) VALUES(?,?,?)"

            );

            ps.setString(1, name);

            ps.setString(2, specialization);

            ps.setString(3,contact);

            ps.executeUpdate();

            res.sendRedirect("doctorSuccess.jsp");

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}