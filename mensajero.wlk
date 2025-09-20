object roberto{
    var pesoPropio = 0   
    var property usaBicicleta = true
    
    method pesoPropio(unPeso) {
        pesoPropio = unPeso
    }
    method peso() {
        if (usaBicicleta) {
            return pesoPropio + 5
        } else {
            return pesoPropio + camion.peso() * 500
        }
    }
    method puedeHacerUnaLlamada() {
        return false
    }
}
object camion {
    var property peso = 3500 //kg 
}

object chukNorris{
    var property  pesoPropio = 80 //kg

    method puedeHacerUnaLlamada() {
        return true
    }
}

object neo{
    var property  pesoPropio = 0 //kg
    var property tieneCreditoEnElTelefono = false
    method vuela() {
        return true
    }
    method puedeHacerUnaLlamada() {
        return tieneCreditoEnElTelefono
    }
}

