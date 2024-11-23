<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="org.example.hw22.FileUpload" %>
<%@ page import="org.example.hw22.bean.PlayerVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FileUpload fileUpload = new FileUpload();
    PlayerVO vo = fileUpload.uploadFile(request);

    // filename을 콘솔에 출력
    System.out.println("Uploaded filename: " + vo.getFilename());
%>
<%if(vo.getFilename() != ""){%>
<h3>파일명: <%=vo.getFilename()%></h3>
<img src='../upload/<%=vo.getFilename()%>' width=400>
<img src='../upload/junsu1.jpeg' width=400>
<%  }%>

