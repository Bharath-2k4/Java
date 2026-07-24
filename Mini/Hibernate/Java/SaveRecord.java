package com.rb.hibernate_major;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@WebServlet("/SaveRecord")
public class SaveRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sid =  Integer.parseInt(request.getParameter("sid"));
		String name = request.getParameter("sname");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		String course = request.getParameter("course");
		float amount = Float.parseFloat(request.getParameter("amount"));

		// Sending data to entity class
		Student s = new Student();
		s.setStudentId(sid);
		s.setStudentName(name);
		s.setStudentGender(gender);
		s.setStudentCity(city);
		s.setStudentCourse(course);
		s.setStudentAmount(amount);

		// Storing student object into table
		SessionFactory sf = new Configuration().configure().buildSessionFactory();

		// Opening session
		Session session = sf.openSession();

		// Begining transacation
		session.beginTransaction();

		// Saving the entity
		session.save(s);

		// Commiting the transactions
		session.getTransaction().commit();

		// Closing the transactions
		session.close();

		// Loading save.jsp
		response.sendRedirect("Save.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
