<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="entity.User4"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
//String user = "root";
//String pass = "1234";

User4 user4= null;

try{
	//Class.forName("com.mysql.cj.jdbc.Driver");
	//Connection conn = DriverManager.getConnection(host, user, pass);
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	String sql = "select * from `user4` where `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	if(rs.next()){
		user4 = new User4();
		user4.setUid(rs.getString(1));
		user4.setName(rs.getString(2));
		user4.setGender(rs.getString(3));
		user4.setAge(rs.getInt(4));
		user4.setHp(rs.getString(5));
		user4.setAddr(rs.getString(6));
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
	<title>user4::수정</title>
</head>
<body>
	<h3>user4 수정</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록으로</a>
	
	<form action="./proc/modify.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" value="<%= user4.getUid() %>" readonly></td>
			
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= user4.getName() %>" placeholder="이름 입력"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td> 
				<label><input type="radio" name="gender" value="m">남자</label>
                <label><input type="radio" name="gender" value="f" >여자</label> 
            </td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="number" name="age" value="<%= user4.getAge() %>" placeholder="나이 입력"></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" value="<%= user4.getHp() %>" placeholder="휴대폰 입력"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" value="<%= user4.getAddr() %>" placeholder="주소 입력"></td>
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