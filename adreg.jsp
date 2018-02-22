<%-- 
    Document   : newjsp
    Created on : 7 Feb, 2018, 1:43:35 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>familycourt::AdvocateDetails</title>
    </head>
    
   
     <body bgcolor="pink">
        
        <h1><font color="blue"><center>Advocate Details</center></font></h1>
         <%
            String name="",nam="";
            String adrs="",adr="";
            String disid="", dsname="";
            String email="",emai="";
            String cno="",cn="";
             String age="",ag="";
             String exp="",ex="";
              String qua="",qu="";
            
            
            String couid="", couname="";
            String casid="", casname="";
            String editID="";
            String cid="";
            String usern="",passw="";
            String logid="";
             if (request.getParameter("eid") != null) 
             {
                String sel = "select * from tbl_advocate a inner join tbl_district d inner join tbl_court c inner join tbl_casecategory e on a.dist_id=d.dist_id and a.court_id=c.court_id and a.case_id=e.case_id where adv_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectData(sel);
               while (rs.next())
                {
                    cid= rs.getString("adv_id");
                    name= rs.getString("adv_name");
                   adrs= rs.getString("adv_adrs");
                   disid=rs.getString("dist_id");
                    email= rs.getString("adv_email");
                    cno= rs.getString("adv_cno");
                    age= rs.getString("adv_age");
                    exp= rs.getString("adv_exp");
                    qua= rs.getString("adv_qua");
        
                    
                  
                  
                  couid=rs.getString("court_id");
                  casid=rs.getString("case_id");
                    editID=request.getParameter("eid");
                    out.print(editID);
                    
                }

            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_advocate where adv_id='" + request.getParameter("did") + "'";
                boolean b = obj.ExecuteCommand(del);
                if (b==true)
                {
                    response.sendRedirect("AddAdvocate.jsp");
                } else {
                    out.print(del);
                }

            }

            if(request.getParameter("btn_submit")!=null)
          
            
          
            {
                
                
                
                 nam=request.getParameter("name");
                        adr=request.getParameter("dname");
                         dsname=request.getParameter("dsnam");
                        emai=request.getParameter("sname");
                        cn=request.getParameter("pname");
                        ag=request.getParameter("aname");
                        ex=request.getParameter("enameee");
                       qu=request.getParameter("qname");
                       
                        couname=request.getParameter("counam");
                        casname=request.getParameter("casnam");
                        usern=request.getParameter("user");
                        passw=request.getParameter("pass");
                  String hh=request.getParameter("hid");
                       
                    if (!hh.equals("")) 
                         {
                    String up = "update tbl_advocate set adv_name='"+nam+"',adv_adrs='"+adr+"',dist_id='"+dsname+"',adv_email='"+emai+"',adv_cno='"+cn+"',adv_age='"+ag+"',adv_exp='"+ex+"',adv_qua='"+qu+"',court_id='"+couname+"',case_id='"+casname+"' where adv_id='" + request.getParameter("hid") + "'";
                    boolean b = obj.ExecuteCommand(up);
                        
                  
                } else {

                        
                        
                        String insQry1="insert into tbl_login(username,password,type)values('"+usern+"','"+passw+"','Advocate')";
                         boolean b2=obj.ExecuteCommand(insQry1);
                         
                         String sel="select max(login_id) as login from tbl_login";
                         ResultSet rs4=obj.selectData(sel);
                         if(rs4.next())
                         {
                              logid=rs4.getString("login");
                         }

                        String insQry="insert into tbl_advocate(adv_name,adv_adrs,dist_id,adv_email,adv_cno,adv_age,adv_exp,adv_qua,court_id,case_id,login_id)values('"+nam+"','"+adr+"','"+dsname+"','"+emai+"','"+cn+"','"+ag+"','"+ex+"','"+qu+"','"+couname+"','"+casname+"','"+logid+"')";
                        
            

                       boolean b= obj.ExecuteCommand(insQry);
                       
                 
                  
                }
        }
 
    %>

                   
                
            

                 
            
            
     
        
        
       <form name="frm_adc">
              <input type="hidden" name="hid" value="<%=editID%>">
            
            <table class="table table-hover" align="center">
                <tr>
                    <td>Name:
                    <td>
                        <input type="text" name="name" value="<%=name%>" >
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Address:
                    <td>
                        <input type="text" name="dname" value="<%=adrs%>">
                        
                    </td>
                    </td>
                </tr><tr>
            <td> District :</td>
            <td><select name="dsnam">
                    <option value="sel">--Select--</option>
                    <%
                        String sel="select *from tbl_district";
                         ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                        String id=rs.getString("dist_id");   
                    %>
                    <option <% if(disid.equals(id)){%> selected=""<%}%> value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                
                
            </td>
        </tr>
        
      
                
                <tr>
                    <td>E-Mail:
                    <td>
                        <input type="text" name="sname"value="<%=email%>" >
                        
                    </td>
                    </td>
                </tr><tr>
                    <td>Contact Number :
                    <td>
                        <input type="text" name="pname" value="<%=cno%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Age :
                    <td>
                        <input type="text" name="aname" value="<%=age%>">
                        
                    </td>
                    </td>
                </tr>
                
                <tr>
                    <td>Experience :
                    <td>
                        <input type="text" name="enameee" value="<%=exp%>">
                        
                    </td>
                    </td>
                </tr>
                <tr>
                    <td>Qualification :
                    <td>
                        <input type="text" name="qname" value="<%=qua%>">
                        
                    </td>
                    </td>
                </tr>
               <tr>
                   <td>Court Name :</td>
                    <td><select name="counam">
                    <option value="sele">--Select--</option>
                    <%
                        String sele="select *from tbl_court";
                         ResultSet rs1=obj.selectData(sele);
                        while(rs1.next())
                        {
                        String id=rs1.getString("court_id");   
                    %>
                    <option <% if(couid.equals(id)){%> selected=""<%}%> value="<%=rs1.getString("court_id")%>"><%=rs1.getString("court_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                              </select>
                </td>
                </tr>
                 <tr>
                     <td>Case Category :</td>
                    <td><select name="casnam">
                    <option value="selec">--Select--</option>
                    <%
                        String selec="select *from tbl_casecategory";
                         ResultSet rs2=obj.selectData(selec);
                        while(rs2.next())
                        {
                        String id=rs2.getString("case_id");   
                    %>
                    <option <% if(casid.equals(id)){%> selected=""<%}%> value="<%=rs2.getString("case_id")%>"><%=rs2.getString("case_name")%></option>
                  
                          
                           
                    
                    <%
                       }
                    %>
        
                        </select></td>
                               </tr>
                                <tr>
                    <td>User Name :
                    <td>
                        <input type="text" name="user">
                        
                    </td>
                    </td>
                </tr>
                 <tr>
                    <td>Password :
                    <td>
                        <input type="text" name="pass">
                        
                    </td>
                    </td>
                </tr>
                
               
                
               
               
                <tr><td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="SUBMIT">
                          <input type="submit" name="btn_reset" value="CANCEL">
                    </td></tr>
            </table>
        </form>
                     <table  align="center" border="1">
            <tr>
                <th>sl no</th>
                <th> Name</th>
           <th>Address</th>
        <th>District</th>
        <th>E-mail</th>
           <th>Contact Number</th>
           <th>Age</th>
           <th>Experience</th>
           <th>Qualification</th>
           <th>Court Name</th>
           <th>Case Category</th>
                      

            </tr>
    
        <%
            
            String CID="";
            int i=1;
            String selQry="select * from tbl_advocate a inner join tbl_district d inner join tbl_court c inner join tbl_casecategory e on a.dist_id=d.dist_id and a.court_id=c.court_id and a.case_id=e.case_id";
            ResultSet rs3=obj.selectData(selQry);
            while(rs3.next())
            {
               CID=rs3.getString("adv_id");
                
        %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs3.getString("adv_name")%></td>
                   <td><%=rs3.getString("adv_adrs")%></td>
                   <td><%=rs3.getString("dist_name")%></td>
                   <td><%=rs3.getString("adv_email")%></td>
                   <td><%=rs3.getString("adv_cno")%></td>
                   <td><%=rs3.getString("adv_age")%></td>
                   <td><%=rs3.getString("adv_exp")%></td>
                   <td><%=rs3.getString("adv_qua")%></td>
                                    
                                    <td><%=rs3.getString("court_name")%></td>
                   <td><%=rs3.getString("case_name")%></td>
  
                 <td><a href="AddAdvocate.jsp?did=<%=CID%>">Delete</a></td>
                 <td><a href="AddAdvocate.jsp?eid=<%=CID%>">Edit</a></td>
         
               </tr>
               <%
               
               i++;
                
            }
        %>
                     </table>


       
    </body>
</html>
        
        
        
        
        
   