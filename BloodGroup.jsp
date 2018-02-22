<%-- 
    Document   : BloodGroup
    Created on : 7 Feb, 2018, 11:12:53 AM
    Author     : Win
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Blood Group</title>
        </head>
        <body>

        <%
        String bloodgroupId = "", bloodgroupType = "";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String dname = request.getParameter("txtname");
                String upQuery = "update tbl_bloodgroup set bloodgroup_type='" + dname + "'where bloodgroup_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.ExecuteCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("BloodGroup.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_bloodgroup(bloodgroup_type) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.ExecuteCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("BloodGroup.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_bloodgroup where bloodgroup_id='" + request.getParameter("did") + "'";
            boolean b = obj.ExecuteCommand(del);
            if (b) {
                response.sendRedirect("BloodGroup.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_bloodgroup where bloodgroup_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectData(sel);
            while (rs1.next())
            {
               bloodgroupId = rs1.getString("bloodgroup_id");
               bloodgroupType = rs1.getString("bloodgroup_type");

            }

        }


    %>
  
        <h1 align="center">BloodGroup</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=bloodgroupId%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        Blood Type
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=bloodgroupType%>" required  >
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
                <tr><th>Sl.No</th><th>BloodGroup Type</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_bloodgroup";
                            ResultSet rs = obj.selectData(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("bloodgroup_type")%></td>
                    <td><a href="BloodGroup.jsp?did=<%=rs.getString("bloodgroup_id")%>">Delete</a></td>
                    <td><a href="BloodGroup.jsp?eid=<%=rs.getString("bloodgroup_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>

    </body>
</html>

