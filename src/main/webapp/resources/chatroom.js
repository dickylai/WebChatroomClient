var stompClient = null;

function connect() {
	var socket = new SockJS('/webchatboxclient/chatroom');
	stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		console.log('Connected: ' + frame);
		stompClient.subscribe('/topic/messages/' + $('#chatroomId').text(),
				function(message) {
					show(JSON.parse(message.body));
				});
		stompClient.send(location.pathname + "/join", {}, JSON.stringify({
			'from' : $("#nickname").text(),
			'content' : $("#message").val()
		}));
	});
}

function disconnect() {
	stompClient.send(location.pathname + "/leave", {}, JSON.stringify({
		'from' : $("#nickname").text(),
		'content' : $("#message").val()
	}));
	if (stompClient != null) {
		stompClient.disconnect();
	}
}

function send() {
	stompClient.send(location.pathname + "/message", {}, JSON.stringify({
		'from' : $("#nickname").text(),
		'content' : $("#message").val()
	}));
	$("#message").val('');
}

function show(message) {
	var fulldate = new Date(message.time);
	fulldate.setTime(fulldate.getTime() - fulldate.getTimezoneOffset() * 60
			* 1000);
	var date = fulldate.toISOString().substr(0, 10);
	var time = fulldate.toISOString().substr(11, 8);
	var newMessage = "<div>[" + date + " " + time + "] ";
	if (message.control && message.control == "join") {
		newMessage = newMessage + message.from + " joins the chat.</div>"
	} else if (message.control && message.control == "leave") {
		newMessage = newMessage + message.from + " leaves the chat.</div>"
	} else {
		newMessage = newMessage + message.from + ": " + message.content + "</div>";
	}
	$("#message-container").append(newMessage);
}

$(function() {
	$("document").ready(function() {
		connect();
	});
	$("#sendMessageField").on('submit', function(e) {
		e.preventDefault();
		send();
	});
	$("#logout").click(function(e) {
		disconnect();
	});
});

window.onbeforeunload = function() {
	disconnect();
};