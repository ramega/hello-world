<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String no=request.getParameter("NO");
System.out.println("no=="+no);
session.setAttribute("no",no);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #0066FF}
-->
</style>
</head>

<body>
<form action="signin.jsp">
<div align="center">
  <table width="980" height="580" border="0" background="images/easter-clipart1.jpg">
    <tr>
      <th width="865" height="64" scope="row"><img src="images/IMA.JPG" width="978" height="184" /></th>
    </tr>
    <tr>
      <th height="388" scope="row"><table width="975" height="385" border="0" bordercolor="#999999">
        <tr>
          <th width="90" height="23" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><a href="index.html">Home</a></th>
          <th width="138" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><a href="onlinereservmoudle.html">Online Resevation</a></th>
          <th width="178" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="fare.html">Fares</a><a href="flightschedule.html"></a> </span></th>
          <th width="106" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><a href="cancel.html">Cancel/Modify</a></th>
          <th width="135" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="Status.html">Status</a><a href="flightstatus.html"></a></span></th>
          <th width="139" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><span class="style1"><a href="flightschedule.html">Flight Schedule</a><a href="bookingstatus.html"></a> </span></th>
          <th width="159" background="images/easter-clipart1.jpg" bgcolor="#999999" scope="row"><a href="adminmoudle.html">Admin</a></th>
        </tr>
        <tr>
          <th height="356" colspan="7" background="images/easter-clipart1.jpg" bgcolor="#CCCCCC" scope="row"><table width="272" border="0">
            <tr>
              <td width="119">Username</td>
              <td width="137"><label></label>
              <div align="center">
                <input type="text" name="uname" />
</div></td>
            </tr>
            <tr>
              <td>password</td>
              <td><input type="text" name="pass" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><label>
                <input type="submit" name="Submit" value="Submit" />
              </label></td>
            </tr>
          </table>
            <table width="200" height="101" border="1">
              <tr>
                <th scope="row"><img src="images/images[54].jpg" width="201" height="130" /></th>
              </tr>
            </table>
            <p>If Are New User Register Hear</p>
            <p><a href="signup.html">Signup </a></p></th>
        </tr>
      </table></th>
    </tr>
  </table>
</div>
</form>
</body>
</html>
