<%@ page import="java.sql.*" %>
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
    String idx = request.getParameter("idx");

    try {
        out.print(idx);
        String sql = "DELETE FROM normal WHERE IDX=" + idx;
        db.PreparedStatementOpen(sql);
        db.pstmtExecuteUpdate();
        response.sendRedirect("Posts_list.jsp");

    } catch (SQLException se) {
        out.println(se.getMessage());
    } finally {
        try {
            db.pstmtClose();
        } catch (SQLException se) {
            out.println(se.getMessage());
        }
    }
%>
<body>
</body>
</html>
