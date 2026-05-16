<%@ page import="java.sql.*" %>
<%@ page import="com.hms.util.DBConnection" %>

<%

if(session.getAttribute("username")==null){

    response.sendRedirect("login.jsp");

}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>View Patients</title>

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

.table-card{

background:white;

padding:30px;

border-radius:20px;

box-shadow:0px 2px 10px rgba(0,0,0,0.1);

}

.table{

border-radius:10px;

overflow:hidden;

}

.table thead{

background:#0d6efd;

color:white;

}

.table tbody tr:hover{

background:#f2f2f2;

transition:0.3s;

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

<div class="table-card">

<div class="d-flex justify-content-between align-items-center mb-4">

<h2>

<i class="fa-solid fa-bed-pulse"></i>

View Patients

</h2>

<a href="addPatient.jsp"
class="btn btn-primary">

Add New Patient

</a>

</div>

<div class="table-responsive">

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>ID</th>

<th>Name</th>

<th>Age</th>

<th>Gender</th>

<th>Disease</th>

<th>Actions</th>

</tr>

</thead>

<tbody>

<%

try{

    Connection con =
            DBConnection.getConnection();

    Statement st =
            con.createStatement();

    ResultSet rs =
            st.executeQuery(
            "SELECT * FROM patients"
            );

    while(rs.next()){

%>

<tr>

<td>

<%= rs.getInt("id") %>

</td>

<td>

<%= rs.getString("name") %>

</td>

<td>

<%= rs.getInt("age") %>

</td>

<td>

<%= rs.getString("gender") %>

</td>

<td>

<%= rs.getString("disease") %>

</td>
<td>

<a href="editPatient.jsp?id=<%= rs.getInt("id") %>"
class="btn btn-warning btn-sm">

Edit

</a>

<a href="DeletePatientServlet?id=<%= rs.getInt("id") %>"
class="btn btn-danger btn-sm"
onclick="return confirm('Are you sure?')">

Delete

</a>

</td>
</tr>

<%

    }

}catch(Exception e){

    out.println(e);

}

%>

</tbody>

</table>

</div>

</div>

</div>

</body>

</html>