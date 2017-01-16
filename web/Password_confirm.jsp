<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>
<%--<jsp:forward page="DetailedPost_updating.jsp"></jsp:forward>--%>
<%--<jsp:forward page="Post_delete.jsp"></jsp:forward>--%>

<html>

<head>
    <title>BOARD_NORMAL</title>
</head>


<%

    try {
        String idx = request.getParameter("idx");
        out.println(idx);
        String check = request.getParameter("check");
        out.println(check);
        String inputedPassword = request.getParameter("psd");
        out.println(inputedPassword);

        String savedPassweord = null;
        String sql = "select PASSWORD from normal where IDX=" + idx;
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();

        if (rs.next()) {
            savedPassweord = rs.getString(1);
            out.println(savedPassweord);
        } else {
            ;
        }
        rs.close();
        out.println("333333333333333");

        if (savedPassweord.equals(inputedPassword)) {
            if (check.equals("update")) {
                out.println(check);
%>
    <script>location.href = "DetailedPost_updating.jsp?idx=<%=idx%>"; </script>
<%--<input type="hidden" name="idx" value=<%=idx%>>--%>
<%--<jsp:forward page="DetailedPost_updating.jsp?idx=<%=idx%>"/>--%>
<%

} else {
%>
<script>location.href = "Recheck_delete.jsp?idx=<%=idx%>"; </script>
<%--<input type="hidden" name="idx" value=<%=idx%>>--%>
<%--<jsp:forward page="Recheck_delete.jsp?idx=<%=idx%>"/>--%>
<%
    }
} else {
%>
<script>
    alert("비밀번호가 틀렸습니다.");
    history.go(-1);
</script>
<%
        }
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
