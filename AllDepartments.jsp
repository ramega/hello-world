<%@page import="javax.servlet.*" %>
<script>
function Update(Did){
  alert(Did);
  window.open("UpdateDept.jsp?Did="+ Did + " ","popup","width=500,height=400");
}

function check(test1)
{
if ( test1 == 'first') { document.sat.mode.value='First'; }
if ( test1 == 'previous') { document.sat.mode.value='Previous'; }
if ( test1 == 'next') { document.sat.mode.value='Next'; }
if ( test1 == 'last') { document.sat.mode.value='Last'; }
 document.sat.test.value="2";
document.sat.action="AllDepartments.jsp";
document.sat.submit();
}
function sub(){
document.sat.test.value="1";
document.sat.action="AllDepartments.jsp";
document.sat.submit();
}
</script>
<%@page import="java.sql.*,CMST.*" %>
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
<LINK href="css/styles.css" type=text/css rel=stylesheet>

<jsp:include page="ADeptHeader.jsp" />

<HTML><HEAD><TITLE>Department Details</TITLE>

<FORM NAME="sat" method=post>
 
<META>
<TR>
<td>

<%

String test="";

int pageNo=0;
int fromRows=0;
int toRows=0;
int noofRows=0;
int nn=0;

try {
        pageNo = Integer.parseInt((String)request.getParameter("pageNo"));
  
    } catch (Exception e){pageNo=0;}   


Connection con=null;
ResultSet rs=null;
ConnectionBean CBean=new ConnectionBean();
con=CBean.getConnection();

Statement stmt = null;
 stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
 
 
rs=stmt.executeQuery("select * from police_department order by department_id");


 try 
 {
              System.out.println("ok444");
              
           
            
         rs.last();
           noofRows=rs.getRow();

rs.beforeFirst();
   
          
                
 } 
 catch(Exception e) 
 {
   e.printStackTrace();
   //out.println(e);
 }	
              	        
              	        
              	
    int remRows=noofRows%10;
    int LastPage=(noofRows-remRows)/10;
           
       		
    if (remRows>0) { LastPage++; }	   
    

              		   
   try 
        {
          if (request.getParameter("mode").equals("Previous")) {pageNo--;}		
              		    
          if (request.getParameter("mode").equals("Next")) 
          { 
              pageNo++; 
              			if (pageNo>LastPage) 
              			{
              			    pageNo=LastPage;
              			}
          }		
              	            if (request.getParameter("mode").equals("Last"))
              	             { pageNo=LastPage;}	
              	             
              	             	
              	            if (request.getParameter("mode").equals("First")) 
              	            { pageNo=1;}	
              	        
       
        
        
        }catch(Exception e) 
        { 
	      pageNo++;
	    }
	    
          			   
        if (pageNo<=0) {pageNo=1;}     		   
              		  
             pageNo=pageNo;
             toRows=pageNo*10;
             int gm=0;
              		
           		
   		 
              		
           if (toRows > noofRows ) 
           {  gm=  noofRows;   } 
           else { gm=pageNo*10; }
              	        
           fromRows=toRows-10;
           
           
      
           
  %> 
  
  <%
	try
	{

	int cv=0;
	cv=pageNo;
	 
	
	 %>
	 
	 
	 
	 <%  


	 

		} catch(Exception e ) {e.printStackTrace();}
                     	        
	%>        
           
           





       	 <input type=hidden name=pageNo value="<%=pageNo%>">
       	 <input type=hidden  name="test">
       	 <input type=hidden name=mode >



<center><h3 >POLICE DEPARTMENT DETAILS</h3> </center>
<table align=center border=1 colspace=10>
<th class=tabhead3 >Department Id
<th class=tabhead3 >Department Name
<th class=tabhead3 >SI Name
<th class=tabhead3>Address
<th class=tabhead3>Area
<th class=tabhead3>Contact No
<th class=tabhead3>Check
<%



int rowCount = 0; 
          while(rs.next())
          
          
          {
	          rowCount=rowCount+1;
		    if (rowCount>fromRows && rowCount<=toRows) 
		    {
	        String Did=rs.getString(1);
	        
	
%>
<tr>
<td class=tabhead1><%=Did%></td>
<td class=tabhead1><%=rs.getString(2) %></td>
<td class=tabhead1><%=rs.getString(3) %></td>
<td class=tabhead1><%=rs.getString(4) %></td>
<td class=tabhead1><%=rs.getString(5) %></td>

<%
String code=rs.getString(6);
String cno=rs.getString(7);
String phno=code+"-"+cno;

%>

<td class=tabhead1><%=phno %></td>


<td class=tabhead1><a style={cursor:hand} onclick="Update(<%=Did%>)">Update</a></td>
</tr>
<%
}
}

%>

</table>

<TABLE WIDTH="985"><TR>
	       	 <TD ALIGN=CENTER> <INPUT  TYPE=BUTTON value="First" style={cursor:hand}  onclick="check('first')";>&nbsp;&nbsp;&nbsp;&nbsp;
	       	 <INPUT  TYPE=BUTTON value="Previous" style={cursor:hand}  onclick="check('previous')";>&nbsp;&nbsp;&nbsp;&nbsp;
	       	 <INPUT  TYPE=BUTTON value="Next"  style={cursor:hand}  onclick="check('next')";>&nbsp;&nbsp;&nbsp;&nbsp;
	       	 <INPUT  TYPE=BUTTON value="Last" style={cursor:hand}  onclick="check('last')";>
       	 </TD></TR></TABLE>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>

<br>


<jsp:include page="Footer.htm" />

</BODY>
</HTML>
d