<%--
    Document   : HospitalRegistration
    Created on : 15 Feb, 2018, 11:24:03 AM
    Author     : Win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj"  class="db.DBConnection"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.ResultSet"%>
        <title>hospital registration</title>
    </head>
    <body>
        <%
            String hospitalid = "";
            String hospitalname = "";
            String email = "";
            String contactnumber = "";
            String address = "";
            String place = "";

            if (request.getParameter("btnsub") != null) {
                String hname = request.getParameter("txtname");
                String ename = request.getParameter("txtemail");
                String cnumber = request.getParameter("txtcontactnmber");
                String aaddress = request.getParameter("txtaddress");
                String pplace = request.getParameter("txtplace");
                String TID = request.getParameter("ddltaluk");

                if (!request.getParameter("hid").equals("")) {

                    String upQuery = "update tbl_hospital set hospital_name='" + hname + "',hospital_email='" + ename + "',hospital_contactnumber='" + cnumber + "',hospital_address='" + aaddress + "',hospital_place='" + pplace + "' where hospital_id='" + request.getParameter("hid") + "'";
                    out.println(upQuery);
                    boolean b = obj.ExecuteCommand(upQuery);
                    if (b == true) {
                        response.sendRedirect("HospitalRegistration.jsp");
                    } else {
                        out.println(upQuery);
                    }
                } else {

                   
                    String insQry = "insert into tbl_hospital(hospital_name,hospital_email,hospital_contactnumber,hospital_place,taluk_id,hospital_address) values('" + hname + "','" + ename + "','" + cnumber + "','" + pplace + "','" + TID + "','"+aaddress+"')";
                    //out.println(insQry);
                    boolean b = obj.ExecuteCommand(insQry);
                    if (b == true) {
                        response.sendRedirect("HospitalRegistration.jsp");
                    } else {
                        //out.println(insQry);
                    }
                }
            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_hospital where hospital_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b) {
                    response.sendRedirect("HospitalRegistration.jsp");
                } else {
                    out.print(del);
                }
            }

            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_hospital where hospital_id='" + request.getParameter("eid") + "'";
                ResultSet rs1 = obj.selectData(sel);
                while (rs1.next()) {
                    hospitalid = rs1.getString("hospital_id");
                    hospitalname = rs1.getString("hospital_name");

                }

            }


        %>

        <h1 align="center">hospital</h1>


        <form>
            <input type="hidden" name="hid" value="<%=hospitalid%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        TalukName 
                    </td>
                    <td>
                        <select name="ddltaluk" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                                String str = "select * from tbl_taluk";
                                ResultSet rs = obj.selectData(str);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("taluk_id")%>">
                                <%=rs.getString("taluk_name")%>
                            </option>
                            <%
                                }
                            %>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        HospitalName
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=hospitalname%>" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input type="text" name="txtemail" value="<%=email%>" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        ContactNumber
                    </td>
                    <td>
                        <input type="text" name="txtcontactnmber" value="<%=contactnumber%>" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <input type="text" name="txtaddress" value="<%=address%>" required  >
                    </td>
                </tr>

                <tr>
                    <td>
                        PlaceName
                    </td>
                    <td>
                        <input type="text" name="txtplace" value="<%=place%>" required  >
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
                <tr>
                    <th>Sl.No</th>
                    <th>DistrictName</th>
                    <th>TalukName</th>
                    <th>HospitalName</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Address</th>
                </tr>
                <%int i = 1;
                    String sel = "select * from tbl_hospital h inner join tbl_taluk t on h.taluk_id=t.taluk_id inner join tbl_district d on d.dist_id=t.dist_id";
                    ResultSet rs1 = obj.selectData(sel);
                    while (rs1.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("dist_name")%></td>
                    <td><%=rs1.getString("taluk_name")%></td>
                    <td><%=rs1.getString("hospital_name")%></td>
                    <td><%=rs1.getString("hospital_contactnumber")%></td>
                    <td><%=rs1.getString("hospital_email")%></td>
                    <td><%=rs1.getString("hospital_address")%></td>
                    <td><a href="HospitalRegistration.jsp?did=<%=rs1.getString("hospital_id")%>">Delete</a></td>
                    <td><a href="HospitalRegistration.jsp?eid=<%=rs1.getString("hospital_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>

    </body>
</html>
