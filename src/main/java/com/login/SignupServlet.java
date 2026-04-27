package com.login;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/campus_db";
    private static final String USER = "root";
    private static final String PASSWORD = "Pabitra2458#";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String sic = request.getParameter("sic");
        String password = request.getParameter("password");

        System.out.println("Signup Servlet HIT");



        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            // 🔥 2. Check if SIC already exists
            String checkQuery = "SELECT * FROM users WHERE sic=?";
            PreparedStatement checkPs = con.prepareStatement(checkQuery);
            checkPs.setString(1, sic);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                // ❌ User already exists
                response.getWriter().println("User with this SIC already exists!");
                return;
            }

            // 🔥 3. Insert new user
            String insertQuery = "INSERT INTO users (sic, full_name, password) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(insertQuery);

            ps.setString(1, sic);
            ps.setString(2, fullname);
            ps.setString(3, password);

            int result = ps.executeUpdate();

            if (result > 0) {
                // ✅ Success
                response.sendRedirect(request.getContextPath() + "/login.html");
            } else {
                response.getWriter().println("Signup Failed");
            }

            // 🔹 Close
            rs.close();
            checkPs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        }
    }


}