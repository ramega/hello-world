<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="DBcon.DConnection,avalseats.availseats;" %>

<%! Connection con =null;
PreparedStatement pst=null;
Statement st=null;
int totalseats;
String class1,flightno;
%>
<%
try
{
con=DConnection.connect();
String pnrno=request.getParameter("pnrno");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select  CLASS1, TOTALSEATS,FLIGHTNO from BOOKING_STATUS");
while(rs.next())
{
class1=rs.getString(1);
totalseats=rs.getInt(2);
flightno=rs.getString(3);
System.out.println("totalseats=="+totalseats);
}

if(class1.equals("First"))
{
Statement st1=con.createStatement();

String qr1="update BOOKING_FIRST set NOOFSEATS='"+totalseats+"' where FLLIGHTNO='"+flightno+"'";
int rs1=st1.executeUpdate(qr1);
if(rs1!=0)
{
System.out.println("updated");
Statement st2=con.createStatement();
String qry2="delete from BOOKING_STATUS where PNRNO='"+pnrno+"'";
int rs3=st2.executeUpdate(qry2);
%>

<jsp:forward page="afterdelete.html"/>
<%
}
else
{
System.out.println(" Not updated");
}
}
else if(class1.equals("Economy"))
{
Statement st1=con.createStatement();

String qr1="update BOOKING_ECONOMY set NOOFSEATS='"+totalseats+"' where FLLIGHTNO='"+flightno+"'";
int rs1=st1.executeUpdate(qr1);
if(rs1!=0)
{
System.out.println("updated");
Statement st2=con.createStatement();
String qry2="delete from BOOKING_STATUS where PNRNO='"+pnrno+"'";
int rs3=st2.executeUpdate(qry2);
%>

<jsp:forward page="afterdelete.html"/>
<%
}
else
{
System.out.println(" Not updated");
}
}
else if(class1.equals("bussiness"))
{
Statement st1=con.createStatement();

String qr1="update BOOKING_BUSSINESS set NOOFSEATS='"+totalseats+"' where FLLIGHTNO='"+flightno+"'";
int rs1=st1.executeUpdate(qr1);
if(rs1!=0)
{
System.out.println("updated");
Statement st2=con.createStatement();
String qry2="delete from BOOKING_STATUS where PNRNO='"+pnrno+"'";
int rs3=st2.executeUpdate(qry2);
%>

<jsp:forward page="afterdelete.html"/>
<%

}
else
{
System.out.println(" Not updated");
}
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>


