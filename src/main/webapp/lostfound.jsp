<%@ page import="java.sql.*" %>
<%
if(session == null || session.getAttribute("sic") == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lost & Found</title>

<style>
body {
  font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(135deg,#eef2ff,#f8fafc);
}

.container {
  max-width:1100px;
  margin:auto;
  padding:20px;
}

.topbar {
  display:flex;
  justify-content:space-between;
  align-items:center;
  background:#111827;
  color:white;
  padding:15px;
  border-radius:12px;
}

.card {
  background:white;
  padding:25px;
  margin-top:20px;
  border-radius:16px;
  box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

input, textarea, select {
  width:100%;
  padding:12px;
  margin-top:10px;
  border-radius:10px;
  border:1px solid #ddd;
}

button {
  margin-top:15px;
  padding:12px;
  border:none;
  border-radius:10px;
  background:#16a34a;
  color:white;
  cursor:pointer;
}

button:hover {
  background:#15803d;
}

.item-card {
  margin-top:15px;
  padding:15px;
  border-radius:12px;
  background:#f9fafb;
  border-left:5px solid #16a34a;
}
</style>

</head>

<body>

<div class="container">

<div class="topbar">
<h2>Lost & Found</h2>
<button onclick="window.location.href='dashboard.jsp'">Back</button>
</div>

<div class="card">
<h3>Add Item</h3>

<form action="LostFoundServlet" method="post">
<input name="item_name" placeholder="Item Name" required>
<textarea name="description" placeholder="Description" required></textarea>
<select name="type">
<option value="lost">Lost</option>
<option value="found">Found</option>
</select>
<button type="submit">Submit</button>
</form>
</div>

<div class="card">
<h3>Items</h3>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/campus_db","root","Pabitra2458#");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM lost_found ORDER BY item_id DESC");

while(rs.next()){
%>

<div class="item-card">
<b><%= rs.getString("item_name") %></b><br>
<%= rs.getString("description") %><br>
<small>SIC: <%= rs.getString("sic") %></small><br>
<small>Status: <%= rs.getString("type") %></small>
</div>

<%
}
con.close();
%>

</div>

</div>

</body>
</html>