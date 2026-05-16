package com.hms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    static Connection con;

    public static Connection getConnection(){

        try{

            Class.forName(
            "com.mysql.cj.jdbc.Driver"
            );

            con = DriverManager.getConnection(

            "jdbc:mysql://yamanote.proxy.rlwy.net:53613/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",

            "root",

            "YkfAmYTTWQOOvpuuzXUDKWIlOjhflsIt"

            );

        }catch(Exception e){

            e.printStackTrace();

        }

        return con;

    }

}