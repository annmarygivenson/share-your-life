<%-- 
    Document   : OfficerRegistration
    Created on : 21 Feb, 2018, 3:10:46 PM
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
        
        <%
            String healthofficername = "";
            String taluk = "";
            String Address = "";
            String Contactno = "";
            String Gender = "";
            String email = "";
            String username = "";
            String password = "";
            String logid = "";
            if (request.getParameter("btnsubmit") != null) {
                healthofficername = request.getParameter("txtname");
                taluk = request.getParameter("taluk");
                Address = request.getParameter("txtaddress");
                Contactno = request.getParameter("txtnumber");
                Gender = request.getParameter("txtgender");
                email = request.getParameter("txtemail");
                username = request.getParameter("txtusername");
                password = request.getParameter("txtpassword");

                String in = "insert into tbl_login (user_name,password,user_type) values('" + username + "','" + password + "','health officer')";
                boolean b = obj.ExecuteCommand(in);
                if (b == true) {
                    String sel = "select max(login_id) as login from tbl_login";
                    ResultSet rs = obj.selectData(sel);
                    if (rs.next()) {
                        logid = rs.getString("login");
                    }
                }
                String insQry = "insert into tbl_healthofficer(healthofficername,taluk_id,address,contactnumber,gender,email,login_id)values('" + healthofficername + "','" + taluk + "','" + Address + "','" + Contactno + "','" + Gender + "','" + email + "','" + logid + "')";

                boolean b1 = obj.ExecuteCommand(insQry);

                if (b1 == true) {
        %>
        <script type="text/javascript">
            alert("registered successfully");
        </script>
        <%
                } else {
                    out.println(insQry);
                }
            }


        %>

        <form name="frm_medicalofficerreg">    
            <table>
                <tr>    
                    <td>Officer name</td>
                    <td><input type="text"  name="txtname" placeholder="Enter the name"></td>
                </tr>
                <tr>    
                    <td>Address</td>
                    <td><input type="text"  name="txtaddress"> </td>
                </tr>

                <tr>    
                    <td>contact number</td>
                    <td><input type="text"  name="txtnumber" ></td>
                </tr>
                <tr>
                    <td>Email Id </td>
                    <td><input type="text"  name="txtemail" ></td>
                </tr>

                <tr>
                    <td>Gender</td>
                    <td><input type="radio"  name="txtgender" value="male">Male
                        <input type="radio"  name="txtgender" value="female">Female</td>
                </tr>

                <tr>
                    <td>
                        taluk
                    </td>
                    <td>
                        <select name="taluk" >
                            <option value="">
                                --select--
                            </option>
                            <%                             String str = "select * from tbl_taluk";
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



                <tr>    
                    <td>Username</td>
                    <td><input type="text"  name="txtusername" placeholder="Enter the user name"></td>
                </tr>
                <tr>    
                    <td>password</td>
                    <td><input type="password"  name="txtpassword" placeholder="Enter the password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="register"></td>
                </tr>
            </table>
        </form>






    </body>
</html>
