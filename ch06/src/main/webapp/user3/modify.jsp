<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="entity.User3"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
//String user = "root";
//String pass = "1234";

User3 user3= null;

try{
	//Class.forName("com.mysql.cj.jdbc.Driver");
	//Connection conn = DriverManager.getConnection(host, user, pass);
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	String sql = "select * from `user3` where `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	if(rs.next()){
		user3 = new User3();
		user3.setUid(rs.getString(1));
		user3.setName(rs.getString(2));
		user3.setBirth(rs.getString(3));
		user3.setHp(rs.getString(4));
		user3.setAddr(rs.getString(5));
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
	<title>user3::수정</title>
</head>
<body>
	<h3>user3수정</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록으로</a>
	
	<form action="./proc/modify.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" value="<%= user3.getUid() %>" readonly></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= user3.getName() %>" placeholder="이름 입력"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth" value="<%= user3.getBirth() %>" placeholder="생년월일 입력"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="hp" value="<%= user3.getHp() %>" placeholder="전화번호 입력"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="<%= user3.getAddr() %>" placeholder="주소 입력"></td>
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