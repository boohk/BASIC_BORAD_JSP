<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>
<%--<jsp:forward page="Post_update.jsp"></jsp:forward>--%>
<html>

<head>
    <title>BOARD_NORMAL</title>
</head>

<%
    try {
        //String idx = request.getParameter("idx");
        String idx = (String)request.getAttribute("idx");

        String sql = "UPDATE normal SET " +
                "WRITER = " + request.getParameter("writer") +
                ",PASSWORD," + request.getParameter("psw") +
                ",TITLE," + request.getParameter("title") +
                ",CONTENT," + request.getParameter("content") +
                ",WHERE IDX =" + idx;

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