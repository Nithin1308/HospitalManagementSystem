<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Hospital Management System</title>

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

background:
linear-gradient(
rgba(0,0,0,0.5),
rgba(0,0,0,0.5)
),

url('https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=1920&auto=format&fit=crop');

background-size:cover;

background-position:center;

overflow:hidden;

}

.login-card{

width:400px;

padding:40px;

border-radius:20px;

background:rgba(255,255,255,0.15);

backdrop-filter:blur(10px);

box-shadow:0px 4px 20px rgba(0,0,0,0.3);

color:white;

}

.login-card h2{

text-align:center;

margin-bottom:30px;

font-weight:bold;

}

.form-control{

height:45px;

border-radius:10px;

border:none;

}

.input-group-text{

border:none;

border-radius:10px 0 0 10px;

background:#0d6efd;

color:white;

}

.btn-login{

width:100%;

height:45px;

border-radius:10px;

font-size:18px;

font-weight:bold;

background:#0d6efd;

border:none;

transition:0.3s;

}

.btn-login:hover{

background:#084298;

}

.hospital-icon{

font-size:60px;

text-align:center;

display:block;

margin-bottom:15px;

}

.alert{

border-radius:10px;

}

</style>

</head>

<body>

<div class="login-card">

<i class="fa-solid fa-hospital hospital-icon"></i>

<h2>Hospital Management System</h2>

<!-- ERROR MESSAGE -->

<%

String error =
        request.getParameter(
        "error"
        );

if(error != null){

%>

<div class="alert alert-danger text-center">

Invalid Username or Password

</div>

<%

}

%>

<form action="LoginServlet"
method="post">

<!-- USERNAME -->

<div class="mb-3">

<label class="mb-2">

Username

</label>

<div class="input-group">

<span class="input-group-text">

<i class="fa-solid fa-user"></i>

</span>

<input type="text"
name="username"
class="form-control"
placeholder="Enter Username"
required>

</div>

</div>

<!-- PASSWORD -->

<div class="mb-4">

<label class="mb-2">

Password

</label>

<div class="input-group">

<span class="input-group-text">

<i class="fa-solid fa-lock"></i>

</span>

<input type="password"
name="password"
class="form-control"
placeholder="Enter Password"
required>

</div>

</div>

<!-- BUTTON -->

<button type="submit"
class="btn btn-login text-white">

Login

</button>

</form>

</div>

</body>

</html>