<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Chatroom ${chatroomId}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<c:url value="/resources/chatroom.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="<c:url value="/resources/chatroom.js"/>"></script>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${!isAllowed}">
				This is not allowed.
			</c:when>
			<c:otherwise>
				<div class="row header-area">
					<div class="well">
						<h3>Chatroom ${chatroomId}</h3>
						<a class="btn btn-default" href="../logout">Logout</a>
					</div>
				</div>
				<div class="row message-container-area">
					<div class="panel panel-default">
						<div id="message-container" class="panel-body"></div>
					</div>
				</div>
				<div class="row message-input-area">
					<div class="col-xs-10 col-sm-11 col-md-11 col-lg-11">
						<input id="message" class="form-control" type="text" required />
					</div>
					<div class="col-xs-2 col-sm-1 col-md-1 col-lg-1">
						<a id="sendMessage" class="btn btn-default">Send</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>