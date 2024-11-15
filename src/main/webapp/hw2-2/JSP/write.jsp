<%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오전 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Player</title>
  <link rel="stylesheet" href="../CSS/my.css" />
<%--  <%@ include file="../CSS/my.css"%>--%>
<%--  <%@ include file="../CSS/add.css"%>--%>
  <link rel="stylesheet" href="../CSS/add.css" />
</head>
<body>
<img src="../assets/booticon.png" alt="Boot Icon" />
<h1>Add Player</h1>
<div class="formdiv">
  <form name="form1" class="formdiv" action="write_ok.jsp">
    <div class="innerDiv">
      Name<input
            class="inputText"
            type="text"
            name="name"
            id="name"
    />
      <div id="error-message-name" class="error-message">
        Name is required
      </div>
    </div>

    <div class="innerDiv">
      Birth Year<input
            class="inputText"
            type="number"
            name="birthyear"
            id="birthyear"
    />
      <div id="error-message-birthyear" class="error-message">
        Birth year must be a valid year below 2024
      </div>
    </div>

    <div class="innerDiv">
      Club<input
            class="inputText"
            type="text"
            name="club"
            id="club"
    />
      <div id="error-message-club" class="error-message">
        Club is required
      </div>
    </div>
    <div class="innerDiv">
      Country<input
            class="inputText"
            type="text"
            name="country"
            id="country"
    />
      <div id="error-message-country" class="error-message">
        Country must be at least 2 characters long
      </div>
    </div>

    <div class="innerDiv">
      Position<input
            class="inputText"
            type="text"
            name="position"
            id="position"
    />
      <div id="error-message-position" class="error-message">
        Position must be GK, DF, MF, or FW
      </div>
    </div>
    <div class="innerDiv">
      Main Foot<input
            class="inputText"
            type="text"
            name="mainfoot"
            id="mainfoot"
    />
      <div id="error-message-mainfoot" class="error-message">
        Main foot is required
      </div>
    </div>
    <button
            type="button"
            id="btn"
            onclick="handleSubmit()"
            onmouseover="mouseon()"
            onmouseout="mouseout()"
    >
      Add a player
    </button>
  </form>
</div>
<script src="../JS/add.js" defer></script>
</body>
</html>

