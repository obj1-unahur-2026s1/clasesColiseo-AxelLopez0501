import armas.*
import armaduras.*
import coliseo.*

class Gladiador {
    var vitalidad = 100
    method puedeLuchar() {
        return vitalidad > 0
    }
    method atacar(unObjetivo)
    method defenderse()
    method getDefensa()
    method getAtaque()
    method recibir(unAtaque) {
        vitalidad = (vitalidad-unAtaque).max(0)
    }
    method formarGrupo(unGladiador)
    method curar(unaCantidad) {
        vitalidad = (vitalidad + unaCantidad).min(100)
    }
}

class Mirmillones inherits Gladiador {
    const fuerza
    const destreza = 10
    var arma
    var equipamiento
    method cambiarArma(unArma) {
        if(unArma == arma) {
            self.error("Ya tiene equipada esa arma")
        }
        else {
            arma = unArma
        }
    }
    method cambiarArmadura(unaArmadura) {
        equipamiento = unaArmadura
    }
    override method getDefensa() {
        return equipamiento.getDefensa(self) + destreza
    }
    method poderDeAtaque() {
        return arma.getAtaque() + fuerza
    }
    method calcularDaño(unObjetivo) {
        return ((self.poderDeAtaque() - unObjetivo.poderDeAtaque()) + 
                (self.getDefensa() - unObjetivo.getDefensa())).max(0)
    }
    override method atacar(unObjetivo) {
        unObjetivo.recibir(self.calcularDaño(unObjetivo))
        unObjetivo.atacar(self)
    }
    override method formarGrupo(unGladiador) {
        return new GrupoGladiadores(nombre="Mirmillolandia",gladiadores=[self,unGladiador])
    }
}

class Dimachaerus inherits Gladiador {
    const fuerza = 10
    var destreza
    const armas = #{}
    var arma
    method cambiarArma(unArma) {
        if (armas.contains(unArma)) {
            arma = unArma
        }
        else {
            self.error("No tiene esa arma")
        }
    }
    method agregarArma(unArma) {
        armas.add(unArma)
    }
    override method getDefensa() {
        return destreza / 2
    }
    method poderDeAtaque() {
        return armas.sum({a => a.getAtaque()})
    }
    method calcularDaño(unObjetivo) {
        return ((self.poderDeAtaque() - unObjetivo.poderDeAtaque()) + 
                (self.getDefensa() - unObjetivo.getDefensa())).max(0)
    }
    override method atacar(unObjetivo) {
        unObjetivo.recibir(self.calcularDaño(unObjetivo))
        unObjetivo.atacar(self)
        destreza += 1
    }
    override method formarGrupo(unGladiador) {
        const d = self.poderDeAtaque() + unGladiador.poderDeAtaque()
        const nombre = "D-".concat(d.toString())
        const grupo = new GrupoGladiadores(nombre=nombre,gladiadores=[self,unGladiador])
        return grupo
    }
}