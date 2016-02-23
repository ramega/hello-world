<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="DBcon.DConnection;"%>
<%! Connection con =null;
PreparedStatement pst=null;
Statement st,st1=null;
ResultSet rs,rs1=null;
int fare,noofseats,chdfare,totchfare,totadfare,totfare;%>
<%
try
{
con=DConnection.connect();
int children1=(Integer)session.getAttribute("children1");
int adults1=(Integer)session.getAttribute("adults1");
String from=(String)session.getAttribute("from");
String to=(String)session.getAttribute("to");
String totaldate=(String)session.getAttribute("totaldate");
int totalseats=adults1+children1;
st=con.createStatement();
st1=con.createStatement();
String qr1="select FARE,NOOFSEATS from BOOKING_BUSSINESS";
rs1=st.executeQuery(qr1);
while(rs1.next())
{
 fare=rs1.getInt(1);
 noofseats=rs1.getInt(2);
}
chdfare=fare/2;
totchfare=chdfare*children1;

totadfare=fare*adults1;

totfare=totchfare+totadfare;

String qry="select *  from BOOKING_BUSSINESS where SOURCE='"+from+"' and DESTINATION='"+to+"' and DEPDATE='"+totaldate+"'";
rs=st.executeQuery(qry);

%>

<html>
<head>

<style type="text/css">
<!--
.style1 {color: #0066FF}
.style2 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<form action="bookticket.jsp">
<div align="center">
  <table width="975" height="739" border="0" background="images/easter-clipart1.jpg">
    <tr>
      <th width="969" height="64" scope="row"><img src="images/IMA.JPG" width="978" height="184" /></th>
    </tr>
    <tr>
      <th height="547" scope="row"><table width="971" height="587" border="0" bordercolor="#999999">
        <tr>
          <th width="90" height="23" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="index.html">Home</a></span></th>
          <th width="139" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="onlinereservmoudle.html">Online Resevation </a></span></th>
          <th width="89" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="fare.html">Fares</a><a href="flightschedule.html"></a> </span></th>
          <th width="129" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="cancel.html">Cancel/Modify</a></span></th>
          <th width="108" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="Status.html">Status</a><a href="flightstatus.html"></a></span></th>
          <th width="136" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="flightschedule.html">Flight Schedule</a><a href="bookingstatus.html"></a> </span></th>
          <th width="250" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><a href="adminmoudle.html">Admin</a></th>
        </tr>
        <tr>
          <th height="558" colspan="7" background="images/easter-clipart1.jpg" bgcolor="#CCCCCC" scope="row">
		  
		  
		  <%
		      if(rs.next())
		      {
		      
		      
		        String no=rs.getString(1);
		        if(totalseats<=noofseats)
		        {
		   %>
		  <table width="960" height="500" border="0">
            <tr>
              <td width="954" height="496" background="images/easter-clipart1.jpg"><table width="725" border="0">
                  <tr>
                    <td width="44">SELECT</td>
                    <td width="44">FLIGHT NO </td>
                    <td width="133">FLIGHT NAME </td>
                    <td width="72">SOURCE</td>
                    <td width="136">DESTINATION</td>
                    <td width="53">TIME</td>
                    <td width="99">DEP DATE </td>
                    <td width="100">CLASS</td>
                  </tr>
                  <tr>
                    <td><label>
                      <input type="checkbox" name="NO" value=<%=no %> />
                    </label></td>
                    <td><%=no %>&nbsp;</td>
                    <td><%=rs.getString(2) %>&nbsp;</td>
                    <td><%=rs.getString(3) %>&nbsp;</td>
                    <td><%=rs.getString(4) %>&nbsp;</td>
                    <td><%=rs.getString(5) %>&nbsp;</td>
                    <td><%=rs.getString(6) %>&nbsp;</td>
                    <td><%=rs.getString(7) %>&nbsp;</td>
                  </tr>
              </table>
                <p align="center" class="style2">FARE DETAILS</p>
                <div align="center">
                  <table width="622" height="139" border="0">
                      <tr>
                        <td width="179" height="82">AVILABLE SEATS </td>
                        <td width="116">CHIDREN FARE  </td>
                        <td width="172"><p>ADULTS FARE</p>                          </td>
                        <td width="127">TOTAL FARE </td>
                      </tr>
                      <tr>
                        <td><%= noofseats%>&nbsp;</td>
                        <td><p>&nbsp;</p>
                          <p><%=totchfare %>&nbsp;</p>
                          <p>&nbsp;</p></td>
                        <td><%=totadfare %>&nbsp;</td>
                        <td><%=totfare %>&nbsp;</td>
                      </tr>
                        </table>
                </div>
                <p>
                  <input type="submit" name="button1">
                </p>
                <p>&nbsp; </p></td>
            </tr>
          </table>
		  <br>
          <br></th>
        </tr>
      </table></th>
    </tr>
  </table>
</div>
</form>
</body>
</html>

