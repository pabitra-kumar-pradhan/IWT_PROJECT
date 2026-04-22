<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if(session == null || session.getAttribute("sic") == null){
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Complaint System</title>

<style>
/* SAME YOUR CSS — no change */
* { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
body { background: #f4f7fb; color: #222; }
/* keep rest same */
</style>

</head>

<body>

<section id="complaintPage">
  <div class="complaint-container">

    <!-- TOP BAR -->
    <div id="complaintTopbar">
      <h2>Complaint System</h2>

      <!-- 🔥 FIXED BUTTON -->
      <button class="action-button secondary-button"
        onclick="window.location.href='<%= request.getContextPath() %>/dashboard.jsp'">
        Back to Dashboard
      </button>

    </div>

    <!-- FORM -->
    <div id="complaintFormBox">
      <h3>Add Complaint</h3>

      <input id="complainName" type="text" placeholder="Name" />
      <input id="sicNo" type="text" placeholder="SIC No." />
      <input id="topic" type="text" placeholder="Topic" />
      <textarea id="description" placeholder="Description"></textarea>

      <button onclick="addComplaint()">Submit Complaint</button>
    </div>

    <!-- LIST -->
    <div id="complaintListBox">
      <h3>Complaints</h3>
      <div id="complaintsContainer"></div>
    </div>

  </div>
</section>

<script>
/* KEEP YOUR JS SAME */
let complaints = [];

function addComplaint() {
  const name = document.getElementById("complainName").value;
  const sicNo = document.getElementById("sicNo").value;
  const topic = document.getElementById("topic").value;
  const description = document.getElementById("description").value;

  if (!name || !sicNo || !topic || !description) {
    alert("Fill all fields");
    return;
  }

  complaints.push({ name, sicNo, topic, description });

  renderComplaints();
}

function renderComplaints() {
  const container = document.getElementById("complaintsContainer");
  container.innerHTML = "";

  complaints.forEach(c => {
    container.innerHTML += `
      <div style="padding:10px; border:1px solid #ccc; margin:10px;">
        <b>${c.topic}</b><br>
        ${c.description}<br>
        <small>${c.name} (${c.sicNo})</small>
      </div>
    `;
  });
}
</script>

</body>
</html>