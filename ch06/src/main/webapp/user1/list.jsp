<%@page import="entity.user1"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";

	List<user1> users = new ArrayList<>();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host, user, pass);
	Statement stmt =  conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from `user1`");
	
	while(rs.next()){
		user1 user1 = new user1();
		user1.setUid(rs.getString(1));
		user1.setName(rs.getString(2));
		user1.setHp(rs.getString(3));
		user1.setAge(rs.getInt(4));
		users.add(user1);
	}
	
	
	rs.close();
	stmt.close();
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
	<h3>user1목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<% for(user1 user1 : users){ %>
		<tr>
			<td><%= user1.getUid() %></td>
			<td><%= user1.getName() %></td>
			<td><%= user1.getHp() %></td>
			<td><%= user1.getAge() %></td>
			<td>
				<a href="./modify.jsp?uid=<%= user1.getUid() %>">수정</a>
				<a href="./proc/delete.jsp?uid=<%= user1.getUid() %>">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>