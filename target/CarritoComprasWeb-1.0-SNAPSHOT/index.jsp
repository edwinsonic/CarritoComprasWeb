

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a class="nav-link" href="Controlador?accion=Carrito">
                                <i class="fas fa-shopping-cart" style="color: orange;"></i>
                                <label style="color: orange">${contador}</label> Carrito
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
        <div class="container mt-2">
            <div class="row">
                <c:forEach var="p" items="${productos}">
                    <div class="col-sm-4 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <label>${p.getNombres()}</label>
                            </div>
                            <div class="card-body">
                                <i> ${p.getPrecio()}</i>
                                <img src="ControladorIMG?id=${p.getId()}" width="200" height="180">
                            </div>
                            <div class="card-footer text-center" >
                                <label style="height:50px">${p.getDescripcion()}</label>
                                <div>
                                    <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}"class="btn btn-outline-info">Agregar a Carrito</a>
                                    <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                </div>
                            </div>

                        </div>

                    </div>
                </c:forEach>


            </div>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
