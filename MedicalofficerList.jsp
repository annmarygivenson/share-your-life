<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
         <form name="medicalofficerlist">
    <table  align="center" border="">
   
        <%
            String medicalofficerId=request.getParameter("mId");
            int i=1;
            
           if(request.getParameter("acid")!=null)
            {
                 String upd="update tbl_healthofficer set status='1' where medicalofficer_id='"+request.getParameter("acid")+"'";
                 boolean b1=obj.ExecuteCommand(upd);
                  if(b1)
                  {
                        response.sendRedirect("MedicalofficerList.jsp");
                  }
                  else
                  {
                      out.println(upd);
                  }  
            }
            if(request.getParameter("rejid")!=null)
            {
                 String up="update tbl_healthofficer set status='2' where medicalofficer_id='"+request.getParameter("rejid")+"'";
                 boolean b2=obj.ExecuteCommand(up);
                  if(b2)
                  {
                        response.sendRedirect("MedicalofficerList.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }  
            }
          
        %>    
           
        
        <tr>
            <th>Id</th>
            <th> Medicalofficer name</th>
            <th> Status</th>
        </tr>
        <%
        String medicalOfficerName = "";
        String medicalOfficerId = "";
            String sel = "select * from tbl_healthofficer where status="+0;
            ResultSet rs = obj.selectData(sel);
            while (rs.next())
            {
               medicalOfficerId = rs.getString("medicalofficer_id");
               medicalOfficerName = rs.getString("medicalofficername");
        %>
            
            <tr>
                <td><%=medicalOfficerId%></td>
                <td><%=medicalOfficerName%></td> 
                <td> 
                    <a href="MedicalofficerList.jsp?acid=<%=medicalOfficerId%>">Accept</a>
                    <a href="MedicalofficerList.jsp?rejid=<%=medicalOfficerId%>">Reject</a>
                    
                    
                </td>
            </tr>    
            
            
            
            
         <%
            }                       
        %>
    </table>
        </form>
    </body>
</html>
