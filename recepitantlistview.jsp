<%-- 
    Document   : recepitantlistview
    Created on : 15 Feb, 2018, 11:25:55 AM
    Author     : Win
--%>

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
        <form name="recepitantlist">
    <table  align="center" border="">
   
        <%
            String recepitantId=request.getParameter("rId");
            int i=1;
            
           if(request.getParameter("acid")!=null)
            {
                 String upd="update tbl_recepitant set status='1' where recepitant_id='"+request.getParameter("acid")+"'";
                 boolean b1=obj.ExecuteCommand(upd);
                  if(b1)
                  {
                        response.sendRedirect("recepitantList.jsp");
                  }
                  else
                  {
                      out.println(upd);
                  }  
            }
            if(request.getParameter("rejid")!=null)
            {
                 String up="update tbl_recepitant set status='2' where recepitant_id='"+request.getParameter("rejid")+"'";
                 boolean b2=obj.ExecuteCommand(up);
                  if(b2)
                  {
                        response.sendRedirect("recepitantList.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }  
            }
          
        %>    
           
        
        <tr>
            <th>Id</th>
            <th> Recepitant name</th>
            <th> Status</th>
        </tr>
        <%
        String recepitantName = "";
        String receptId = "";
            String sel = "select * from tbl_healthofficer where status="+0;
            ResultSet rs = obj.selectData(sel);
            while (rs.next())
            {
            receptId = rs.getString("recepitant_id");
              recepitantName = rs.getString("recepitantname");
        %>
            
            <tr>
                <td><%=  recepitantId%></td>
                <td><%=recepitantName%></td> 
                <td> 
                    <a href="recepitantList.jsp?acid=<%=recepitantId%>">Accept</a>
                    <a href="recepitantt.jsp?rejid=<%=recepitantId%>">Reject</a>
                    
                    
                </td>
            </tr>    
            
            
            
            
         <%
            }                       
        %>
    </table>
        </form>
    </body>
</html>
