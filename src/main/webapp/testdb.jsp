<%@ page import="java.sql.*" %>
<%@ page import="com.hms.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Database Test</title>
</head>

<body>

<h2>Database Connection Test</h2>

<%

try{

    Connection con =
            DBConnection.getConnection();

    if(con != null){

%>

<h3 style="color:green;">

Database Connected Successfully ✅

</h3>

<%

    }else{

%>

<h3 style="color:red;">

Database Connection Failed ❌

</h3>

<%

    }

}catch(Exception e){

%>

<h3 style="color:red;">

ERROR:

</h3>

<pre>

<%= e %>

</pre>

<%

    e.printStackTrace();

}

%>

</body>
</html>