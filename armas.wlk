class Arma {
  method getAtaque()
}

class Espada inherits Arma {
  const longitud = 80
  const filo
  override method getAtaque() {
    return filo * longitud
  }
  method getFilo() {
    return filo
  }
  method getLongitud() {
    return longitud
  }
}

class Daga inherits Arma {
  const longitud = 30
  const filo
  override method getAtaque() {
    return filo * longitud
  }
  method getFilo() {
    return filo
  }
  method getLongitud() {
    return longitud
  }
}

class Hacha inherits Arma {
  const longitud = 60
  const filo
  override method getAtaque() {
    return filo * longitud
  }
  method getFilo() {
    return filo
  }
  method getLongitud() {
    return longitud
  }
}

class Maza inherits Arma {
  const peso = 10
  override method getAtaque() {
    return peso
  }
}

class Martillo inherits Arma {
  const peso = 7
  override method getAtaque() {
    return peso
  }
}