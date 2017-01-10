package com.board.DAO;
import java.sql.*;

/**
 * Created by BooJing on 2017-01-09.
 */
public class DB_Connection {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private String driver = null;
    private String url = null;
    private String user = null;
    private String password = null;


    public DB_Connection() throws SQLException {
        driver = "com.mysql.jdbc.Driver";                                     // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        url = "jdbc:mysql://localhost:3306/board?useSSL=false";               // 사용하려는 데이터베이스명을 포함한 URL 기술
        user = "root";                                                        // 사용자 계정 ID
        password = "q1w2e3r4";                                                // 사용자 계정 PASSWORD
    }

    public synchronized void PreparedStatementOpen(String sql) throws Exception {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, password);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
        pstmt = conn.prepareStatement(sql);                 // pstmt 실행
    }

    public int pstmtExecuteUpdate() throws Exception {                 // stmt excuteUpdate 실행
        return pstmt.executeUpdate();
    }
    public ResultSet pstmtExecuteQuery() throws Exception {                 // stmt excuteUpdate 실행
        return pstmt.executeQuery();
    }

    public void pstmtSetValues(Object... values) throws SQLException {
        for (int i = 0; i < values.length; i++) {
            pstmt.setObject(i + 1, values[i]);
        }
    }

    public synchronized void pstmtClose() throws Exception {                 // pstmt 연결 끊기
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}
