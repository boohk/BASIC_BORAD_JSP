<%--
  Created by IntelliJ IDEA.
  User: BooJing
  Date: 2016-12-28
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "javax.servlet.RequestDispatcher" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>
<%--<jsp:forward page="DetailedPost_updating.jsp"></jsp:forward>--%>
<%--<jsp:forward page="Post_delete.jsp"></jsp:forward>--%>

<html>

<head>
    <title>BOARD_NORMAL</title>
</head>

<%
    try {
        String idx = (String) request.getAttribute("idx");
        out.println(idx);
        String update = request.getParameter("update");
        out.println(update);
        String delete = request.getParameter("delete");
        out.println(delete);

        String psd = request.getParameter("psd");
        out.println(psd);

        //String idx = (String)request.getAttribute("idx");

        String update = (String)request.getAttribute("update");
        out.println(update);
        String delete = (String)request.getAttribute("delete");
        out.println(delete);

        String sql = "select PASSWORD from normal where IDX="+idx;
        db.PreparedStatementOpen(sql);
        ResultSet rs = db.pstmtExecuteQuery();

        out.println("333333333333333");

        rs.findColumn("PASSWORD");
        String psw = rs.getString(1);

        out.println(psw);



        out.println("**************");

        out.println(psw);

        rs.close();

        if (psw.equals(request.getParameter("psd"))) {
            RequestDispatcher dispatcher;
            if (request.getAttribute("update").equals("update")) {
                dispatcher = request.getRequestDispatcher("DetailedPost_updating.jsp");
                dispatcher.forward(request,response);
            } else {
                dispatcher = request.getRequestDispatcher("Post_delete.jsp");
                dispatcher.forward(request,response);
            }
        } else{
            ;
        }

    } catch (SQLException se) {
        System.out.println(se.getMessage());
    } finally {
        db.pstmtClose();
    }
%>
<body>

</body>

<script type="text/javascript">
    function wrongAlert() {
        alert("비밀번호가 틀렸습니다. 다시 확인해 주세요.");
    }

    function deleteAlert() {
        alert("비밀번호가 확인되었습니다. 게시글을 지웠습니다.")
        location.href = "Post_delete.jsp";
    }

    function updateAlert() {
        alert("비밀번호가 확인되었습니다. 게시글을 수정합니다.")
        location.href = "DetailedPost_updating.jsp";
    }

</script>
</html>
