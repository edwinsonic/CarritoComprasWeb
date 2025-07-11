$(document).ready(function () {
    console.log("funciones.js cargado correctamente");
    $(".btnDelete").click(function (e) {
        e.preventDefault();
        console.log("Click en botón eliminar detectado");
        var idp = $(this).closest("td").find(".idp").val();
        console.log("ID del producto a eliminar:", idp);
        // MOSTRAR CONFIRMACIÓN CON SWEETALERT
        swal({
            title: "¿Estás seguro?",
            text: "Una vez eliminado, no podrás recuperar este producto.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idp);
            } else {
                swal("Tu producto está a salvo.");
            }
        });
    });
    function eliminar(idp) {
        var url = "Controlador?accion=delete";
        console.log("Enviando solicitud AJAX a:", url);
        $.ajax({
            type: "POST",
            url: url,
            data: {idp: idp},
            success: function (response) {
                console.log("Respuesta del servidor:", response);
                swal("¡Producto eliminado correctamente!", {
                    icon: "success",
                }).then(() => {
                    location.reload();
                });
            },
            error: function (xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                swal("Error al eliminar el producto.", {
                    icon: "error",
                });
            }
        });
    }
    $("tr #Cantidad").on("change", function () {
        var fila = $(this).closest("tr");
        var idp = fila.find("#idpro").val();
        var cantidad = fila.find("#Cantidad").val();

        var url = "Controlador?accion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&Cantidad=" + cantidad,
            success: function (nuevoSubtotal) {
                // Actualizar el subtotal en la fila
                $("#subtotal_" + idp).text("S/. " + parseFloat(nuevoSubtotal).toFixed(2));

                // Recalcular el total sumando todos los subtotales visibles
                let total = 0;
                $(".subtotal").each(function () {
                    let valor = parseFloat($(this).text().replace("S/.", "").trim());
                    if (!isNaN(valor)) {
                        total += valor;
                    }
                });

                // Actualiza los inputs de total en la parte derecha
                $("input[readonly]").each(function () {
                    if ($(this).prev("label").text().includes("Subtotal") ||
                            $(this).prev("label").text().includes("Total a Pagar")) {
                        $(this).val("S/. " + total.toFixed(2));
                    }
                });
            }
        });
    });
});