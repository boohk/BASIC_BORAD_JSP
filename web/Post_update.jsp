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

<html>

<head>
    <title>BOARD_NORMAL</title>
</head>

<%
    try {

        String idx = request.getParameter("idx");
        String writer = request.getParameter("updateWriter");
        String psw = request.getParameter("updatePsw");
        String title = request.getParameter("updateTitle");
        String content = request.getParameter("updateContent");
        request.setCharacterEncoding("UTF-8");

        String sql = " UPDATE  normal SET WRITER = ?, PASSWORD = ?, TITLE= ?,CONTENT = ?, `REG_TIMESTAMP` = 'CURRENT_TIMESTAMP' WHERE IDX =" + idx;
        db.pstmtSetValues(writer, psw, title, content);
        db.PreparedStatementOpen(sql);
        db.pstmtExecuteQuery();
%>

<script language=javascript>
    self.window.alert("글이 수정되었습니다.");
    location.href = "DetailedPost.jsp?idx=<%=idx%>";
</script>

<%
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