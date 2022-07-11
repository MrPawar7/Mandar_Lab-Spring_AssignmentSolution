<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<title>Students Directory</title>
</head>
<body>
	<div class="container">
		<h3	style="text-align: center; background: #007bff; color: white; 
			padding-bottom: 6px; margin-top: 10px; border-radius: 7px;">
			Student Directory</h3>
		<hr>
		<!-- Add a search form -->
		<form action="/studentRegistration/students/search"
			class="form-inline">
			<!-- Add a button -->
			<a href="/studentRegistration/students/showFormForAdd"
				class="btn btn-primary btn-sm mb-3"> Add Student </a> <input
				type="search" name="firstname" placeholder="Firstname"
				class="form-control-sm ml-5 mr-2 mb-3" /> <input type="search"
				name="course" placeholder="Course" class="form-control-sm mr-2 mb-3" />

			<button type="submit" class="btn btn-success btn-sm mb-3">Search</button>
			<a href="/studentRegistration/logout"
				class="btn btn-primary btn-sm mb-3 mx-auto" style="margin-right: inherit !important;"> Logout </a>
		</form>
		<table class="table table-bordered table-striped" style="text-align: center;">
			<thead class="thead" style="background: #3a9b72;">
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Course</th>
					<th>Country</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.firstname}" /></td>
						<td><c:out value="${tempStudent.lastname}" /></td>
						<td><c:out value="${tempStudent.course}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>
						<td>
							<!-- Add "update" button/link --> <a
							href="/studentRegistration/students/showFormForUpdate?studentId=${tempStudent.id}"
							class="btn btn-info btn-sm"> Update </a> <!-- Add "delete" button/link -->
							<a
							href="/studentRegistration/students/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false">
								Delete </a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>



