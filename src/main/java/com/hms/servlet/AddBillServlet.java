package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

public class AddBillServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        try {

            int patientId =
            Integer.parseInt(
                req.getParameter("patient_id")
            );

            double consultationFee =
            Double.parseDouble(
                req.getParameter("consultation_fee")
            );

            double medicineCharge =
            Double.parseDouble(
                req.getParameter("medicine_charge")
            );

            String status =
                    req.getParameter("status");

            // NULL SAFETY

            if(status == null){

                status = "Pending";

            }

            double totalAmount =
                    consultationFee +
                    medicineCharge;

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "INSERT INTO bills(patient_id, consultation_fee, medicine_charge, total_amount, status) VALUES(?,?,?,?,?)"

                    );

            ps.setInt(1, patientId);

            ps.setDouble(2,
                    consultationFee);

            ps.setDouble(3,
                    medicineCharge);

            ps.setDouble(4,
                    totalAmount);

            ps.setString(5,
                    status);

            int i = ps.executeUpdate();

            if(i > 0){

                res.sendRedirect(
                        "viewBills.jsp"
                );

            } else {

                res.getWriter().println(
                        "Bill Not Generated"
                );

            }

        } catch(Exception e) {

            res.getWriter().println(e);

            e.printStackTrace();

        }
    }
}