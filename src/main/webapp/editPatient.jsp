<%@ page import="java.sql.*" %>
<%@ page import="com.hms.util.DBConnection" %>

<%

int id =
Integer.parseInt(request.getParameter("id"));

Connection con =
        DBConnection.getConnection();

PreparedStatement ps =
        con.prepareStatement(

            "SELECT * FROM patients WHERE id=?"

        );

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Patient</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
</head>

<body>

<h2>Update Patient</h2>

<form action="UpdatePatientServlet" method="post">

<input type="hidden"
       name="id"
       value="<%= rs.getInt("id") %>">

Name:
<input type="text"
       name="name"
       value="<%= rs.getString("name") %>">

<br><br>

Age:
<input type="number"
       name="age"
       value="<%= rs.getInt("age") %>">

<br><br>

Gender:
<input type="text"
       name="gender"
       value="<%= rs.getString("gender") %>">

<br><br>

Contact:
<input type="text"
       name="contact"
       value="<%= rs.getString("contact") %>">

<br><br>

Disease:
<input type="text"
       name="disease"
       value="<%= rs.getString("disease") %>">

<br><br>

<input type="submit"
       value="Update Patient">

</form>

</body>
</html>