<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>
<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-31
  Time: 오후 7:05
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>BOARD_NORMAL_UPDATE_201770110</title>
</head>
<%
    try {

        String sql = "UPDATE normal SET " +
                "WRITER = " + request.getParameter("writer") +
                ",PASSWORD," + request.getParameter("psw") +
                ",TITLE," + request.getParameter("title") +
                ",CONTENT," + request.getParameter("content") +
                ",WHERE IDX =" + request.getParameter("idx");

        db.PreparedStatementOpen(sql);
        db.pstmtExecuteUpdate();

        response.sendRedirect("DetailedPost.jsp");

    } catch (SQLException se) {
        System.out.println(se.getMessage());
    } finally {
        db.pstmtClose();
    }
%>
<body>
</body>
</html>
