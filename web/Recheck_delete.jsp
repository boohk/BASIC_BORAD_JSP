
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
%>
<body>

<div class="container" style="align-content:center; text-align: center; margin-top: 200px;  ">
        <ul class="list-group">
            <li class="list-group-item">정말 삭제하시겟습니까?</li>
            <li class="list-group-item">
                <a class="btn btn-primary" href="Post_delete.jsp?idx=<%=idx%>" style="cursor:pointer;" role="button"/>예</a>
                <a class="btn btn-default" href="Posts_list.jsp" role="button">아니오</a>
                <a class="btn btn-default" onclick="history.go(-1)" role="button">이전으로</a>
            </li>
        </ul>
</div>


</body>
</html>