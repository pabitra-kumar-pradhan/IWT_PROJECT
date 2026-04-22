package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Servlet HIT");
		String sic=request.getParameter("sic");
		String pass=request.getParameter("password");
		System.out.println("SIC: " + sic);
		System.out.println("PASS: " + pass);
		if ("24BCSH28".equals(sic) && "abc".equals(pass))
		{
			HttpSession session=request.getSession();
			session.setAttribute("sic",sic);
			response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
		}
		else
		{
			response.sendRedirect("login.html");
		}
		
	}


}
