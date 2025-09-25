import mensajero.*

object puenteDeBrooklyn {
    method puedePasar(mensajero){
        return mensajero.peso() <= 1000
    }
}

object laMatrix {
    method puedePasar(mensajero){
        return mensajero.puedeLlamar()
    }
}


