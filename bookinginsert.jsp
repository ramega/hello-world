<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="DBcon.DConnection;"%>
<%! Connection con =null;
PreparedStatement pst=null;
%>
<%
try
{
con=DConnection.connect();
String flightno =request.getParameter("flightno");
String name=request.getParameter("flihtname");
String from =request.getParameter("from");
String to=request.getParameter("to");
String time1 =request.getParameter("time");

String day=request.getParameter("day");
String month=request.getParameter("month");
String year=request.getParameter("year");
String class1=request.getParameter("class");
int fare=Integer.parseInt(request.getParameter("fare"));
int no=Integer.parseInt(request.getParameter("ceats"));
String totaldate=day+"-"+month+"-"+year;
System.out.println("date==="+totaldate);
if(class1.equals("First"))
	{
pst=con.prepareStatement("insert into BOOKING_FIRST values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,flightno);
pst.setString(2,name);
pst.setString(3,from);
pst.setString(4,to);
pst.setString(5,time1);
pst.setString(6,totaldate);
pst.setString(7,class1);
pst.setInt(8,fare);
pst.setInt(9,no);
int rs=pst.executeUpdate();
if(rs!=0)
{
%>
<jsp:include page="adminmoudle.html"/>
<%
}
else
{
out.println("Information not saved");
%>
<jsp:include page="bookinginsert.html"/>
<%}}
//rs.close();
else if(class1.equals("bussiness"))
		{
pst=con.prepareStatement("insert into BOOKING_BUSSINESS values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,flightno);
pst.setString(2,name);
pst.setString(3,from);
pst.setString(4,to);
pst.setString(5,time1);
pst.setString(6,totaldate);
pst.setString(7,class1);
pst.setInt(8,fare);
pst.setInt(9,no);
int rs=pst.executeUpdate();
if(rs!=0)
{
%>
<jsp:include page="adminmoudle.html"/>
<%
}
else
{
out.println("Information not saved");
%>
<jsp:include page="fightbooking.jsp"/>
<%}}
//rs.close();
else if(class1.equals("Economy"))
			{
	pst=con.prepareStatement("insert into BOOKING_ECONOMY values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,flightno);
pst.setString(2,name);
pst.setString(3,from);
pst.setString(4,to);
pst.setString(5,time1);
pst.setString(6,totaldate);
pst.setString(7,class1);
pst.setInt(8,fare);
pst.setInt(9,no);
int rs=pst.executeUpdate();
if(rs!=0)
{
%>
<jsp:include page="adminmoudle.html"/>
<%
}
else
{
out.println("Information not saved");
%>
<jsp:include page="bookinginsert.html"/>
<%}}
//rs.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>


