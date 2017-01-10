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
    <title>BOARD_NORMAL_UPDATE_201770110</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>

<%
    try {
        String sql = "SELECT WRITER, PASSWORD, TITLE, CONTENT, HIT VIEW from normal";
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();

%>
<body>

<div class="container">
    <h2>글 쓰기
        <small>수정_20161228</small>
    </h2>
    <hr>
</div>

<div class="container">
    <table summary="글쓰기 전체 테이블">
        <form name="WriteForm" method="post" action="Post_update.jsp"
              onsubmit="return WriteCheck();">

            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>

            <%
                while (rs.next()) {
                    String writer = rs.getString(1);
                    String psw = rs.getString(2);
                    String title = rs.getString(3);
                    String content = rs.getString(4);
                    int hit = rs.getInt(5);
            %>

            <table summary="테이블 구성" class="table table-striped table-hover">
                <tr>
                    <td>제 목</td>
                    <td><input type=text name=title value="<%=title%>"></td>
                </tr>
                </br>
                <tr>
                    <td>조회수</td>
                    <td><%=hit%>
                    </td>
                    <td>작성자</td>
                    <td><input type=text name=writer value="<%=writer%>" size=10 maxlength=8></td>
                    <td>비밀번호</td>
                    <td><input type=password name=psw value="<%=psw%>" size=30></td>
                </tr>
                </br>

                <tr>
                    <td>내 용</td>
                    <td><textarea name=content value="<%=content%>" rows="10" cols="100"></textarea></td>
                </tr>
                </br>

                <%
                            rs.close();
                        }

                    } catch (SQLException se) {
                        System.out.println(se.getMessage());
                    } finally {
                        db.pstmtClose();
                    }
                %>
                <tr>
                    <td colspan="2">
                        <div align="center">
                            <input type="submit" value="확인">
                            <input type="button" value="취소" onclick="backingPage()">
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
