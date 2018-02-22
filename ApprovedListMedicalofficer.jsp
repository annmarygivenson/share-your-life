<%-- 
    Document   : ApprovedListMedicalofficer
    Created on : 21 Feb, 2018, 3:41:19 PM
    Author     : Win
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table border="1" align="center">
                <tr>
                    <th>SINo</th>
                    <th>MedicalofficerName</th>
                    

                </tr>
                <%
                    int i = 0;

                    String sel = "select * from tbl_healthofficer where  status='1'";
                    ResultSet rs = obj.selectData(sel);
                    while (rs.next()) {

                        i++;


                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("medicalofficername")%></td>
                    

                </tr>


                <%
                    }
                %>



            </table>
        </form>


    </body>
</html>
