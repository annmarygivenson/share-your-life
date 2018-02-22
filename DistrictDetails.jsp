<%-- 
    Document   : DistrictDetails
    Created on : 7 Feb, 2018, 11:13:16 AM
    Author     : Win
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>DistrictDetails.jsp</title>
        </head>
        <body>
       <%
        String distId = "", distName = "";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String dname = request.getParameter("txtname");
                String upQuery = "update tbl_district set dist_name='" + dname + "'where dist_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.ExecuteCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("DistrictDetails.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_district(dist_name) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.ExecuteCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("DistrictDetails.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_district where dist_id='" + request.getParameter("did") + "'";
            boolean b = obj.ExecuteCommand(del);
            if (b) {
                response.sendRedirect("DistrictDetails.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_district where dist_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectData(sel);
            while (rs1.next())
            {
                distId = rs1.getString("dist_id");
                distName = rs1.getString("dist_name");

            }

        }


    %>
  
        <h1 align="center">District</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=distId%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        District Name
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=distName%>" required  >
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
                <tr><th>Sl.No</th><th>District Name</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_district";
                            ResultSet rs = obj.selectData(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("dist_name")%></td>
                    <td><a href="DistrictDetails.jsp?did=<%=rs.getString("dist_id")%>">Delete</a></td>
                    <td><a href="DistrictDetails.jsp?eid=<%=rs.getString("dist_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>

    </body>
</html>



