<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginResult</title>
</head>
<body>
    <script>
	    var msg = "${ result }";
	    var url = "${pageContext.request.contextPath}/member/loginpage";
	    alert(msg);
	    location.href = url;
	</script>
</body>
</html>