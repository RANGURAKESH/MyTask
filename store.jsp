<%@ page import="java.sql.*"%>
<html>
<head>
<title>My data</title>
</head>
<body>
<center><img src="logo.jpg"></center>
<div>
<%
String name=request.getParameter("rname");
String email=request.getParameter("rmail");
String gender=request.getParameter("rgender");
String cell=request.getParameter("rcell");
String pass=request.getParameter("rpassword");
String conpass=request.getParameter("cpassword");
if(pass.equals(conpass)){
	try{
		Driver d=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(d);
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","TIGER");
		PreparedStatement ps=con.prepareStatement("Insert into registar values(?,?,?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,gender);
		ps.setString(4,cell);
		ps.setString(5,pass);
		ps.setString(6,conpass);
		int x=ps.executeUpdate();
		if(x!=0){
			out.print("Record Saved Successfully");
		}else{
			out.print("Something Wrong..");
		}
	}catch(Exception e){
		out.print("You are already Registered with this Mobile Number");
	}
}else{
	out.print("Password not Matching");
}

	
%>
</div>
</body>
</html>