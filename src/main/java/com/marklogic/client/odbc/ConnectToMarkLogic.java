package com.marklogic.client.odbc;

import java.sql.*;
import sun.jdbc.odbc.JdbcOdbcDriver; // TODO: Pre-dates Java 1.8.  No built-in type 1 ODBC drivers.

public class ConnectToMarkLogic {
    public static void main(String[] args) {
        try{
            String url="jdbc:odbc:MarkLogicSQL";
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection c=DriverManager.getConnection(url);
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery("select * from customer limit 3");

            while(rs.next()){
                System.out.println(rs.getString(1));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
