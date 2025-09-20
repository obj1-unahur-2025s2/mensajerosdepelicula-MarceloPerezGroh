import mensajeros.*
import destinos.*
import paquetes.*

object empresa {
    const mensajeros = [chuck, neo, roberto]
    const paquetesEnviados =[]
    const paquetesPendientes =[]
    
    
    // mensajeros es una referencia de un conjunto vacio
    method contratar(unMensajero){
        mensajeros.add(unMensajero)
    }

    method despedir(unMensajero){
        mensajeros.remove(unMensajero)
    }

    method despedirATodos(){
        mensajeros.clear()
    }

    method esGrande(){
        return mensajeros.size() > 2
    }

    method sePuedeEntregarPorPrimerEmpleado(unPaquete){
        return unPaquete.puedeSerEntregado(mensajeros.first()) and !mensajeros.isEmpty()
        // el profe lo hizo con if
        // return if(!mensajeros.isEmpty()){paquete.puedeSerEntregado(mensajeros.first(), unDestino)}

    }
    
    

    method algunMensajeroPuedeEntregar(unPaquete){
        // Devuelve un booleano que muestra si cumple la condicion
        return mensajeros.any({mensajero => unPaquete.puedeSerEntregado(mensajero)})
    }

    method todosLosQuePuedenLlevar(unPaquete) {
        // Devuelve una lista de mensajeros que cumplan la condicion
        return mensajeros.filter({mensajero => unPaquete.puedeSerEntregado(mensajero)})
    }

    method tieneSobrepeso() {
        // Suma cada peso en el transformer mensajero
        return mensajeros.sum({mensajero => mensajero.peso()}) / mensajeros.size() > 500
        
        // otra manera, map devuelve una lista de elementos, en este caso una lista de pesos de los mensajeros
        // mensajeros.map({m => m.peso}).sum() / mensajeros.size() > 500
    }
    
    //6.saber el peso del ultimo mensajero de la empresa.
    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
    }

    method enviarPaquete(unPaquete) {
        if(self.algunMensajeroPuedeEntregar(unPaquete)){
            paquetesEnviados.add(unPaquete)
        }
        else{
            paquetesPendientes.add(unPaquete)
        }
    }

    method facturacion() {
        return paquetesEnviados.sum({paquete => paquete.precio()})      
    }
    
    method enviar(conjuntoDePaquetes) {
        // el for each se usa para hacer mensajes de indicacion (de accion) con un closure
        conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
    }

    method paquetePendienteMasCaro(){
        return paquetesPendientes.max({pp => pp.precio()})
    }

    method enviarPaquetePendienteMasCaro(){
        if(self.algunMensajeroPuedeEntregar(self.paquetePendienteMasCaro())){
            self.enviarPaquete(self.paquetePendienteMasCaro())
            paquetesPendientes.remove(self.paquetePendienteMasCaro())
        }
    }
}