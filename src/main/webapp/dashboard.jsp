<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if(session == null || session.getAttribute("sic") == null){
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }

body {
  background: #f4f7fb;
  color: #222;
}

#dashboardPage {
  min-height: 100vh;
  padding: 20px;
}

.dashboard-container {
  max-width: 1100px;
  margin: auto;
}

#dashboardTopbar {
  background: #0f172a;
  color: white;
  padding: 15px 20px;
  border-radius: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.topbar-title {
  font-size: 24px;
}

.action-button {
  padding: 10px 18px;
  border: none;
  border-radius: 8px;
  background: #2563eb;
  color: white;
  cursor: pointer;
}

.action-button:hover {
  background: #1d4ed8;
}

.danger-button {
  background: #dc2626;
}

.danger-button:hover {
  background: #b91c1c;
}

#dashboardCards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-top: 20px;
}

.feature-card {
  background: white;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 18px rgba(0,0,0,0.08);
  text-align: center;
}

.card-title {
  margin-bottom: 10px;
}

.card-text {
  margin-bottom: 10px;
}
</style>

</head>

<body>

<section id="dashboardPage">
  <div class="dashboard-container">

    <div id="dashboardTopbar">
      <h2 class="topbar-title">Dashboard</h2>

      <button class="action-button danger-button"
        onclick="window.location.href='<%= request.getContextPath() %>/logout'">
        Logout
      </button>
    </div>

    <div id="dashboardCards">

      <div class="feature-card">
        <h3 class="card-title">Lost and Found System</h3>
        <p class="card-text">Manage lost and found items.</p>

        <button class="action-button"
          onclick="window.location.href='<%= request.getContextPath() %>/lostfound.jsp'">
          Open
        </button>
      </div>

      <div class="feature-card">
        <h3 class="card-title">Complaint System</h3>
        <p class="card-text">Create, manage, and track complaints.</p>

        <button class="action-button"
          onclick="window.location.href='<%= request.getContextPath() %>/complain.jsp'">
          Open
        </button>
      </div>

    </div>

  </div>
</section>

</body>
</html>