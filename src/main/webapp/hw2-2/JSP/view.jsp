<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Player Detail</title>
  <link rel="stylesheet" href="../CSS/add.css" />
  <link rel="stylesheet" href="../CSS/my.css" />
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
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"
    ></path>
  </symbol>
  <!-- Additional SVG symbols -->
</svg>
<div class="container">
  <header class="d-flex justify-content-center py-3">
    <ul class="nav nav-pills">
      <li class="nav-item">
        <a
                href="index.jsp"
                class="nav-link active"
                aria-current="page"
        >Home</a
        >
      </li>
      <li class="nav-item">
        <a href="#" id="edit-link" class="nav-link">edit</a>
      </li>
      <li class="nav-item">
        <button
                class="btn btn-danger btn-sm"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                style="width: 80px; height: 40px"
        >
          삭제
        </button>
      </li>
    </ul>
  </header>
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
        <div class="modal-body">게시물을 삭제할까요?</div>
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
          >
            Yes
          </button>
          <script>
            document.querySelector('.btn-primary').addEventListener('click', function() {
              // id 값을 URL 파라미터로 전달
              var playerId = '<%= request.getParameter("id") %>';  // 현재 페이지에서 id 값을 가져옴

              // delete_ok.jsp로 id를 파라미터로 전달
              window.location.href = 'delete_ok.jsp?id=' + playerId;
            });
          </script>

        </div>
      </div>
    </div>
  </div>
  <h1>Player Detail</h1>
  <div class="formdiv">
    <form name="form1" class="formdiv">
      <div class="innerDiv">
        Name<input
              class="inputText"
              type="text"
              name="name"
              id="name"
              value="<%= request.getParameter("name") %>"
              readonly
      />
      </div>

      <div class="innerDiv">
        Birth Year<input
              class="inputText"
              type="number"
              name="birthyear"
              id="birthyear"
              value="<%= request.getParameter("birthyear") %>"
              readonly
      />
      </div>

      <div class="innerDiv">
        Club<input
              class="inputText"
              type="text"
              name="club"
              id="club"
              value="<%= request.getParameter("club") %>"
              readonly
      />
      </div>
      <div class="innerDiv">
        Country<input
              class="inputText"
              type="text"
              name="country"
              id="country"
              value="<%= request.getParameter("country") %>"
              readonly
      />
      </div>

      <div class="innerDiv">
        Position<input
              class="inputText"
              type="text"
              name="position"
              id="position"
              value="<%= request.getParameter("position") %>"
              readonly
      />
      </div>
      <div class="innerDiv">
        Main Foot<input
              class="inputText"
              type="text"
              name="mainfoot"
              id="mainfoot"
              value="<%= request.getParameter("mainfoot") %>"
              readonly
      />
      </div>
    </form>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../JS/view.js"></script>

</body>
</html>
