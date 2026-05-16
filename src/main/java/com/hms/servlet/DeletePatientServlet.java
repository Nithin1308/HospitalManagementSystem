package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

public class DeletePatientServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        int id =
        Integer.parseInt(
            req.getParameter("id")
        );

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                "DELETE FROM patients WHERE id=?"

                    );

            ps.setInt(1, id);

            ps.executeUpdate();

            res.sendRedirect(
                    "viewPatients.jsp"
            );

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}