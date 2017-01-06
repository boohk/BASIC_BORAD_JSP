<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
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

        stmt = con.createStatement();
        ResultSet rs = null;
        String sql = null;

        sql = "SELECT WRITER, PASSWORD, TITLE, CONTENT, HIT VIEW from normal";
        rs = stmt.executeQuery(sql);
%>
<body>

<div class="container">
    <h2>글 쓰기  <small>수정_20161228</small></h2>
    <hr>
</div>

<div class="container">
    <table summary="글쓰기 전체 테이블">
        <form name="WriteForm" method="post" action="Update.jsp"
              onsubmit="return WriteCheck();" >

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

            <table summary="테이블 구성" class="table table-striped table-hover"  >
                <tr>
                    <td>제 목</td>
                    <td><input type=text name=title value="<%=title%>"></td>
                </tr></br>
                <tr>
                    <td>조회수</td>
                    <td><%=hit%></td>
                    <td>작성자</td>
                    <td><input type=text name=writer value="<%=writer%>" size=10 maxlength=8></td>
                    <td>비밀번호</td>
                    <td><input type=password name=psw value="<%=psw%>" size=30></td>
                </tr></br>

                <tr>
                    <td>내 용</td>
                    <td><textarea name=content value="<%=content%>" rows ="10" cols="100"></textarea></td>
                </tr></br>
                <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (SQLException e) {
                        out.println(e.toString());
                    }
                %>
                <tr>
                    <td colspan="2">
                        <div align="center">
                            <input type="submit" value="확인">
                            <input type="button" value="취소" onclick="backingPage()" >
                        </div>
                    </td>
                </tr><br>
            </table>
        </form>
    </table>

</div>
</body>
</html>
