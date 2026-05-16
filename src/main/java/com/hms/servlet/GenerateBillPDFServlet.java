package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.util.DBConnection;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class GenerateBillPDFServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        res.setContentType(
                "application/pdf"
        );

        try {

            Document document =
                    new Document();

            PdfWriter.getInstance(
                    document,
                    res.getOutputStream()
            );

            document.open();

            document.add(
            new Paragraph(
            "HOSPITAL MANAGEMENT SYSTEM"
            ));

            document.add(
            new Paragraph(
            "Billing Report"
            ));

            document.add(
            new Paragraph(
            "--------------------------------"
            ));

            Connection con =
                    DBConnection.getConnection();

            Statement st =
                    con.createStatement();

            ResultSet rs =
                    st.executeQuery(
                    "SELECT * FROM bills"
                    );

            while(rs.next()) {

                document.add(
                new Paragraph(

                "Bill ID: "
                + rs.getInt("id")

                + " | Patient ID: "
                + rs.getInt("patient_id")

                + " | Total Amount: Rs."
                + rs.getDouble("total_amount")

                ));

            }

            document.close();

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}