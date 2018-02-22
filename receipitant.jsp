<%-- 
    Document   : receipitant.jsp
    Created on : 15 Feb, 2018, 7:50:23 AM
    Author     : Win
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>recepitant</title>
    </head>
    <body>
        <%
            String recepitantname = "";
            String taluk = "";
            String adrs = "";
            String email = "";
            String Contactnumber = "";
            String age = "";
            String bloodgrouptype = "";
            String Gender = "";
            String username = "";
            String password = "";
            String logid = "";
            if (request.getParameter("btnsubmit") != null) {
                recepitantname = request.getParameter("txtname");
                taluk = request.getParameter("taluk");
                adrs = request.getParameter("txtaddress");
                email = request.getParameter("txtemail");
                Contactnumber = request.getParameter("txtnumber");
                age = request.getParameter("txtage");
                bloodgrouptype = request.getParameter("txtbloodgrouptype");
                Gender = request.getParameter("txtgender");
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

                    String ins = "insert into tbl_recepitant(recepitant_name,taluk_id,address,email,contactnumber,age,bloodgroup_type,gender,username,password)"
                            + "values('" + recepitantname + "','" + taluk + "','" + adrs + "','" + email + "','" + Contactnumber + "','" + age + "','"+ bloodgrouptype + "','" + Gender + "','" + username + "','" + password + "')";

                    boolean b1 = obj.ExecuteCommand(ins);

                    if (b1 == true) {
        %>
        <script type="text/javascript">
            alert("registered successfully");
        </script>
        <%
                    } else {
                        out.println(ins);
                    }
                }

            }
        %>

        <form name="frm_recepitantregistration">    
            <table>
                <tr>    
                    <td>recepitant name </td>
                    <td><input type="text"  name="txtname" placeholder="Enter the name"></td>
                </tr>

                <td>address</td>
                <td><input type="text"  name="txtaddress"> </td>
                </tr>

                <tr>
                    <td>email </td>
                    <td><input type="text"  name="txtemail" ></td>
                </tr>
                <tr>
                    <td>contact number </td>
                    <td><input type="text"  name="txtnumber" ></td>
                </tr>
                <tr>
                    <td>age </td>
                    <td><input type="text"  name="txtage" ></td>
                </tr>

                <tr>
                    <td>bloodgrouptype </td>
                    <td><input type="text"  name="txtbloodgrouptype" ></td>
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
                            <%String str = "select * from tbl_taluk";
                                ResultSet rs = obj.selectData(str);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("taluk_id")%>"><%=rs.getString("taluk_name")%>
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
