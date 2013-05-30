/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Ventas;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Clase para ejecutar sentencias de MySQL en la base de datos. Solo deben modificar los datos de conexion.
 * @author lascuv
 */
public class MysqlExecute {
    
    Connection conn;
    PreparedStatement psExecute;
    Statement stmt;
    MysqlDataSource ds = new MysqlDataSource();
    
    /**
     * Inicializa la clase MysqlExecute
     */
    public MysqlExecute(){
        
    }
    
    /**
     * Inserta datos en la tabla.
     * @param tabla
     * @param datos
     * @return filas insertadas
     */
    public int Insertar(String tabla, String datos){
        ds.setUser("root");
        ds.setPassword("uv");
        ds.setDatabaseName("siuv");
        ds.setServerName("127.0.0.1");
        int id = 0;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String insertStr = "INSERT INTO `" + tabla + "` VALUES(" + datos + ")";
            id = stmt.executeUpdate(insertStr);
        } catch(SQLException ex){
            ex.toString();
        }
        return id;
    }
    
    /**
     * Actualiza los datos de la tabla.
     * @param tabla
     * @param datos
     * @param comparacion
     * @return filas actualizadas
     */
    public int Actualizar(String tabla, String datos, String comparacion){
        ds.setUser("root");
        ds.setPassword("1234");
        ds.setDatabaseName("siuv");
        ds.setServerName("127.0.0.1");
        int id = 0;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String updateStr = "UPDATE `" + tabla + "` SET " + datos + " WHERE " + comparacion;
            id = stmt.executeUpdate(updateStr);
        } catch(SQLException ex){
            ex.toString();
        }
        return id;
    }
    
    /**
     * Borra datos de la tabla.
     * @param tabla
     * @param comparacion
     * @return filas borradas
     */
    public int Borrar(String tabla, String comparacion){
        ds.setUser("root");
        ds.setPassword("1234");
        ds.setDatabaseName("siuv");
        ds.setServerName("127.0.0.1");
        int id = 0;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String deleteStr = "DELETE FROM " + tabla + " WHERE " + comparacion;
            id = stmt.executeUpdate(deleteStr);
        } catch(SQLException ex){
            ex.toString();
        }
        return id;
    }
}
