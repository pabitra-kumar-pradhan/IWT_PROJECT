package com.backend;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ComplainServlet")
public class ComplainServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full_name");
        String sic = request.getParameter("sic");
        String topic = request.getParameter("topic");
        String description = request.getParameter("description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/campus_db",
                "root",
                "Pabitra2458#"
            );

            String query = "INSERT INTO complain(full_name, sic, topic, description) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, fullName);
            ps.setString(2, sic);
            ps.setString(3, topic);
            ps.setString(4, description);

            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}