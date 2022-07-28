<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 출력, 쿠키 수정</title>
</head>
<body>
	<%
		String cookie_check = request.getHeader("Cookie");
		if(cookie_check != null) {
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("id")) {
					%>
					<p> 아이디 : <%=cookie.getValue()%></p>
					<% 			
				}
			}
		
	%>
	
	<%
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")) {
				Cookie new_cookie = new Cookie("id", "banana");
				response.addCookie(new_cookie);
			}
		}
	}
	
	%>
	<a href = "getCookie2.jsp">변경된 쿠키 값 확인하기</a>
</body>
</html>