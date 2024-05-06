<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
    
<%	
//한글처리
    request.setCharacterEncoding("utf-8");
//전달된 파라미터 받기
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
	out.println("성공");
	
	
	//3. 생성된 연결통로를 통해 SQL문 실행 준비 : id, name, pwd 
	String sql = "insert into login(id,name,pwd) values(?,?,?)";

	
	
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,pwd);
	int i = pstmt.executeUpdate();
	

	
	
	//5. 연결 해제
	pstmt.close();
	con.close();
	
	//list.jsp로 이동하기
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=i %>행이 입력되었습니다!
</body>
</html>