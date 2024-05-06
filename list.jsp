<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
  //DB 연동
  //한글처리
    request.setCharacterEncoding("utf-8");
  //폼에서 전달된 파라미터 받기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	//1. 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");
	//2. 자바와 db간의 연결통로 만들기
	String url ="jdbc:mariadb://localhost:3306/jmaxdb"; //mariadb에서 localhst:포트번호//db이름
	String user ="jmax"; //db에서의 유저 id
	String password ="1111"; //db에서의 유저 password
	

	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	String sql = "select * from login";
	ResultSet rs = stmt.executeQuery(sql);
	
    // 연결 해제
     rs.close();
     stmt.close();
     con.close(); 
     
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>
		<h1 class="text-center font-weight-bold">사용자 정보</h1><br>
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
			</tr>
			<%
			
		  //화면출력
		  
        while(rs.next()) {
			String userId = rs.getString("id");
			String userName = rs.getString("name");
			String userPwd = rs.getString("pwd");
			
			out.print("<tr>");
			out.print("<td>" + userId + "</td>");
			out.print("<td>" + userName + "</td>");
			out.print("<td>" + userPwd + "</td>");
			out.print("</tr>");
		}
         
			
			%>

		</table>
	</div>
	
</body>
</html>