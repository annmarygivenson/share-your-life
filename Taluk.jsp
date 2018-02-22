<%-- 
    Document   : Taluk
    Created on : 7 Feb, 2018, 11:14:07 AM
    Author     : Win
--%>
<jsp:useBean id="obj" class="db.DBConnection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taluk</title>
    </head>
    <body>
            <%
        String name="",did="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            
            name=request.getParameter("txt_taluk");
            did=request.getParameter("district");
            String insQry="insert into tbl_taluk(taluk_name,dist_id)values('"+name+"','"+did+"')";
            
            out.println(insQry);
            boolean b = obj.ExecuteCommand(insQry);
            
            
                if(b==true)
                {
                  response.sendRedirect("Taluk.jsp");
                }
                else
                {
                  out.println(insQry);
                }
        }
        
    %>
    
         <center><h1>Taluk</h1></center>
        <form>
            <table border="0" align="center">
                <tr>
                    <td>
                        Taluk Name
                    </td>
                    <td>
                        <input type="text" name="txt_taluk" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        District 
                    </td>
                    <td>
                        <select name="district" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_district";
                            ResultSet rs = obj.selectData(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("dist_id")%>">
                               <%=rs.getString("dist_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
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
                    <th>Taluk Name</th>
                    
                </tr>
                        <%int i = 1;
                            String sel = "select * from tbl_taluk";
                            ResultSet rs1 = obj.selectData(sel);
                            while (rs1.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("taluk_name")%></td>
                    
                    <%i++;
                        }


                    %>



            </table>
                            
                            
                            
                            
        </form>
</body>
            
       
</html>

        
        
        
        
        
        
        
        
        
        
   