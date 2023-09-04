<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Form</title>
</head>
<body>

<%@page import="java.sql.*" %>

<%
String Name = request.getParameter("name");
String Mail =  request.getParameter("email");
String Phone = request.getParameter("number");
String msg = request.getParameter("message");

ResultSet rs = null;
Connection con = null;
PreparedStatement ps = null;


String query ="insert into contact (name,email,message,phone) values(?,?,?,?)";

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_contact","root","Abcd@123");
	ps = con.prepareStatement(query);
	ps.setString(1,Name);
	ps.setString(2,Mail);
	ps.setString(3,msg);
	ps.setString(4,Phone);
	int i = ps.executeUpdate();
	if(i>0){
		out.print("<h1>Data sucessfully uploded</h1>");
	}else
	{
		out.print("<h1>Error</h1>");
		
	}
  
}catch(Exception e){
	out.print(e);
}



%>

</body>
</html>