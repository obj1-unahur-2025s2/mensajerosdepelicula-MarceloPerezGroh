import mensajeros.*
import destinos.*

object paquete {
    var destino = laMatrix
    var estaPago = false
    method destino() = destino 
    method cambiarDestino(nuevoDestino){
        destino = nuevoDestino
    }
    method estaPago() = estaPago
    method faltaPaquete() {
        estaPago = false
    }
    method pagoTodo() {
        estaPago = true
    }
    method puedeSerEntregado(unMensajero){
        return estaPago and destino.puedePasar(unMensajero)
    }
    method precio() = 50
}

object paquetito{
    const destino = puenteDeBrooklyn
    method precio() = 0
    method estaPago() {return true}
    method puedeSerEntregado(unMensajero){
        return true
    }
}

object paqueton{
    var importePagado = 0
    const destinos = []
    method precio() {return destinos.size() * 100}
    method recibirPago(unValor){
        importePagado = (importePagado + unValor).min(self.precio())
    }
    method estaPago() {return importePagado == self.precio()}
    method puedeSerEntregado(unMensajero){
        destinos.all({destino => destino.puedePasar(unMensajero)}) and self.estaPago()
    }
}