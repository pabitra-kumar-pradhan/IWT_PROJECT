package com.backend;


import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LostandfoundServlet")
public class LostandfoundServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full_name");
        String sic = request.getParameter("sic");
        String itemName = request.getParameter("item_name");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/campus_db",
                "root",
                "Pabitra2458#"
            );

            String query = "INSERT INTO lost_found(full_name, sic, item_name, description, status) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, fullName);
            ps.setString(2, sic);
            ps.setString(3, itemName);
            ps.setString(4, description);
            ps.setString(5, status);

            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}