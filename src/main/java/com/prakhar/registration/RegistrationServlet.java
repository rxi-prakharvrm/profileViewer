package com.prakhar.registration;

import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pass");
		String profession = request.getParameter("profession");
		String location = request.getParameter("location");
		String github = request.getParameter("github");
		String linkedin = request.getParameter("linkedin");
		
		RequestDispatcher dispatcher = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginpage?useSSL=false", "root", "bOLt$4$2002@");
			
			PreparedStatement pstCheck = conn.prepareStatement("SELECT * FROM students WHERE email=?");
	        pstCheck.setString(1, email);
	        ResultSet rsCheck = pstCheck.executeQuery();

	        if (rsCheck.next()) {
	            // User already exists, redirect to login.jsp
	        	request.setAttribute("status", "error");
	        	request.getRequestDispatcher("registration.jsp").forward(request, response);
			} else {
			
			
				PreparedStatement pst = conn.prepareStatement("INSERT INTO students (name, email, pwd, profession, location, github, linkedin) VALUES (?, ?, ?, ?, ?, ?, ?)");
				
				pst.setString(1, name);
				pst.setString(2, email);
				pst.setString(3, pwd);
				pst.setString(4, profession);
				pst.setString(5, location);
				pst.setString(6, github);
				pst.setString(7, linkedin);
				
				int rowCount = pst.executeUpdate();
				
				dispatcher = request.getRequestDispatcher("registration.jsp");
				if(rowCount > 0) {
					request.setAttribute("status", "success");
				} else {
					request.setAttribute("status", "failed");
				}
				
				dispatcher.forward(request, response);
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
