<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");

	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?,now())";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, addr);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/customer/list.jsp");
	
%>