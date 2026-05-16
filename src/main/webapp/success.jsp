<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

if(session.getAttribute("username")==null){

    response.sendRedirect("login.jsp");

}

String message =
        request.getParameter(
        "msg"
        );

if(message == null){

    message =
    "Operation Completed Successfully";

}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Success</title>

<meta http-equiv="refresh"
content="3;URL=dashboard.jsp">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

body{

margin:0;

padding:0;

height:100vh;

display:flex;

justify-content:center;

align-items:center;

font-family:Arial,sans-serif;

background: linear-gradient(
135deg,
#d4fc79 0%,
#96e6a1 100%
);

overflow:hidden;

}

.success-card{

background:white;

padding:50px;

border-radius:25px;

text-align:center;

box-shadow:0px 4px 20px rgba(0,0,0,0.2);

width:450px;

animation:popup 0.5s ease;

}

@keyframes popup{

0%{

transform:scale(0.5);

opacity:0;

}

100%{

transform:scale(1);

opacity:1;

}

}

.success-icon{

font-size:80px;

color:#198754;

margin-bottom:20px;

}

.success-title{

font-size:32px;

font-weight:bold;

color:#198754;

margin-bottom:15px;

}

.success-msg{

font-size:18px;

color:#555;

margin-bottom:25px;

}

.btn-dashboard{

border-radius:12px;

padding:12px 25px;

font-size:18px;

}

.redirect-text{

margin-top:15px;

font-size:14px;

color:#666;

}

</style>

</head>

<body>

<div class="success-card">

<i class="fa-solid fa-circle-check success-icon"></i>

<div class="success-title">

Success!

</div>

<div class="success-msg">

<%= message %>

</div>

<a href="dashboard.jsp"
class="btn btn-success btn-dashboard">

Go To Dashboard

</a>

<div class="redirect-text">

Redirecting automatically in 3 seconds...

</div>

</div>

</body>

</html>