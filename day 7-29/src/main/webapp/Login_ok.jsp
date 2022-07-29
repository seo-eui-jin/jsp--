<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cookiedId = new Cookie("id", request.getParameter("id"));
		Cookie cookiedPw = new Cookie("pw", request.getParameter("pw"));
		cookiedId.setMaxAge(10000);
		cookiedPw.setMaxAge(10000);
		response.addCookie(cookiedId);
		response.addCookie(cookiedPw);
	%>
	로그인 성공
</body>
</html>