<%@page import="java.sql.*"%>
<html>
<head>
<title>Registered Students</title>
</head>
<body>
<center><img src="logo.jpg"></center>
<form id="myform">
<button onclick="myhome()">Back</button>
</form>
</div>
<script>
const myhome=()=>{
	document.getElementById("myform").action="index.html";
	}
</script>
<div>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","TIGER");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select name,cell,email from REGISTAR");
out.println("<table border='1' align='center'>");
out.print("<caption id='one'>"+"<font color='red' size='5'>Registered Students List</font>"+"</caption>");
	out.print("<tr><th>Name</th><th>CELL</th><th>E-Mail Id</th></tr>");
	while(rs.next())
	{
	out.print("<tr><td>"+rs.getString(1)+"</td>"+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td></tr>");
	}
	out.println("</table>");
	con.close();
	%>
</div>
</body>
</html>