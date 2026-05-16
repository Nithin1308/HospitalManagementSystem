<%@ page session="true" %>

<%

if(session.getAttribute("username")==null){

    response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Patient</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

body{

margin:0;

font-family: Arial, sans-serif;

background: linear-gradient(
135deg,
#dfe9f3 0%,
#ffffff 100%
);

overflow:hidden;

}

.sidebar{

width:250px;

height:100vh;

background:#212529;

position:fixed;

left:0;

top:0;

padding:20px;

}

.sidebar h3{

color:white;

text-align:center;

margin-bottom:30px;

}

.sidebar .nav-link{

color:white;

padding:12px;

border-radius:10px;

margin-bottom:10px;

transition:0.3s;

}

.sidebar .nav-link:hover{

background:#0d6efd;

}

.main-content{

margin-left:250px;

height:100vh;

overflow-y:auto;

padding:30px;

}

.form-card{

background:white;

padding:30px;

border-radius:20px;

box-shadow:0px 2px 10px rgba(0,0,0,0.1);

max-width:700px;

margin:auto;

}

.form-control{

border-radius:10px;

height:45px;

}

.btn{

border-radius:10px;

}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

<h3>

<i class="fa-solid fa-hospital"></i>

HMS

</h3>

<a href="dashboard.jsp"
class="nav-link">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

<a href="addPatient.jsp"
class="nav-link">

<i class="fa-solid fa-bed-pulse"></i>

Patients

</a>

<a href="addDoctor.jsp"
class="nav-link">

<i class="fa-solid fa-user-doctor"></i>

Doctors

</a>

<a href="addAppointment.jsp"
class="nav-link">

<i class="fa-solid fa-calendar-check"></i>

Appointments

</a>

<a href="addBill.jsp"
class="nav-link">

<i class="fa-solid fa-money-bill"></i>

Billing

</a>

<a href="LogoutServlet"
class="btn btn-danger w-100 mt-4">

Logout

</a>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

<div class="form-card">

<h2 class="text-center mb-4">

<i class="fa-solid fa-bed-pulse"></i>

Add Patient

</h2>

<form action="AddPatientServlet"
method="post">

<div class="mb-3">

<label>Patient Name</label>

<input type="text"
name="name"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Age</label>

<input type="number"
name="age"
class="form-control"
required>

</div>

<div class="mb-3">

<label>Gender</label>

<select name="gender"
class="form-control"
required>

<option value="">Select Gender</option>

<option>Male</option>

<option>Female</option>

<option>Other</option>

</select>

</div>

<div class="mb-3">

<label>Disease</label>

<input type="text"
name="disease"
class="form-control"
required>

</div>

<button type="submit"
class="btn btn-primary w-100">

Add Patient

</button>

</form>

</div>

</div>

</body>

</html>