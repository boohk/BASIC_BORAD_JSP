<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BOARD_NORMAL</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ClickEvent.js"></script>
</head>

<body>

<div class="container">
    <h2>글 쓰기  <small>수정_20161228</small></h2>
    <hr>
</div>

<div class="container">
    <table summary="글쓰기 전체 테이블">
        <form name="WriteForm" method="post" action="Insert.jsp" onsubmit="return WriteCheck();" >

            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>


            <table summary="테이블 구성" class="table table-striped table-hover"  >
                <tr>
                    <td>작성자</td>
                    <td><input type=text name=writer size=10 maxlength=8></td>
                </tr><br>
                <tr>
                    <td>비밀번호</td>
                    <td><input type=password name=psw size=30></td>
                </tr>
                <tr>
                    <td>제 목</td>
                    <td><input type=text name=title></td>
                </tr>
                <tr>
                    <td>내 용</td>
                    <td><textarea name=content rows ="10" cols="100"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div align="center">
                        <input type="submit" value="저장">
                        <input type="button" value="취소" onclick="move('List.jsp');">
                    </div>
                    </td>
                </tr>
            </table>
        </form>
    </table>
</div>
</body>
</html>
