class GrupoGladiadores {
    const nombre
    const gladiadores
    method agregar(unGladiador) {
        gladiadores.add(unGladiador)
    }
    method sacar(unGladiador) {
        if(gladiadores.contains(unGladiador)) {
            gladiadores.remove(unGladiador)
        }
        else {
            self.error("No está ese gladiador en el grupo")
        }
    }
    method elegirCampeon() {
        return gladiadores.max({g => g.poderDeAtaque() && g.puedeLuchar()})
    }
    method curarGrupo() {
        gladiadores.forEach({g => g.curar(100)})
    }

    method getNombre() {
        return nombre
    }
}

class Coliseo {
    method organizarPelea(unGrupo,otroGrupo) {
        const rounds = []
        self.roundDePelea(rounds,unGrupo,otroGrupo)
        self.roundDePelea(rounds,unGrupo,otroGrupo)
        self.roundDePelea(rounds,unGrupo,otroGrupo)
        const roundsAux = rounds
        unGrupo.curarGrupo()
        otroGrupo.curarGrupo()
        if(roundsAux.filter({g => unGrupo.contains(g)}).size() > 1) {
            return "Ganador: " + unGrupo.getNombre()
        }
        else {
            return "Ganador: " + otroGrupo.getNombre()
        }
    }

    method roundDePelea(rounds,unGrupo,otroGrupo) {
        const campeon1 = unGrupo.elegirCampeon()
        const campeon2 = otroGrupo.elegirCampeon()
        campeon1.atacar(campeon2)
        campeon2.atacar(campeon1)
        rounds.add(self.ganadorDeRound(campeon1,campeon2))
    }
    method ganadorDeRound(unGladiador,otroGladiador) {
        if(unGladiador.getVitalidad() > otroGladiador.getVitalidad()) {
            return unGladiador
        }
        else {
            return otroGladiador
        }
    }
}