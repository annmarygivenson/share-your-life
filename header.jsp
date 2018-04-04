<%-- 
    Document   : header
    Created on : Mar 19, 2017, 2:03:30 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <div class="header_holder">
              <div class="logo"><img src="images/logo.png"></div>
            </div>
            <div id='cssmenu'>
                <ul>
                    <li><a href='HomePage.jsp'><span>Home</span></a></li>
                    <li class='active has-sub'><a href='#'><span>Settings</span></a>
                        <ul>
                            <li class='has-sub'><a href='MyProfile.jsp'><span>Profile</span></a></li>
                            <li class='has-sub'><a href='EditProfile.jsp'><span>EditProfile</span></a></li>
                            <li class='has-sub'><a href='ChangePassword.jsp'><span>ChangePassword</span></a></li>
                        </ul>
                    </li>
                    <li><a href="MedicalOfficer.jsp"><span>MedicalOfficer</span></a></li>
                    <li><a href="../Guest/Login.jsp"><span>Logout</span></a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="slider_holder">
                <img src="images/banner.jpg">
            </div>
        </div>
        <div class="container">
            <div class="content_area">
                <div class="menu_holder">
                    <ul class="vert-one">
                        <li><a href="MedicalOfficer.jsp" title="CSS Menus">MedicalOfficer</a></li>
                      
                    </ul>
                </div>
                <div class="content_holder">


