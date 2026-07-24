<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
a {
	box-shadow: 0px 0px 15px black;
}

.yo{
    margin: 20px auto;
    width: 97%;
}

</style>
</head>
<body>

	<%@ page
		import="java.util.List, java.util.Iterator, com.rb.hibernate_major.Student"%>
	<% List slist = (List)session.getAttribute("Student"); %>
	<h1 style="text-align: center; margin-top: 20px; font-size:60px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; ">Student Database</h1>
	<div class = "yo">
	<table class="table table-bordered table-hover mb-5">
		<thead class="table-dark text-center fs-3">
			<tr>
				<th>Student Id</th>
				<th>Student Name</th>
				<th>Gender</th>
				<th>City</th>
				<th>Course</th>
				<th>Amount</th>
			</tr>
		</thead>

		<tbody style="font-size: 17px;">
			<% 
			Iterator itr = slist.iterator();
			while(itr.hasNext()){
				Student s1 = (Student)itr.next();
				out.println("<tr>"+
											"<td>"+s1.getStudentId()+"</td>"+
										    "<td>"+s1.getStudentName()+"</td>"+
											"<td>"+s1.getStudentGender()+"</td>"+
											"<td>"+s1.getStudentCity()+"</td>"+
											"<td>"+s1.getStudentCourse()+"</td>"+
											"<td>"+s1.getStudentAmount()+"</td>"+
									"</tr>");
			}
			%>
		</tbody>
	</table>
	</div>
	<a href="index.jsp"
		class="bg-success text-white fs-5 p-3 rounded-4 m-5 text-decoration-none">back</a>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>