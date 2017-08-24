<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Web Chatroom</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Web Chatroom</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xm-12 col-sm-6 col-md-6 col-lg-6">
				<sf:form action="login" method="POST" modelAttribute="user">
					<div class="form-group">
						<label>Nickname</label>
						<sf:input path="nickname" class="form-control" type="text"
							required="true" />
					</div>
					<div class="form-group">
						<label>Chatroom ID</label>
						<sf:input path="chatroomId" class="form-control" type="text"
							required="true" />
					</div>
					<input class="btn btn-default" type="submit" value="Chat" />
				</sf:form>
			</div>
			<div class="col-xm-12 col-sm-6 col-md-6 col-lg-6">
				<label>Available rooms</label>
				<ul class="list-group">
					<c:if test="${rooms.isEmpty()}">
						<li class="list-group-item">No room is available.</li>
					</c:if>
					<c:forEach items="${rooms}" var="room">
						<li class="list-group-item">${room.getChatroomId()}</li>
					</c:forEach>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>