/* para nomear os pontos, eu comparo o ponto criado em um lista com todos as possibilidades viaves

  ex: modulos['Tomada','Tomada','Tomada'] => Tomada Tripla,
  modulos['Tomada 20A','Tomada','Tomada'] => Tomada dupla conjugada com uma Tomada 20A 

 */
class nomesModulos {
  String Nome;
  List<String> modulos = [];

  nomesModulos(this.Nome, this.modulos);

  List<String> getModulos() {
    return modulos;
  }
}

List<nomesModulos> listaNomes = [
  //Tomadas
  nomesModulos('Tomada Simples', ['Tomada']),
  nomesModulos('Tomada Dupla', ['Tomada', 'Tomada']),
  nomesModulos('Tomada tripla', ['Tomada', 'Tomada', 'Tomada']),

  //Tomadas 20A
  nomesModulos('Tomada 20A Simples', ['Tomada 20A']),
  nomesModulos('Tomada 20A Dupla', ['Tomada 20A', 'Tomada 20A']),
  nomesModulos('Tomada 20A tripla', ['Tomada 20A', 'Tomada 20A', 'Tomada 20A']),

  // Interruptor Simples 1,2 e 3 Teclas
  nomesModulos('Interruptor Simples 1 Tecla', ['Interruptor']),
  nomesModulos('Interruptor Simples 2 Teclas', ['Interruptor', 'Interruptor']),
  nomesModulos('Interruptor Simples 3 Teclas',
      ['Interruptor', 'Interruptor', 'Interruptor']),

  // Interruptor Paralelo 1,2 e 3 Teclas
  nomesModulos('Interruptor Paralelo 1 Tecla', ['Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 2 Teclas',
      ['Interruptor Paralelo', 'Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 3 Teclas',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor Paralelo']),

// Interruptor Simples 1 Tecla e Tomada Simples conjugada
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Simples conjugada',
      ['Interruptor', 'Tomada']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Simples conjugada',
      ['Tomada', 'Interruptor']),

// Interruptor Simples 1 Tecla e Tomada 20A conjugada
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A conjugada',
      ['Interruptor', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor']),

// Interruptor Paralelo 1 Tecla e Tomada 20A conjugada
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada 20A conjugada',
      ['Interruptor Paralelo', 'Tomada 20A']),
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor Paralelo']),

// Interruptor Simples 1 Tecla e Tomada Dupla conjugada
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Dupla conjugada',
      ['Interruptor', 'Tomada', 'Tomada']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Dupla conjugada',
      ['Tomada', 'Interruptor', 'Tomada']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Dupla conjugada',
      ['Tomada', 'Tomada', 'Interruptor']),

// Interruptor Paralelo 1 Tecla e Tomada Dupla conjugada
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada Dupla conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Tomada']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Dupla conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada Dupla conjugada',
      ['Tomada', 'Tomada', 'Interruptor Paralelo']),

// Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada',
      ['Interruptor', 'Tomada 20A', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada',
      ['Tomada 20A', 'Interruptor', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada',
      ['Tomada 20A', 'Tomada 20A', 'Interruptor']),

// Interruptor Paralelo 1 Tecla e Tomada Dupla conjugada
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada 20A Dupla conjugada',
      ['Interruptor Paralelo', 'Tomada 20A', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada',
      ['Tomada 20A', 'Interruptor Paralelo', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Tecla e Tomada 20A Dupla conjugada',
      ['Tomada 20A', 'Tomada 20A', 'Interruptor Paralelo']),

// Interruptor Simples 1 Paralelo e Tomada Simples conjugada
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada Simples conjugada',
      ['Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Paralelo 1 Tecla e Tomada Simples conjugada',
      ['Tomada', 'Interruptor Paralelo']),

//Interruptor Simples 2 Teclas e Tomada Simples conjugada
  nomesModulos('Interruptor Simples 2 Teclas e Tomada Simples conjugada',
      ['Interruptor', 'Interruptor', 'Tomada']),
  nomesModulos('Interruptor Simples 2 Teclas e Tomada Simples conjugada',
      ['Interruptor', 'Tomada', 'Interruptor']),
  nomesModulos('Interruptor Simples 2 Teclas e Tomada Simples conjugada',
      ['Tomada', 'Interruptor', 'Interruptor']),

  //Interruptor Paralelo 2 Tecla e Tomada Simples conjugada
  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada Simples conjugada',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada Simples conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada Simples conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Interruptor Paralelo']),

  //Interruptor Simples 1 Tecla e Interruptor Paralelo 1 Tecla conjugada
  nomesModulos(
      'Interruptor Simples 1 Tecla e Interruptor Paralelo 1 Tecla conjugada,',
      ['Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Simples 1 Tecla e Interruptor Paralelo 1 Tecla conjugada,',
      ['Interruptor Paralelo', 'Interruptor']),

//Interruptor Simples 2 Teclas e Interruptor Paralelo 1 Tecla conjugada
  nomesModulos(
      'Interruptor Simples 2 Teclas e Interruptor Paralelo 1 Tecla conjugada',
      ['Interruptor', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Simples 2 Teclas e Interruptor Paralelo 1 Tecla conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor']),
  nomesModulos(
      'Interruptor Simples 2 Teclas e Interruptor Paralelo 1 Tecla conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor']),

//Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada
  nomesModulos(
    'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
    ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor'],
  ),
  nomesModulos(
      'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor Paralelo']),

  //Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada
  nomesModulos(
      'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor']),
  nomesModulos(
      'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Paralelo 2 Teclas e Interruptor Simples 1 Tecla conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor Paralelo']),

//Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada
  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Tomada']),
  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Interruptor']),
  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Tomada']),

  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Interruptor', 'Tomada', 'Interruptor Paralelo']),

  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Tomada', 'Interruptor', 'Interruptor Paralelo']),

  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Interruptor']),

//Tomada Simples e Tomada 20A conjugada
  nomesModulos(
      'Tomada Simples e Tomada 20A conjugada', ['Tomada 20A', 'Tomada']),
  nomesModulos(
      'Tomada Simples e Tomada 20A conjugada', ['Tomada', 'Tomada 20A']),

//Interruptor simples e Tomada 20A conjugada
  nomesModulos('Interruptor Simples e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor']),
  nomesModulos('Interruptor Simples e Tomada 20A conjugada',
      ['Interruptor', 'Tomada 20A']),

//Interruptor Interruptor Paralelo e Tomada 20A conjugada
  nomesModulos('Interruptor Interruptor Paralelo e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor Paralelo']),

  nomesModulos('Interruptor Interruptor Paralelo e Tomada 20A conjugada',
      ['Interruptor Paralelo', 'Tomada 20A']),

//Interruptor Simples 2 Teclas e Tomada 20A
  nomesModulos('Interruptor Simples 2 Teclas e Tomada 20A conjugada',
      ['Interruptor', 'Interruptor', 'Tomada 20A']),

  nomesModulos('Interruptor Simples 2 Teclas e Tomada 20A conjugada',
      ['Interruptor', 'Tomada 20A', 'Interruptor']),

  nomesModulos('Interruptor Simples 2 Teclas e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor', 'Interruptor']),
//Interruptor Paralelo 2 Teclas e Tomada 20A

  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada 20A conjugada',
      ['Interruptor', 'Interruptor', 'Tomada 20A']),

  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada 20A conjugada',
      ['Interruptor', 'Tomada 20A', 'Interruptor']),

  nomesModulos('Interruptor Paralelo 2 Teclas e Tomada 20A conjugada',
      ['Tomada 20A', 'Interruptor', 'Interruptor']),

//Tampa cega
  nomesModulos('Tampa Cega', ['Tampa Cega', 'Tampa Cega', 'Tampa Cega']),
];
