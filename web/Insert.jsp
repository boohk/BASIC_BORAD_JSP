<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>BOARD_NORMAL</title>
    <script src="js/ClickEvent.js"></script>
</head>
<%
    Connection con = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;

    try{
        String url = "jdbc:mysql://localhost:3306/board?useSSL=false";     // 사용하려는 데이터베이스명을 포함한 URL 기술
        String id = "root";                                                    // 사용자 계정
        String pw = "q1w2e3r4";                                                // 사용자 계정의 패스워드

        Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        con=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

        request.setCharacterEncoding("UTF-8");
        //request.setCharacterEncoding("euc-kr");
        String writer = request.getParameter("writer");
        String psw = request.getParameter("psw");
        String title = request.getParameter("title");
        String context = request.getParameter("content");
       // int totalCount = totalCount+1;
        //db에 저장하기

        String sql = "insert into normal(WRITER,PASSWORD,TITLE,CONTENT) values(?,?,?,?)";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, writer);
        pstmt.setString(2, psw);
        pstmt.setString(3, title);
        pstmt.setString(4, context);
      //  pstmt.setInt(5, totalCount);
        pstmt.executeUpdate();

        response.sendRedirect("List.jsp");

    } catch (SQLException se) {
        System.out.println(se.getMessage());
    } finally {
        try {
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (SQLException se) {
            System.out.println(se.getMessage());
        }
    }
    // 결과 응답하기
%>

<body>

</body>
</html>