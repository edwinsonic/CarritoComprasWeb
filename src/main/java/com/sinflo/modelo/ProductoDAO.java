package com.sinflo.modelo;

import com.sinflo.config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Producto listarId(int id) {
        String sql = "select * from producto where idProducto=" + id;
        Producto p = new Producto();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getInt(5));
                p.setStock(rs.getInt(6));
            }
        } catch (Exception e) {
            return p;
        }
        return p;
    }

    public List<Producto> listar() {
        List<Producto> productos = new ArrayList<>();
        String sql = "select * from producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                productos.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace(); // para que puedas ver el error si ocurre
        }
        return productos;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select Foto from producto where idProducto = ?";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
                response.setContentType("image/jpeg");
                outputStream = response.getOutputStream();
                bufferedInputStream = new BufferedInputStream(inputStream);
                bufferedOutputStream = new BufferedOutputStream(outputStream);
                int i;
                while ((i = bufferedInputStream.read()) != -1) {
                    bufferedOutputStream.write(i);
                }
                bufferedOutputStream.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public byte[] obtenerImagenPorId(int id) {
        byte[] img = null;
        String sql = "SELECT Foto FROM producto WHERE idProducto = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                img = rs.getBytes("Foto");
            }
        } catch (Exception e) {
            System.out.println("Error al obtener imagen: " + e.getMessage());
        }
        return img;
    }
}
