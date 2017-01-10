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
<%--<%@ page import = "javax.servlet.RequestDispatcher" %>--%>

<html>
<head>
    <meta charset="UTF-8">
    <title>BOARD_NORMAL</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>

<%
    try {
        String idx = request.getParameter("idx");
        request.setAttribute("idx", idx);


        String sql = "UPDATE normal SET HIT = HIT + 1 WHERE IDX =" + idx;
        db.PreparedStatementOpen(sql);
        db.pstmtExecuteUpdate();

        sql = "SELECT WRITER, TITLE, CONTENT, HIT FROM normal WHERE IDX =" + idx;
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();
%>
<body>

<div class="container">
    <h2>상세 보기
        <small>UPDATE_20170110</small>
    </h2>
    <hr>
</div>

<div class="container">
    <table summary="글쓰기 전체 테이블">
        <form name="WriteForm" method="post" action="Password_checking.html"
              onsubmit="return WriteCheck();">

            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>

            <%
                while (rs.next()) {
                    String writer = rs.getString(1);
                    String title = rs.getString(2);
                    String content = rs.getString(3);
                    int hit = rs.getInt(4);
            %>

            <table summary="테이블 구성" class="table table-striped table-hover">
                <tr>
                    <td>제 목</td>
                    <td><%=title%>
                    </td>
                </tr>
                </br>
                <tr>
                    <td>조회수</td>
                    <td><%=hit%>
                    </td>
                </tr>
                </br>
                <tr>
                    <td>작성자</td>
                    <td><%=writer%>
                    </td>
                </tr>
                </br>

                <tr>
                    <td rows="10" cols="100">내 용</td>
                    <td><%=content%>
                    </td>
                </tr>
                </br>
                <%
                    }
                    rs.close();
                %>

                <tr>
                    <td colspan="2">
                        <div class="row">
                            <div class="align=left">
                                <input type="button" value="전체보기" onclick="move('Posts_list.jsp')" ;>
                                <input type="submit" name="update" value="수정">
                                <input type="submit" name="delete" value="삭제">
                                <input type="button" value="글쓰기" onclick="move('Post.html');">
                            </div>
                            <%
                                    response.sendRedirect("Password_confirm.jsp?idx=" + idx);
                                } catch (SQLException e) {
                                    out.println(e.toString());
                                }finally {
                                    db.pstmtClose();
                                    }
                            %>
                            <%--<jsp:forward page="Password_checking.html"></jsp:forward> <%--<jsp:forward page="Password_checking.html"></jsp:forward>--%>
                        </div>
                    </td>
                </tr>
                <br>
            </table>
        </form>
    </table>

</div>
</body>
if ($_POST['action'] == 'Update') {
//action for update here
} else if ($_POST['action'] == 'Delete') {
//action for delete
} else {
//invalid action!
}
</html>