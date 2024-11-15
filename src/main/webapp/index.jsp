<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="hw2-1/CSS/my.css" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="mask-icon" href="https://cdn.example.com/path/to/safari-pinned-tab.svg" color="#712cf9" />
</head>
<body>
<div class="mother-div">
    <div>
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <!-- SVG Symbols here -->
        </svg>
        <div class="container">
            <header class="d-flex justify-content-center py-3">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/" class="nav-link active" aria-current="page">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="hw2-1/JSP/write.jsp" class="nav-link">Add</a>
                    </li>
                </ul>
            </header>
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
                <tr>
                    <td>1,001</td>
                    <td>대한민국</td>
                    <td>30</td>
                    <td>손흥민</td>
                    <td>토트넘</td>
                    <td>FW</td>
                    <td>양발</td>
                    <td>
                        <a href="hw2-1/JSP/view.jsp?id=1001" class="btn btn-primary btn-sm">view</a>
                    </td>
                </tr>
                <tr>
                    <td>1,002</td>
                    <td>대한민국</td>
                    <td>27</td>
                    <td>김민재</td>
                    <td>바이에른 뮌헨</td>
                    <td>DF</td>
                    <td>오른발</td>
                    <td>
                        <a href="hw2-1/JSP/view.jsp?id=1002" class="btn btn-primary btn-sm">view</a>
                    </td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>대한민국</td>
                    <td>24</td>
                    <td>이지윤</td>
                    <td>FCL</td>
                    <td>GK</td>
                    <td>오른발</td>
                    <td>
                        <a href="hw2-1/JSP/view.jsp?id=1003" class="btn btn-primary btn-sm">view</a>
                    </td>
                </tr>
                <tr>
                    <td>1,004</td>
                    <td>대한민국</td>
                    <td>40</td>
                    <td>박지성</td>
                    <td>맨체스터 유나이티드</td>
                    <td>MF</td>
                    <td>오른발</td>
                    <td>
                        <a href="hw2-1/JSP/view.jsp?id=1004" class="btn btn-primary btn-sm">view</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
