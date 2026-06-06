class Armadura {  
  method getDefensa(unGladiador)
}

class Casco inherits Armadura {
  override method getDefensa(unGladiador) {
    return 10
  }
}

class Escudo inherits Armadura {
  override method getDefensa(unGladiador) {
    return 5 + (unGladiador.getDestreza() * 0.1)
  }
}