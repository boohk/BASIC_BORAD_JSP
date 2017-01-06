<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <title>BOARD_NORMAL</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>

<%
    Connection con = null;                                        // null로 초기화 한다.
    Statement stmt = null;

    try {
        String url = "jdbc:mysql://localhost:3306/board?useSSL=false";     // 사용하려는 데이터베이스명을 포함한 URL 기술
        String id = "root";                                                    // 사용자 계정
        String pw = "q1w2e3r4";                                                // 사용자 계정의 패스워드

        Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        con = DriverManager.getConnection(url, id, pw);

        stmt = con.createStatement();
        ResultSet rs = null;
        String sql = null;


        sql =   "UPDATE normal SET " +
                "WRITER = "+request.getParameter("writer")+
                ",PASSWORD,"+request.getParameter("psw")+
                ",PASSWORD,"+request.getParameter("psw")+
                ",PASSWORD,"+request.getParameter("psw")+
                ",WHERE IDX =" + request.getParameter("idx");
        rs = stmt.executeQuery(sql);

%>
<body>

</body>
</html>
