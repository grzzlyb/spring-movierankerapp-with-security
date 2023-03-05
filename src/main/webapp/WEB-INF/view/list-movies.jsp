<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<div id="wrapper">
	<div id="header">
		<h2>Movie Ranker</h2>
	</div>
</div>

<div id="container">
	<div id="content">

		<security:authorize access="hasRole('ADMIN')">
			<input type="button" value="Add Movie"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />
		</security:authorize>

		<form:form action="search" method="GET">
			<input type="text" name="theSearchName" />
			<input type="submit" value="Search" class="add-button" />
		</form:form>

		<table>
			<tr>
				<th>Movie Name</th>
				<th>Genre</th>
				<th>Release Date</th>
				<th>Rating</th>
				<security:authorize access="hasRole('ADMIN')">
					<th>Action</th>
				</security:authorize>
			</tr>

			<c:forEach var="tempMovie" items="${movies}">
				<c:url var="updateLink" value="/movie/showFormForUpdate">
					<c:param name="movieId" value="${tempMovie.id}" />
				</c:url>

				<c:url var="deleteLink" value="/movie/delete">
					<c:param name="movieId" value="${tempMovie.id}" />
				</c:url>
				<tr>
					<td>${tempMovie.movieName}</td>
					<td>${tempMovie.genre}</td>
					<td>${tempMovie.releaseDate}</td>
					<td>${tempMovie.rating}</td>

					<security:authorize access="hasRole('ADMIN')">
						<td><a href="${updateLink}">Update</a> | <a
							href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this movie?'))) return false">Delete</a>
						</td>
					</security:authorize>
				</tr>
			</c:forEach>
		</table>
		<br>
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST"> 
			<input type="submit" value="Logout" class="add-button" />
		</form:form>
	</div>
</div>
</body>
</html>