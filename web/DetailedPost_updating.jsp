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
    <title>BOARD_NORMAL_UPDATE_201770116</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>
<%
    try {
        request.setCharacterEncoding("UTF-8");
        String idx = request.getParameter("idx");
        String sql = "SELECT WRITER, PASSWORD, TITLE, CONTENT, HIT from normal where IDX=" + idx;
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();
%>

<body>

<div class="container">
    <h2>글 수정하기
        <small>수정_20170111</small>
    </h2>
    <hr>
</div>

<div class="container">
    <table summary="글쓰기 전체 테이블">
        <form name="WriteForm" method="post" action="Post_update.jsp?idx=<%=idx%>">
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <%
                while (rs.next()) {
                    String writer = rs.getString("WRITER");
                    String title = rs.getString("TITLE");
                    String content = rs.getString("CONTENT");
                    int hit = rs.getInt("HIT");
            %>

            <table summary="테이블 구성" class="table table-striped table-hover">
                <tr>
                    <td>조회수</td>
                    <td><%=hit%>
                    </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type=text name=updateWriter value="<%=writer%>" size=10 maxlength=8></td>
                </tr>
                <br>
                <tr>
                    <td>비밀번호</td>
                    <td><input type=password name=updatePsw value="" size=30></td>
                </tr>
                </br>
                <tr>
                    <td>제 목</td>
                    <td><input type=text name=updateTitle value="<%=title%>"></td>
                </tr>
                </br>
                <tr>
                    <td>내 용</td>
                    <td><textarea name=updateContent rows="10" cols="100"><%=content%></textarea></td>
                </tr>
                </br>

                <%

                        }
                        rs.close();

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
                <tr>
                    <td colspan="2">
                        <div class="row">
                            <div align="right">
                                <input class="btn btn-success" type="submit" value="확인">
                                <input class="btn btn-default" type="button" value="취소" onclick="history.go(-1)">
                            </div>
                        </div>
                    </td>
                </tr>
                <br>
            </table>
        </form>
    </table>
</div>

</body>

</html>