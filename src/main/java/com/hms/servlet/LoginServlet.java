package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.util.DBConnection;

public class LoginServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        res.sendRedirect("login.jsp");

    }

    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)

            throws ServletException,
            IOException {

        String username =
                req.getParameter("username");

        String password =
                req.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT * FROM users WHERE username=? AND password=?"

                    );

            ps.setString(1, username);

            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                HttpSession session =
                        req.getSession();

                session.setAttribute(
                        "username",
                        username
                );

                res.sendRedirect(
                        "dashboard.jsp"
                );

            } else {

                res.sendRedirect(
                        "login.jsp?error=1"
                );

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

    }

}