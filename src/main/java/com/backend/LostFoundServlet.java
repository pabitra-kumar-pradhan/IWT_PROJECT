package com.backend;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LostFoundServlet")
public class LostFoundServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/campus_db";
    private static final String USER = "root";
    private static final String PASSWORD = "Pabitra2458#";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String item_name = request.getParameter("item_name");
        String description = request.getParameter("description");
        String type = request.getParameter("type");

        HttpSession session = request.getSession();
        String sic = (String) session.getAttribute("sic");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            String query = "INSERT INTO lost_found (sic, item_name, description, type) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, sic);
            ps.setString(2, item_name);
            ps.setString(3, description);
            ps.setString(4, type);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("lostfound.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}