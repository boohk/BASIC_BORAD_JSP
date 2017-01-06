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
    Connection con = null;                                        // null�� �ʱ�ȭ �Ѵ�.
    PreparedStatement pstmt = null;

    try{
        String url = "jdbc:mysql://localhost:3306/board?useSSL=false";     // ����Ϸ��� �����ͺ��̽����� ������ URL ���
        String id = "root";                                                    // ����� ����
        String pw = "q1w2e3r4";                                                // ����� ������ �н�����

        Class.forName("com.mysql.jdbc.Driver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
        con=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

        request.setCharacterEncoding("UTF-8");
        //request.setCharacterEncoding("euc-kr");
        String writer = request.getParameter("writer");
        String psw = request.getParameter("psw");
        String title = request.getParameter("title");
        String context = request.getParameter("content");
       // int totalCount = totalCount+1;
        //db�� �����ϱ�

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
    // ��� �����ϱ�
%>

<body>

</body>
</html>