<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="top.jsp" %>
<div class="container">
  <header class="d-flex justify-content-center py-3">
    <ul class="nav nav-pills">
      <li class="nav-item">
        <a href="./list.jsp" class="nav-link active" aria-current="page">Home</a>
      </li>
    </ul>
  </header>
</div>
<h1>Edit Player</h1>
<%
  String idParam = request.getParameter("id");
  int id = Integer.parseInt(idParam);
  PlayerDAO playerDAO = new PlayerDAO();
  PlayerVO player = playerDAO.getPlayerById(id);
%>
<div style="display: flex; flex-direction: row" >
  <div style="width: 300px; height: 700px">
    <img src='../../upload/<%=player.getFilename()%>' alt="picture~" style="width: 300px; height: 300px">
  </div>
<div class="formdiv">
  <form name="form1" class="formdiv" action="edit_ok.jsp" enctype="multipart/form-data" method="post">
    <input type="hidden" name="sid" value="<%=player.getId()%>" />
    <input type="hidden" name="existingFilename" value="<%=player.getFilename()%>">
    <%System.out.println("existFilename: " + player.getFilename());%>
    <div class="innerDiv">
      Name<input
            class="inputText"
            type="text"
            name="name"
            id="name"
            value="<%=player.getName()%>"
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
            value="<%=player.getBirthyear()%>"
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
            value="<%=player.getClub()%>"
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
            value="<%=player.getCountry()%>"
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
            value="<%=player.getPosition()%>"
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
            value="<%=player.getMainfoot()%>"
    />
      <div id="error-message-mainfoot" class="error-message">
        Main foot is required
      </div>
    </div>
    <div class="innerDiv"><input type="file" name="photo" value="<%=player.getFilename()%>"></div>
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
</div>
<script src="../JS/load.js" defer></script>
<script src="../JS/edit.js" defer></script>
<%@ include file="bottom.jsp" %>
