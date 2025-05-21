/*package com.sinflo.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
        Connection con;
        String url = "jdbc:mysql://localhost:3306/bdcarritocompras";
        String user = "root";
        String pass = "12345678";
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }
}*/

package com.sinflo.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
 private Connection con;
 private final String url = "jdbc:mysql://localhost:3306/bdcarritocompras";
 private final String user = "root"; // Cambia esto si usas otro usuario
 private final String pass = ""; // Cambia esto si tienes otra contraseña

 public Connection getConnection() {
     try {
         // Cargar el driver JDBC (versión moderna)
         Class.forName("com.mysql.cj.jdbc.Driver");

         // Establecer la conexión
         con = DriverManager.getConnection(url, user, pass);
         System.out.println("Conexión exitosa a la base de datos.");
     } catch (Exception e) {
         // Mostrar cualquier error que ocurra
         e.printStackTrace();
         System.out.println("Error al conectar a la base de datos: " + e.getMessage());
     }
     return con;
 }
 /* public static void main(String[] args) {
     Conexion conexion = new Conexion();
     Connection con = conexion.getConnection();
     if (con != null) {
         System.out.println("Conexión exitosa a la base de datos bdcarritocompras.");
     } else {
         System.out.println("No se pudo conectar a la base de datos.");
     }
 }*/

}

