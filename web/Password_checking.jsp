<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    String idx = request.getParameter("idx");
    String check;
    if (request.getParameter("update").equals("update")) {
        check = request.getParameter("update");
    } else {
        check = request.getParameter("delete");
    }
%>
<body>

<div class="container" style="align-content:center; text-align: center; margin-top: 200px;  ">
    <form action="Password_comfirm.jsp" method="post" accept-charset="utf-8" name="password_checking"
          id="password_confirm">
        <input type="hidden" name="idx" value=<%=idx%>>
        <input type="hidden" name="check" value=<%=check%>>

        <input type="text">
        <ul class="list-group">
            <li class="list-group-item">비밀번호를 입력하여 주세요.</li>
            <li class="list-group-item"><input type="password" id="psd" name="psd" class=""/></li>
            <li class="list-group-item">
                <input type="submit" class="btn-primary" alt="확인" value="확인" style="cursor:pointer;"/>
                <a class="btn btn-default" href="Posts_list.jsp" role="button">목록보기</a>
                <a class="btn btn-default" onclick="javascript:history.go(-1)" role="button">이전으로</a>
            </li>
        </ul>
    </form>
</div>


</body>
</html>
<%!

%>
if ($_POST['action'] == 'Update') {
//action for update here
} else if ($_POST['action'] == 'Delete') {
//action for delete
} else {
//invalid action!
}