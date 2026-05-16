package com.hms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

public class AddAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        PrintWriter out = res.getWriter();

        try {

            String patient =
                    req.getParameter("patient_id");

            String doctor =
                    req.getParameter("doctor_id");

            String date =
                    req.getParameter("appointment_date");

            String time =
                    req.getParameter("appointment_time");

            out.println("Patient ID: " + patient);
            out.println("<br>");

            out.println("Doctor ID: " + doctor);
            out.println("<br>");

            int patientId =
                    Integer.parseInt(patient);

            int doctorId =
                    Integer.parseInt(doctor);

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                "INSERT INTO appointments(patient_id, doctor_id, appointment_date, appointment_time) VALUES(?,?,?,?)"

            );

            ps.setInt(1, patientId);

            ps.setInt(2, doctorId);

            ps.setString(3, date);

            ps.setString(4, time);

            int i = ps.executeUpdate();

            if(i > 0) {

            	res.sendRedirect("success.jsp?msg=success");

            } else {

                out.println("<h2>Appointment Not Added</h2>");

            }

        } catch(Exception e) {

            out.println("<h2>ERROR:</h2>");

            out.println(e);

            e.printStackTrace();

        }
    }
}