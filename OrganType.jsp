<%-- 
    Document   : OrgonType
    Created on : 7 Feb, 2018, 11:13:39 AM
    Author     : Win
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Organ Type</title>
        </head>
        <body>
            <%
        String organId = "", organType = "";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String dname = request.getParameter("txtname");
                String upQuery = "update tbl_organs set organ_type='" + dname + "'where organ_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.ExecuteCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("OrganType.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_organs(organ_type) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.ExecuteCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("OrganType.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_organs where organ_id='" + request.getParameter("did") + "'";
            boolean b = obj.ExecuteCommand(del);
            if (b) {
                response.sendRedirect("OrganType.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_organs where organ_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectData(sel);
            while (rs1.next())
            {
               organId = rs1.getString("organ_id");
                organType = rs1.getString("organ_type");

            }

        }


    %>
  
        <h1 align="center">organs</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=organId%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        Organ Name
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=organType%>" required  >
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr><th>Sl.No</th><th>Organ Type</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_organs";
                            ResultSet rs = obj.selectData(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("organ_type")%></td>
                    <td><a href="OrganType.jsp?did=<%=rs.getString("organ_id")%>">Delete</a></td>
                    <td><a href="OrganType.jsp?eid=<%=rs.getString("organ_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>      
            
    </body>
</html>
