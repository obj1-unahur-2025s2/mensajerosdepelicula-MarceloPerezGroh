object bicicleta {
    method peso() = 5
}

object camion {
    var acoplados = 1
    method cantidadDeAcoplados(cantidad){
        acoplados = cantidad
    }
    method peso() = 500 * (acoplados.max(1))
}