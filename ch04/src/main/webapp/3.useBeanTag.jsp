<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.forwardTag</title>
	<!--
		날짜 : 2025/02/05
		이름 : 이민성
		내용 : 4장 JSP 액션태그 실습
	-->
</head>
<body>
	<h3>3. useBean 액션테그</h3>
	
	<h4>폼 전송</h4>
	<form action="./proc/userProc.jsp" method="get">
	<input type="text" name="uid" placeholder="아이디 입력"><br>
	<input type="text" name="name" placeholder="이름 입력"><br>
	<input type="text" name="hp" placeholder="휴대폰 입력"><br>
	<input type="number" name="age" placeholder="나이 입력"><br>
	<input type="submit" value="전송하기"><br>
	</form>
	
	
	
</body>
</html>