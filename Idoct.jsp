<html>
<head>
</head>
<body bgcolor="#f09970">
<center>
<h1>Welcome Administartor</h1></center>
<br>
<br>

<a href="./AdminHome.jsp">Back</a>
<a href="./logout.jsp">Logout</a>
<br>
<br>
<%@ page import="java.sql.*" %>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:health","health","health");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from doctor_details;");
String dnames[]=new String[10000];
int count=-1;
while(rs.next())
{
String name=rs.getString("status");
String cond="true";
if(name.equals("false"))
	{
	count++;
	dnames[count]=rs.getString(1);
 }
}
if(count==-1)
{
out.println("<h2><center>No doctor is available to get authenticated</h2>");
}
else
{
%>
<br>
<br>
<br>
<br>
<br>
<form action="./authenticate.jsp" method="post">
<center>Select Doctor to Authenticate:&nbsp;&nbsp;&nbsp;<select name="doct">
<option>select
<%
for(int it=0;it<=count;it++)
	{
	out.println("<option>");
	out.println(dnames[it]);
}
%>
</select>
<input type="submit" value="Authenticat">
<%
}
con.close();
%>
</form>
</body>
</html>