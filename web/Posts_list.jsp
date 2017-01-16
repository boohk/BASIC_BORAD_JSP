<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BOARD_NORMAL_UPDATE_201770110</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>

<%
    try {
        int total = 0;

        String sql = "SELECT COUNT(*) FROM normal";
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();

        if (rs.next()) {
            total = rs.getInt(1);
        }

        rs.close();
        out.print("총 게시물 : " + total + "개");

        sql = "SELECT IDX, WRITER, TITLE, REG_TIMESTAMP,HIT VIEW from normal";
        db.PreparedStatementOpen(sql);
        rs = db.pstmtExecuteQuery();

%>

<body>
<div class="container">
    <h2>글 목록
        <small>수정_20161228</small>
    </h2>
    <hr>
</div>

<div class="container">
    <table class="table table-hover" style="text-align: center;">
        <tbody>
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>날짜</td>
            <td>조회수</td>
        </tr>

        <%
            if (total == 0) {
        %>

        <tr align="center" bgcolor="#FFFFFF" height="30">
            <td colspan="6">등록된 글이 없습니다.</td>
        </tr>

        <%
        } else {
            while (rs.next()) {
                int idx = rs.getInt(1);
                String writer = rs.getString(2);
                String title = rs.getString(3);
                Timestamp date = rs.getTimestamp(4);
                int hit = rs.getInt(5);
        %>

        <tr>
            <td><%=idx%>
            </td>
            <td><a href="DetailedPost.jsp?idx=<%=idx%>"><%=title%>
            </a></td>
            <td><%=writer%>
            </td>
            <td><%=date%>
            </td>
            <td><%=hit%>
            </td>
        </tr>

        <%
                    }
                }
                rs.close();
                db.pstmtClose();

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
        </tbody>
    </table>
    <hr>
    <div class="row">
        <div class="col-md-3">
            <a class="btn btn-success" name="show" href="Posts_list.jsp">전체보기</a>
        </div>
        <div class="col-md-3 col-md-push-7 col-md-offset-1">
            <a class="btn btn-success" name="write" href="Post.html">글쓰기</a>
        </div>
    </div>
</div>

</body>
</html>
