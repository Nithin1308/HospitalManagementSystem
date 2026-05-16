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
<title>Add Doctor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
body{
margin:0;
font-family:Arial,sans-serif;
background:linear-gradient(135deg,#dfe9f3 0%,#ffffff 100%);
overflow:hidden;
}
.sidebar{
width:250px;
height:100vh;
background:#212529;
position:fixed;
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
}
.sidebar .nav-link:hover{
background:#0d6efd;
}
.main-content{
margin-left:250px;
padding:30px;
height:100vh;
overflow-y:auto;
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
</style>
</head>
<body>
<div class="sidebar">
<h3><i class="fa-solid fa-hospital"></i> HMS</h3>
<a href="dashboard.jsp" class="nav-link">Dashboard</a>
<a href="addPatient.jsp" class="nav-link">Patients</a>
<a href="addDoctor.jsp" class="nav-link">Doctors</a>
<a href="addAppointment.jsp" class="nav-link">Appointments</a>
<a href="addBill.jsp" class="nav-link">Billing</a>
<a href="LogoutServlet" class="btn btn-danger w-100 mt-4">Logout</a>
</div>
<div class="main-content">
<div class="form-card">
<h2 class="text-center mb-4"><i class="fa-solid fa-user-doctor"></i> Add Doctor</h2>
<form action="AddDoctorServlet" method="post">
<div class="mb-3">
<label>Doctor Name</label>
<input type="text" name="name" class="form-control" required>
</div>
<div class="mb-3">
<label>Specialization</label>
<input type="text" name="specialization" class="form-control" required>
</div>
<div class="mb-3">
<label>Phone</label>
<input type="text" name="phone" class="form-control" required>
</div>
<button type="submit" class="btn btn-primary w-100">Add Doctor</button>
</form>
</div>
</div>
</body>
</html>