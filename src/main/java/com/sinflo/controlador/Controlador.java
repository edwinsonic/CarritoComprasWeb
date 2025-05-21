package com.sinflo.controlador;

import com.sinflo.modelo.Carrito;
import com.sinflo.modelo.Producto;
import com.sinflo.modelo.ProductoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();

    int item;
    double totalPagar = 0.0;
    int cantidad = 1;

    int idp;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        productos = pdao.listar();

        HttpSession session = request.getSession();
        List<Carrito> listaCarrito = (List<Carrito>) session.getAttribute("listaCarrito");
        if (listaCarrito == null) {
            listaCarrito = new ArrayList<>();
        }

        switch (accion) {
            case "Comprar":
                totalPagar = 0.0;
                int idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                item = listaCarrito.size() + 1; // para que no se repita item
                Carrito car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * p.getPrecio());
                listaCarrito.add(car);

                for (Carrito c : listaCarrito) {
                    totalPagar += c.getSubTotal();
                }

                session.setAttribute("listaCarrito", listaCarrito);
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("Carrito", listaCarrito);
                session.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;

            case "AgregarCarrito":
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                item = listaCarrito.size() + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * p.getPrecio());
                listaCarrito.add(car);

                session.setAttribute("listaCarrito", listaCarrito);
                session.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case "delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idproducto) {
                        listaCarrito.remove(i);
                        break;
                    }
                }
                session.setAttribute("listaCarrito", listaCarrito);
                session.setAttribute("contador", listaCarrito.size());
                response.setContentType("text/plain");
                response.getWriter().write("eliminado");
                break;

            case "Carrito":
                totalPagar = 0.0;
                for (Carrito c : listaCarrito) {
                    totalPagar += c.getSubTotal();
                }
                request.setAttribute("Carrito", listaCarrito);
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                break;

            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador principal que maneja productos y carrito con sesión";
    }
}
