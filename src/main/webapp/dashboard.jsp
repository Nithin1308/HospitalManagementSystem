<%@ page import="java.sql.*" %>
<%@ page import="com.hms.util.DBConnection" %>

<%

response.setHeader(
        "Cache-Control",
        "no-cache, no-store, must-revalidate"
);

if(session.getAttribute("username")==null){

    response.sendRedirect("login.jsp");

}

int patientCount = 0;

int doctorCount = 0;

int appointmentCount = 0;

double totalRevenue = 0;

try {

    Connection con =
            DBConnection.getConnection();

    Statement st =
            con.createStatement();

    ResultSet rs1 =
            st.executeQuery(
            "SELECT COUNT(*) FROM patients"
            );

    if(rs1.next()) {

        patientCount = rs1.getInt(1);

    }

    ResultSet rs2 =
            st.executeQuery(
            "SELECT COUNT(*) FROM doctors"
            );

    if(rs2.next()) {

        doctorCount = rs2.getInt(1);

    }

    ResultSet rs3 =
            st.executeQuery(
            "SELECT COUNT(*) FROM appointments"
            );

    if(rs3.next()) {

        appointmentCount = rs3.getInt(1);

    }

    ResultSet rs4 =
            st.executeQuery(
            "SELECT SUM(total_amount) FROM bills"
            );

    if(rs4.next()) {

        totalRevenue = rs4.getDouble(1);

    }

} catch(Exception e) {

    out.println(e);

}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Dashboard</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

body{

background: linear-gradient(
135deg,
#dfe9f3 0%,
#ffffff 100%
);

font-family: Arial, sans-serif;

height:100vh;

margin:0;

overflow:hidden;

}

.dashboard-title{

font-weight: bold;

color: #333;

}

.stats-card{

border: none;

border-radius: 15px;

transition: 0.3s;

}

.stats-card:hover{

transform: translateY(-5px);

}

.module-card{

border: none;

border-radius: 15px;

transition: 0.3s;

}

.module-card:hover{

transform: scale(1.03);

}

.card-body i{

font-size: 40px;

margin-bottom: 10px;

}

.btn{

border-radius: 10px;

}

.sidebar{

width:250px;

height:100vh;

background:#212529;

position:fixed;

left:0;

top:0;

overflow-y:auto;

z-index:1000;

}

.sidebar .nav-link{

color:white;

font-size:16px;

padding:10px;

border-radius:10px;

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

width:calc(100% - 250px);

}

.top-header{

background:white;

padding:20px;

border-radius:15px;

box-shadow:0px 2px 10px rgba(0,0,0,0.1);

margin-bottom:30px;

}

.row{

margin-left:0;

margin-right:0;

}

.footer{

background:white;

border-radius:15px;

box-shadow:0px 2px 10px rgba(0,0,0,0.1);

}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar text-white p-3">

<h3 class="text-center mb-4">

<i class="fa-solid fa-hospital"></i>

HMS

</h3>

<hr>

<ul class="nav flex-column">

<li class="nav-item mb-3">

<a href="dashboard.jsp"
class="nav-link">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

</li>

<li class="nav-item mb-3">

<a href="addPatient.jsp"
class="nav-link">

<i class="fa-solid fa-bed-pulse"></i>

Patients

</a>

</li>

<li class="nav-item mb-3">

<a href="addDoctor.jsp"
class="nav-link">

<i class="fa-solid fa-user-doctor"></i>

Doctors

</a>

</li>

<li class="nav-item mb-3">

<a href="addAppointment.jsp"
class="nav-link">

<i class="fa-solid fa-calendar-check"></i>

Appointments

</a>

</li>

<li class="nav-item mb-3">

<a href="addBill.jsp"
class="nav-link">

<i class="fa-solid fa-money-bill"></i>

Billing

</a>

</li>

<li class="nav-item mt-5">

<a href="LogoutServlet"
class="btn btn-danger w-100">

Logout

</a>

</li>

</ul>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

<!-- TOP HEADER -->

<div class="top-header d-flex justify-content-between align-items-center">

<div>

<h2 class="dashboard-title">

<i class="fa-solid fa-gauge"></i>

Dashboard

</h2>

<p class="text-muted">

Hospital Management System

</p>

</div>

<div class="text-end">

<h5>

Welcome,
<%= session.getAttribute("username") %>

</h5>

<p id="datetime"
class="text-muted">

</p>

</div>

</div>

<!-- STATISTICS CARDS -->

<div class="row mb-4">

<div class="col-md-3">

<div class="card bg-primary text-white shadow stats-card">

<div class="card-body text-center">

<i class="fa-solid fa-bed-pulse"></i>

<h5>Total Patients</h5>

<h2>

<%= patientCount %>

</h2>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card bg-success text-white shadow stats-card">

<div class="card-body text-center">

<i class="fa-solid fa-user-doctor"></i>

<h5>Total Doctors</h5>

<h2>

<%= doctorCount %>

</h2>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card bg-warning text-dark shadow stats-card">

<div class="card-body text-center">

<i class="fa-solid fa-calendar-check"></i>

<h5>Total Appointments</h5>

<h2>

<%= appointmentCount %>

</h2>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card bg-danger text-white shadow stats-card">

<div class="card-body text-center">

<i class="fa-solid fa-indian-rupee-sign"></i>

<h5>Total Revenue</h5>

<h2>

&#8377; <%= totalRevenue %>

</h2>

</div>

</div>

</div>

</div>

<!-- MODULE CARDS -->

<div class="row mt-4">

<div class="col-md-3">

<div class="card shadow module-card">

<div class="card-body text-center">

<h5>Patients</h5>

<a href="addPatient.jsp"
class="btn btn-primary btn-sm">

Add Patient

</a>

<br><br>

<a href="viewPatients.jsp"
class="btn btn-success btn-sm">

View Patients

</a>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card shadow module-card">

<div class="card-body text-center">

<h5>Doctors</h5>

<a href="addDoctor.jsp"
class="btn btn-primary btn-sm">

Add Doctor

</a>

<br><br>

<a href="viewDoctors.jsp"
class="btn btn-success btn-sm">

View Doctors

</a>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card shadow module-card">

<div class="card-body text-center">

<h5>Appointments</h5>

<a href="addAppointment.jsp"
class="btn btn-primary btn-sm">

Book Appointment

</a>

<br><br>

<a href="viewAppointments.jsp"
class="btn btn-success btn-sm">

View Appointments

</a>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card shadow module-card">

<div class="card-body text-center">

<h5>Billing</h5>

<a href="addBill.jsp"
class="btn btn-primary btn-sm">

Generate Bill

</a>

<br><br>

<a href="viewBills.jsp"
class="btn btn-success btn-sm">

View Bills

</a>

</div>

</div>

</div>

</div>

<!-- FOOTER -->

<div class="footer text-center mt-5 p-3">

© 2026 Hospital Management System |

Developed by Nithin

</div>

</div>

<script>

function updateDateTime(){

let now = new Date();

document.getElementById(
"datetime"
).innerHTML =
now.toLocaleString();

}

setInterval(
updateDateTime,
1000
);

updateDateTime();

</script>

</body>

</html>