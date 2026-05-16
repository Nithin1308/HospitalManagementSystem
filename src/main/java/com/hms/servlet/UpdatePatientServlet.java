package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

public class UpdatePatientServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        int id =
        Integer.parseInt(
            req.getParameter("id")
        );

        String name =
                req.getParameter("name");

        int age =
        Integer.parseInt(
            req.getParameter("age")
        );

        String gender =
                req.getParameter("gender");

        String contact =
                req.getParameter("contact");

        String disease =
                req.getParameter("disease");

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "UPDATE patients SET name=?, age=?, gender=?, contact=?, disease=? WHERE id=?"

                    );

            ps.setString(1, name);

            ps.setInt(2, age);

            ps.setString(3, gender);

            ps.setString(4, contact);

            ps.setString(5, disease);

            ps.setInt(6, id);

            ps.executeUpdate();

            res.sendRedirect(
                    "viewPatients.jsp"
            );

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}