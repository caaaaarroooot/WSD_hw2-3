<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hw22.dao.PlayerDAO" %>
<%@ page import="org.example.hw22.bean.PlayerVO" %>
<%@ page import="java.util.List" %>
<%@ include file="top.jsp" %>
<div class="mother-div">
    <div>
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <!-- SVG Symbols here -->
        </svg>
        <div class="container d-flex f-direction-row justify-content-between">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a href="./list.jsp?sort=name" class="nav-link active" aria-current="page">Home</a>
                </li>
                <li class="nav-item">
                    <a href="write.jsp" class="nav-link">Add</a>
                </li>
                <li class="nav-item">
                    <a href="list.jsp?sort=name" class="nav-link">sort by name</a>
                </li>
                <li class="nav-item">
                    <a href="list.jsp?sort=age" class="nav-link">sort by age</a>
                </li>
                <li class="nav-item">
                    <a href="list.jsp?sort=regdate_desc" class="nav-link">sort by regdate desc</a>
                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0 d-flex f-direction-row" method="get" action="list.jsp">
                <input class="form-control mr-sm-2" type="search" name="position" placeholder="Search by Position" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <h2>Section title</h2>
        <div class="table-responsive small">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">국적</th>
                    <th scope="col">나이</th>
                    <th scope="col">이름</th>
                    <th scope="col">소속팀</th>
                    <th scope="col">포지션</th>
                    <th scope="col">주발</th>
                    <th scope="col">액션</th>
                </tr>
                </thead>
                <tbody>
                <%
                    PlayerDAO playerDAO = new PlayerDAO();
                    List<PlayerVO> players;

                    // 검색 키워드 가져오기
                    String position = request.getParameter("position");
                    String sortBy = request.getParameter("sort");

                    // 검색 조건에 따라 DAO 호출
                    if (position != null && !position.trim().isEmpty()) {
                        players = playerDAO.getPlayersByPosition(position);
                    } else if (sortBy != null && !sortBy.trim().isEmpty()) {
                        players = playerDAO.getPlayersSortedBy(sortBy);
                    } else {
                        players = playerDAO.getAllUsers();
                    }

                    int i = 0;
                    for (PlayerVO player : players) {
                        i++;
                %>
                <tr>
                    <td><%= i %></td>
                    <td><%= player.getCountry() %></td>
                    <td><%= player.getBirthyear() %></td>
                    <td><%= player.getName() %></td>
                    <td><%= player.getClub() %></td>
                    <td><%= player.getPosition() %></td>
                    <td><%= player.getMainfoot() %></td>
                    <td>
                        <a href="view.jsp?id=<%= player.getId() %>" class="btn btn-primary btn-sm">view</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp" %>
