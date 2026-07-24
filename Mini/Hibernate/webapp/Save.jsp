<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

<style>
body {
	background-color: lightblue;
}

.action-btn {
	width: 220px;
	height: 60px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 18px;
	border: 2px solid black;
	border-radius: 12px;
	text-decoration: none;
	box-shadow: 0px 0px 15px black;
}

.form {
	display: flex;
}

p {
	color: darkblue;
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	
}
</style>
</head>

<body>
	<p class="display-2 text-center m-5">Student Registered
		Successfully!!</p>

	<div class="d-flex justify-content-center gap-4 mt-4">

		<a href="index.jsp" class="btn btn-danger action-btn"> Add New
			Student </a>

		<form action="DisplayRecord">
			<button type="submit" class="btn btn-danger action-btn">
				Display Students Info</button>
		</form>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>