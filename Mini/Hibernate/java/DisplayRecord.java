package com.rb.hibernate_major;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

@WebServlet("/DisplayRecord")
public class DisplayRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Retrieving all records from the table
		// Building session factory
		SessionFactory sf = new Configuration().configure().buildSessionFactory();

		// Opening session
		Session session = sf.openSession();

		Query<Student> q = session.createQuery("from Student", Student.class);

		List<Student> resultList = q.list();

		HttpSession hs = request.getSession();

		hs.setAttribute("Student", resultList);

		response.sendRedirect("disp.jsp");
		
		session.close();
		sf.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
