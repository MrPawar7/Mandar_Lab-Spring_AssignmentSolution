<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Save Student</title>
</head>
<body>
	<div class="container">
		<h3 style="text-align: center; background: #007bff; color: white; 
			padding-bottom: 6px; margin-top: 10px; border-radius: 7px;">
			Students Directory</h3>
		<hr>
		<p class="h4 mb-4">Add Student</p>
		<form action="/studentRegistration/students/save" method="POST">
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${Student.id}" />
			<div class="form-inline">
				<input type="text" name="firstname" value="${Student.firstname}"
					class="form-control mb-4 col-4" placeholder="Firstname">
			</div>
			<div class="form-inline">
				<input type="text" name="lastname" value="${Student.lastname}"
					class="form-control mb-4 col-4" placeholder="Lastname">
			</div>
			<div class="form-inline">
				<input type="text" name="course" value="${Student.course}"
					class="form-control mb-4 col-4" placeholder="Course">
			</div>
			<div class="form-inline">

				<input type="text" name="country" value="${Student.country}"
					class="form-control mb-4 col-4" placeholder="Country">
			</div>
			<button type="submit" class="btn btn-info col-2">Save</button>
		</form>
		<hr>
		<a href="/studentRegistration/students/list">Back to Students List</a>
	</div>
</body>

</html>