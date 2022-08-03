<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 실습 2</title>
</head>
<body>
<!-- 
	1단부터 100단까지 중 사용자에게 입력받은 단수로 구구단 출력하기
	입력받은 값이 정수인지 아닌지 판단, 값을 입력했는지 안 했는지 판단
	다른 페이지 이동 없이 현재 페이지에서만 기능 구현
	자바스크립트 사용 가능
 -->
 <!--  form태그에서 action을 생략하면 현재 페이지로 전송되고, method를 생략하면 get 방식으로 설정된다 -->
 	<form name="gugudan">
 		<input type="text" name="number">
 		<button type="button" onclick="send()">전송</button>
 	</form>
 	<!-- 외부에서 전달받은 파라미터가 requestScope에 저장되지 않고 쿼리 스트링을 통해 URL로 전달 된다면, param 객체로 접근하여야 한다 -->
	 	<c:set var = "dan" value="${param.number}"/>
	 <!-- dan(전달받은 파라미터)이 비어있지 않다면 -->
 	<c:if test="${not empty dan}">
	 	<c:forEach var="i" begin="1" end="9">
	 		<c:out value="${dan}"/>
	 		*
	 		<c:out value="${i}"/>
	 		=
	 		<c:out value="${dan * i}"/>
	 		<br>
	 	</c:forEach>
	 	</c:if>
 	
</body>
		<script>
			function send(){
				//form태그
				let frm = document.gugudan;
				//사용자가 입력한 단수
				let input = frm.number.value;
				//소수점이 0.1~0.9이면 false, 정수이거나 .0이면 true이다
				let check = input % 1 == 0; 
				//소수점이 0.1~0.9이거나 숫자가 아니면
				if(!check || !Number.isInteger(parseInt(input)) || isNaN(input)){
					alert("정수만 입력해주세요");
					return;
				}
				//.0으로 입력했다면 실수를 정수로 변환하여 다시 넣어준다
				frm.number.value = parseInt(input);
				frm.submit();
			}
		</script>
</html>