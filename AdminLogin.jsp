<title>Administration Login Form</title>


<script>
function setfocus()
{

 f.cLid.focus();
      
   return false;


}
function CheckLogin()
{
 if(f.cLid.value=="")
 {
   alert("Please Enter Login Name");
   f.cLid.focus();
   
   return false;
   
 }else if(f.cPwd.value=="")
 {
   alert("Please Enter Password");
   f.cPwd.focus();
   
   return false;
 }else if(f.cLid.value=="admin" && f.cPwd.value=="admin")
 {
 f.action="AdminHome.jsp";
 f.submit();
 }else
 {
 
 alert("Invalid Login Details");
 f.cLid.value="";
   f.cPwd.value="";
   
   
   f.cLid.focus();
 
 
 }
 
 
}


function Go()
{




if(event.keyCode==13)
{
 CheckLogin();
 
 

}



}



function Clear()
{
  f.cLid.value="";
  f.cPwd.value="";
  
  
   f.cLid.focus();

  return false;
}

</script>

<style>
a
{
           color:"Black";
           text-decoration:none;
}
a:hover
{
            color:Gray;
            text-decoration:underline;

}
</style>

<jsp:include page="AdminHeader1.jsp" />

<HTML><HEAD><TITLE>Home Page</TITLE>
<META>
<BODY class=rightPage onLoad="setfocus()"><A name=Entity_1></A>
<form name=f method=post >
  <DIV class=caption1></DIV>
<TABLE class=tabformat cellSpacing=1 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
  <TD><h3>Administrator Login<h3></td>
  </TR>

</TBODY></TABLE>
  <br>
<br>
<table border="0" >
<tr>
<td class=tabhead2><b>Login Name :</b>
<td class=tabhead2><input type="text" name="cLid" size=15 maxlength=10 class="pwdstyle"  ></td></tr>
<td class=tabhead2><b>Password :</b></td>
<td class=tabhead2><input type=password name="cPwd" size=15 maxlength=10 class="pwdstyle" onKeyDown="Go()"   ></td></tr>
<tr>
<td><center>
           <input type=button value="  Login  " onClick="return CheckLogin()" o>&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="  Clear "  style={cursor:hand} onClick="return Clear()" height="30"></img> 
           
        </center></td>
</tr>
</table>

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  
  <jsp:include page="Footer.htm" />

</form>
</BODY>
</HTML>
