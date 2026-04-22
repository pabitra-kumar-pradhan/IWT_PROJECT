<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      width: auto;
      padding: 10px 18px;
      margin-top: 10px;
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
	<%
		if(session.getAttribute("sic")==null)
		{
			response.sendRedirect("Login.html");
		}
	%>
	<section id="dashboardPage" class="page">
    <div id="dashboardWrapper" class="dashboard-container">
      <div id="dashboardTopbar" class="topbar">
        <h2 id="dashboardHeading" class="topbar-title">Dashboard</h2>
        <button onclick="window.location.href='logout'">Logout</button>
      </div>

      <div id="dashboardCards" class="cards-grid">
        <div id="lostFoundCard" class="feature-card">
          <h3 id="lostFoundTitle" class="card-title">Lost and Found System</h3>
          <p id="lostFoundText" class="card-text">Manage lost and found items.</p>
          <button id="lostFoundButton" class="action-button" onclick="window.location.href='lostfound.html'">Open</button>
        </div>

        <div id="complaintCard" class="feature-card">
          <h3 id="complaintTitle" class="card-title">Complaint System</h3>
          <p id="complaintText" class="card-text">Create, manage, and track complaints.</p>
          <button id="complaintButton" class="action-button" onclick="window.location.href='complaint.html'">Open</button>
        </div>
      </div>
    </div>
  </section>
</body>
</html>