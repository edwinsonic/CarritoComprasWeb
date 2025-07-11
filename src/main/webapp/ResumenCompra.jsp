<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumen de Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Resumen de Compra</h2>
        <hr>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${carritoResumen}">
                    <tr>
                        <td>${item.getNombres()}</td>
                        <td>${item.getCantidad()}</td>
                        <td>S/. ${item.getPrecioCompra()}</td>
                        <td>S/. ${item.getSubTotal()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h4 class="text-end">Total a pagar: <strong>S/. ${totalResumen}</strong></h4>
        <p class="text-end">Fecha: ${fechaActual}</p>

        <div class="text-center mt-4">
            <a href="Controlador?accion=home" class="btn btn-primary">Volver al inicio</a>
        </div>
    </div>
</body>
</html>
