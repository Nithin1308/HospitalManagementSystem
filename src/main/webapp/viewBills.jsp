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

<title>View Bills</title>

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

text-decoration:none;

display:block;

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

background:#dc3545;

color:white;

}

.table tbody tr:hover{

background:#f2f2f2;

transition:0.3s;

}

.badge{

padding:8px 12px;

font-size:14px;

border-radius:10px;

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

<i class="fa-solid fa-money-bill"></i>

View Bills

</h2>

<a href="addBill.jsp"
class="btn btn-danger">

Generate Bill

</a>

</div>

<div class="table-responsive">

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>ID</th>

<th>Patient Name</th>

<th>Consultation Fee</th>

<th>Medicine Charge</th>

<th>Total Amount</th>

<th>Payment Status</th>

</tr>

</thead>

<tbody>

<%

try{

    Connection con =
            DBConnection.getConnection();

    Statement st =
            con.createStatement();

    String query =

    "SELECT b.id, " +

    "p.name AS patient_name, " +

    "b.consultation_fee, " +

    "b.medicine_charge, " +

    "b.total_amount, " +

    "b.status " +

    "FROM bills b " +

    "JOIN patients p " +

    "ON b.patient_id = p.id";

    ResultSet rs =
            st.executeQuery(query);

    while(rs.next()){

%>

<tr>

<td>

<%= rs.getInt("id") %>

</td>

<td>

<%= rs.getString("patient_name") %>

</td>

<td>

&#8377;
<%= rs.getDouble("consultation_fee") %>

</td>

<td>

&#8377;
<%= rs.getDouble("medicine_charge") %>

</td>

<td>

&#8377;
<%= rs.getDouble("total_amount") %>

</td>

<td>

<%

String status =
        rs.getString(
        "status"
        );

if(status != null &&
   status.equalsIgnoreCase("Paid")){

%>

<span class="badge bg-success">

Paid

</span>

<%

}else{

%>

<span class="badge bg-warning text-dark">

Pending

</span>

<%

}

%>

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