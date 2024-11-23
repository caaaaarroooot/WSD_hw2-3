<%@ page import="org.example.hw22.dao.PlayerDAO" %>
<%@ page import="org.example.hw22.FileUpload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String playerId = request.getParameter("id");
    if (playerId != null && !playerId.isEmpty() && !playerId.equals("1")) {
        int id = Integer.parseInt(playerId);
        PlayerDAO playerDAO = new PlayerDAO();
        String filename = playerDAO.getPhotoFilename(id);
        if(filename != null)
            FileUpload.deleteFile(request, filename);
        playerDAO.deletePlayerById(id);
        response.sendRedirect("list.jsp");
        return;
    } else if (playerId.equals("1")) {
%>
<html>
<head></head>
<body>
<script>
    alert('player id가 1입니다. 편의를 위해 삭제가 불가합니다');
    window.location.href = 'list.jsp'; // 경고창 이후 리다이렉트
</script>
</body>
</html>
<%
    }
%>
