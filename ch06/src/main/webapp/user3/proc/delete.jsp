<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");

// 데이터베이스 처리
String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String user = "root";
String pass = "1234";

try{
	//1단계 jdbc드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계 sql 실행 객체 생성
	String sql = "DELETE FROM `user3` WHERE `uid` = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
// 목록이동
response.sendRedirect("../list.jsp");

%>