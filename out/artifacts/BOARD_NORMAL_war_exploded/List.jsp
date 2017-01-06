<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

        int total = 0;

        stmt = con.createStatement();
        String sqlCount = "SELECT COUNT(*) FROM normal";
        ResultSet rs = stmt.executeQuery(sqlCount);

        if (rs.next()) {
            total = rs.getInt(1);
        }
        rs.close();
        out.print("총 게시물 : " + total + "개");

        String sql = "SELECT IDX, WRITER, TITLE, REG_TIMESTAMP,HIT VIEW from normal";
        rs = stmt.executeQuery(sql);
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
            <td><%=idx%></td>
            <td><a href="DetailedForm.jsp?idx=<%=idx%>"><%=title%></a></td>
            <td><%=writer%></td>
            <td><%=date%></td>
            <td><%=hit%></td>
        </tr>
        <%
                    }
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (SQLException e) {
                out.println(e.toString());
            }
        %>
        </tbody>
    </table>
    <hr>
    <div class="row">
        <div class="col-md-3">
            <input type="button" value="전체보기" onclick="move('List.jsp')";>
        </div>
        <div class="col-md-3 col-md-push-7 col-md-offset-1">
            <input type="button" value="글쓰기" onclick="move('Write.jsp');">
        </div>
    </div>
</div>


</body>
</html>
