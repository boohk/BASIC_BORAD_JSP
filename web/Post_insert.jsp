<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="db" class="com.board.DAO.DB_Connection" scope="request"/>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>BOARD_NORMAL_UPDATE_201770110</title>

</head>
<%
    try {

        String sql = "insert into normal(WRITER,PASSWORD,TITLE,CONTENT)"
                + "values(?,?,?,?)";
        db.PreparedStatementOpen(sql);
        request.setCharacterEncoding("UTF-8");
        String writer = request.getParameter("writer");
        String psw = request.getParameter("psw");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        db.pstmtSetValues(writer, psw, title, content);
//        pstmt.setString(1, writer);
//        pstmt.setString(2, psw);
//        pstmt.setString(3, title);
//        pstmt.setString(4, content);
        db.pstmtExecuteUpdate();

        response.sendRedirect("Posts_list.jsp");

    } catch (SQLException se) {
        System.out.println(se.getMessage());
    } finally {
        try {
            db.pstmtClose();
        } catch (SQLException se) {
            System.out.println(se.getMessage());
        }
    }
    // 결과 응답하기
%>

<body>
</body>
</html>