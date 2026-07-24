
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

h1 {
	font-size: 30px;
}

h2 {
	font-family: 'Courier New', Courier, monospace;
	font-weight: bold;
	letter-spacing: 10px;
	font-size: 30px;
	border-radius: 20px 0px 20px 0px;
	animation-name: bg-color;
	animation-duration: 20s;
	animation-iteration-count: infinite;
	animation-timing-function: linear;
}

@keyframes bg-color {

    0%{
        background-color: black;
        color: yellow;
        box-shadow: 0px 0px 15px white;
    }

    25%{
        background-color: darkred;
        color: white;
        box-shadow: 0px 0px 15px white;
    }

    50%{
        background-color: blueviolet;
        color: bisque;
        box-shadow: 0px 0px 15px deeppink;
    }

    75%{
        background-color: teal;
        color: red;
        box-shadow: 0px 0px 15px blue;
    }

    100%{
        background-color: black;
        color: yellow;
        box-shadow: 0px 0px 15px white;
    }
}
.bg-info {
	background: linear-gradient(135deg, #7F7FD5 0%, #7F7FD5 0% 100%);
}

.title {
	font-size: 80px;
	font-weight: 700;
	letter-spacing: 3px;
	text-transform: uppercase;
	color: #0d6efd;
	text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
}

input:hover {
	box-shadow: 0px 0px 15px darkblue;
}
</style>
</head>

<body>
	<div class="title">
		<h1 class="text-center mt-5 mb-5 fw-1" style="font-size: 50px">Welcome
			to Global Quest Technologies</h1>
	</div>

	<div class="container mt-4">
		<div class="row justify-content-center mt-4">
			<div class="col-md-8  bg-info animate__animated animate__backInRight"
				style="box-shadow: 0px 0px 15px black;">
				<p class="display-6 fw-bold text-center mt-2"
					style="font-family: 'Poppins', sans-serif;">Student
					Registration</p>
				<hr>
				<form action="SaveRecord" method="post">
					<div class="form-floating mb-3 mt-0">
						<input type="text" placeholder="StudentId" id="sid" name="sid"
							class="form-control form-control-sm"> <label for="sid"
							class="form-label">Student Id</label>
					</div>

					<div class="form-floating mb-3 mt-0">
						<input type="text" placeholder="Student Name" id="sname"
							name="sname" class="form-control form-control-sm"> <label
							for="sname" class="form-label">Student Name</label>
					</div>

					<div class="mb-3">
						<select name="gender" class="form-select">
							<option value=" ">Select Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>

					<div class="mb-3">
						<select name="city" class="form-select">
							<option value=" ">Select City</option>
							<option value="Hyderabad">Hyderabad</option>
							<option value="Bengaluru">Bengaluru</option>
							<option value="Chennai">Chennai</option>
							<option value="Pune">Pune</option>
							<option value="Kadapa">Kadapa</option>
							<option value="Ananthpur">Ananthpur</option>
						</select>
					</div>

					<div class="mb-3">
						<select name="course" id="course" class="form-select">
							<option value=" ">Select Course</option>
							<option value="Java Full Stack">Java Full Stack</option>
							<option value="Python Full Stack">Python Full Stack</option>
							<option value="Testing Full Stack">Testing Full Stack</option>
							<option value="MySQL">MySQL</option>
							<option value="Front End Technologies">Front End
								Technologies</option>
							<option value="Data Science">Data Science</option>
							<option value="Data Analytics">Data Analytics</option>
						</select>
					</div>

					<div class="form-floating mb-3">
						<input type="text" placeholder="Amount to pe paid" id="amount"
							name="amount" readonly class=form-control value="0"> <label
							for="amount" class="form-label">Amount to be paid</label>
					</div>

					<div class="mt-4 mb-3 d-grid gap-2"
						style="background: blue; color: white">
						<input type="submit" value="Register" style="color: white"
							class="btn fs-5 fw-bold btn-outline-rounded-4"
							style="letter-spacing: 4px;">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		let amountBox = document.querySelector("#amount");

		let courseBox = document.querySelector("#course");

		courseBox.addEventListener("change", amountToBePaid);

		function amountToBePaid() {

			if (courseBox.value == "Java Full Stack") {
				amountBox.value = 35000
			} else if (courseBox.value == "Python Full Stack") {
				amountBox.value = 40000
			} else if (courseBox.value == "Testing Full Stack") {
				amountBox.value = 25000
			} else if (courseBox.value == "Front End Technologies") {
				amountBox.value = 10000
			} else if (courseBox.value == "Data Science") {
				amountBox.value = 40000
			} else if (courseBox.value == "Data Analytics") {
				amountBox.value = 45000
			} else if (courseBox.value == "MySQL") {
				amountBox.value = 15000;
			} else {
				amountBox.value = 0
			}

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
