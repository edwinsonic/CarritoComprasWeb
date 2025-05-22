

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Xiaomi Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Menú IZQUIERDA -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="Controlador?accion=home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ofertas Del Dia</a>
                        </li>
                    </ul>

                    <!-- Menú DERECHA -->
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">
                        <!-- Carrito con ícono y contador -->
                        <li class="nav-item">
                            <a class="nav-link" href="Controlador?accion=home">

                                <label style="color: orange">${contador}</label> Seguir Comprando
                            </a>
                        </li>

                        <!-- Search -->
                        <li class="nav-item">
                            <form class="d-flex" role="search">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </li>

                        <!-- Iniciar sesión -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Iniciar Sesión
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
        <div class="container mt-4">
            <h3>Carrito</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>CANT</th>
                                <th>SUBTOTAL</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="car" items="${Carrito}">
                                <tr>
                                    <td>${car.getItem()}</td>
                                    <td>${car.getNombres()}</td>

                                    <td>
                                        ${car.getDescripcion()}<br>
                                        <img src="ControladorIMG?id=${car.getIdProducto()}" alt="Imagen Producto" width="100" height="100"/>
                                    </td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td>
                                        <input type="hidden" id="idpro" value="${car.getIdProducto()}">
                                        <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1">
                                    </td>
                                    <td id="subtotal_${car.getIdProducto()}">${car.getSubTotal()}</td>
                                    <td>
                                        <input type="hidden" class="idp" value="${car.getIdProducto()}">
                                        <a href="#" class="btnDelete">Eliminar</a>
                                    </td>

                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>

                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$.${totalPagar}0"readonly class="form-control">

                            <label>Descuento:</label>
                            <input type="text" value="$.0.00" readonly class="form-control">

                            <label>Total a Pagar:</label>
                            <input type="text" value="$.${totalPagar}0" readonly class="form-control">
                        </div>

                        <div class="card-footer">
                            <a href="#" class="btn btn-info btn-block">Realizar Pago</a>
                            <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn-block">Generar Compra</a>

                        </div>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="js/funciones.js" type="text/javascript"></script>
    </body>

</html>
