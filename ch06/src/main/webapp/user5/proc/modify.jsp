<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");

// 데이터베이스 처리
//String host = "jdbc:mysql://127.0.0.1:3306/studydb";
//String user = "root";
//String pass = "1234";

try{
	//1단계 jdbc드라이버 로드
	//Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계 데이터베이스 접속
	//Connection conn = DriverManager.getConnection(host, user, pass);
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	//3단계 sql 실행 객체 생성
	String sql = "UPDATE `user5` SET `name`=?, `gender`=?, `age`=?, `addr`=? WHERE `seq`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, name);
	psmt.setString(2, gender);
	psmt.setString(3, age);
	psmt.setString(4, addr);
	psmt.setString(5, seq);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
// 목록이동
response.sendRedirect("../list.jsp");

%>