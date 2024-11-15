<%--
  Created by IntelliJ IDEA.
  User: ijiyun
  Date: 2024. 11. 9.
  Time: 오후 2:57
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
  <link
          rel="canonical"
          href="https://getbootstrap.com/docs/5.3/examples/dashboard/"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@docsearch/css@3"
  />
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.min.css"
          rel="stylesheet"
  />
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          crossorigin="anonymous"
  />
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.min.css"
          rel="stylesheet"
  />
  <link
          rel="mask-icon"
          href="https://cdn.example.com/path/to/safari-pinned-tab.svg"
          color="#712cf9"
  />
</head>
<body>
<img src="../assets/booticon.png" />
<h1>Edit Player</h1>
<div class="formdiv">
  <form name="form1" class="formdiv" action="edit_ok.jsp">
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
      수정
    </button>
    <div
            class="modal fade"
            id="exampleModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Confirm
            </h5>
            <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">게시물을 수정할까요?</div>
          <div class="modal-footer">
            <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
            >
              No
            </button>
            <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    onclick="submitForm()"
            >
              Yes
            </button>
          </div>
        </div>
      </div>
    </div>
    <script>
      document
              .querySelector(".btn-danger")
              .addEventListener("click", function () {
                var modal = new bootstrap.Modal(
                        document.getElementById("exampleModal")
                );
                modal.show();
              });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </form>
</div>
<script src="../JS/load.js" defer></script>
<script src="../JS/edit.js" defer></script>
</body>
</html>
