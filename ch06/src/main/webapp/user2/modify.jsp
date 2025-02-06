<%@page import="entity.User2"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String user = "root";
String pass = "1234";

User2 user2= null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	String sql = "select * from `user2` where `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	if(rs.next()){
		user2 = new User2();
		user2.setUid(rs.getString(1));
		user2.setName(rs.getString(2));
		user2.setBirth(rs.getString(3));
		user2.setAddr(rs.getString(4));
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::list</title>
</head>
<body>
	<h3>user2수정</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록으로</a>
	
	<form action="./proc/modify.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" value="<%= user2.getUid() %>" readonly></td>
			
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= user2.getName() %>" placeholder="이름 입력"></td>
		</tr>
		<tr>
			<td>생일</td>
			<td><input type="date" name="birth" value="<%= user2.getBirth() %>" placeholder="생일 입력"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="<%= user2.getAddr() %>" placeholder="주소 입력"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"> 
			<input type="submit" value="수정하기"> 
			</td>
		</tr>
	</table>
	</form>
</body>
</html>