<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="DBcon.DConnection;"%>
<%! Connection con =null;
PreparedStatement pst=null;
Statement st,st1=null;
ResultSet rs,rs1=null;
int fare,noofseats,chdfare,totchfare,totadfare,totfare,phno,availbal;
String name,address;%>
<%
try
{
con=DConnection.connect();
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
session.setAttribute("uname",uname);
session.setAttribute("pass",pass);
Statement st=con.createStatement();
String qry="select * from BANKING_DETAILS where USERNAME='"+uname+"' and PASSWORD='"+pass+"'";
ResultSet rs=st.executeQuery(qry);
System.out.println("before rs");
if(rs.next())
{
System.out.println("before rs");
availbal=rs.getInt(4);

int totalfare=(Integer)session.getAttribute("totalfare");
System.out.println("before rs=="+totalfare);
System.out.println("=="+totalfare+"=="+availbal);
if(totalfare<=availbal)
{
System.out.println("u have avail bal");
%>
<jsp:forward page="ticketprint.jsp"/>
<%
}
else
{
out.println("u have insufficient bal");
}




}
else
{
System.out.println("wrong password");
%>
<jsp:forward page="fail.html"/>
<%}
}

catch(Exception e)
{
e.printStackTrace();
}
%>

