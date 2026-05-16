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

<title>Book Appointment</title>

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

<i class="fa-solid fa-calendar-check"></i>

Book Appointment

</h2>

<form action="AddAppointmentServlet"
method="post">

<!-- PATIENT -->

<div class="mb-3">

<label>Select Patient</label>

<select name="patient_id"
class="form-control"
required>

<option value="">Choose Patient</option>

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

<option value="<%= rs.getInt("id") %>">

<%= rs.getString("name") %>

</option>

<%

    }

}catch(Exception e){

    out.println(e);

}

%>

</select>

</div>

<!-- DOCTOR -->

<div class="mb-3">

<label>Select Doctor</label>

<select name="doctor_id"
class="form-control"
required>

<option value="">Choose Doctor</option>

<%

try{

    Connection con =
            DBConnection.getConnection();

    Statement st =
            con.createStatement();

    ResultSet rs =
            st.executeQuery(
            "SELECT * FROM doctors"
            );

    while(rs.next()){

%>

<option value="<%= rs.getInt("id") %>">

<%= rs.getString("name") %>

</option>

<%

    }

}catch(Exception e){

    out.println(e);

}

%>

</select>

</div>

<!-- DATE -->

<div class="mb-3">

<label>Appointment Date</label>

<input type="date"
name="appointment_date"
class="form-control"
required>

</div>

<!-- TIME -->

<div class="mb-3">

<label>Appointment Time</label>

<input type="time"
name="appointment_time"
class="form-control"
required>

</div>

<button type="submit"
class="btn btn-primary w-100">

Book Appointment

</button>

</form>

</div>

</div>

</body>

</html>