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
  nomesModulos('Tomada 1 Sessão', ['Tomada']),
  nomesModulos('Tomada 2 Sessões', ['Tomada', 'Tomada']),
  nomesModulos('Tomada 3 Sessões', ['Tomada', 'Tomada', 'Tomada']),

  //Tomadas 20A
  nomesModulos('Tomada 20A 1 Sessão', ['Tomada 20A']),
  nomesModulos('Tomada 20A 2 Sessões', ['Tomada 20A', 'Tomada 20A']),
  nomesModulos(
      'Tomada 20A 3 Sessões', ['Tomada 20A', 'Tomada 20A', 'Tomada 20A']),

  // Interruptor 1,2 e 3 Sessões
  nomesModulos('Interruptor 1 Sessão', ['Interruptor']),
  nomesModulos('Interruptor 2 Sessões', ['Interruptor', 'Interruptor']),
  nomesModulos(
      'Interruptor 3 Sessões', ['Interruptor', 'Interruptor', 'Interruptor']),

  // Interruptor Paralelo 1,2 e 3 Sessões
  nomesModulos('Interruptor Paralelo 1 Sessão', ['Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 2 Sessões',
      ['Interruptor Paralelo', 'Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 3 Sessões',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor Paralelo']),

// Interruptor 1 Tecla e Tomada conjugada
  nomesModulos('Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor', 'Tomada']),
  nomesModulos('Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Tomada', 'Interruptor']),

// Interruptor Simples 1 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor']),

// Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Tomada 20A']),
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor Paralelo']),

// Interruptor 1 Sessão e Tomada 2 Sessões conjugada
  nomesModulos('Interruptor 1 Sessão e Tomada 2 Sessões conjugada',
      ['Interruptor', 'Tomada', 'Tomada']),
  nomesModulos('Interruptor 1 Tecla e Tomada 2 Sessões conjugada',
      ['Tomada', 'Interruptor', 'Tomada']),
  nomesModulos('Interruptor 1 Tecla e Tomada 2 Sessões conjugada',
      ['Tomada', 'Tomada', 'Interruptor']),

// Interruptor Paralelo 1 Sessão e Tomada 2 Sessões conjugada
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 2 Sessões conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Tomada']),
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 2 Sessões conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 2 Sessões conjugada',
      ['Tomada', 'Tomada', 'Interruptor Paralelo']),

// Interruptor 1 Sessão e Tomada 20A 2 Sessões conjugada
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Interruptor', 'Tomada 20A', 'Tomada 20A']),
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Tomada 20A', 'Interruptor', 'Tomada 20A']),
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Tomada 20A', 'Tomada 20A', 'Interruptor']),

// Interruptor Paralelo 1 Sessão e Tomada 2 Sessões conjugada
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Interruptor Paralelo', 'Tomada 20A', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Tomada 20A', 'Interruptor Paralelo', 'Tomada 20A']),
  nomesModulos('Interruptor Simples 1 Sessão e Tomada 20A 2 Sessões conjugada',
      ['Tomada 20A', 'Tomada 20A', 'Interruptor Paralelo']),

// Interruptor Paralelo 1 Sessão e Tomada 1 Sessão conjugada
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 1 Sessão conjugada',
      ['Tomada', 'Interruptor Paralelo']),

//Interruptor Simples 2 Sessões e Tomada 1 Sessão conjugada
  nomesModulos('Interruptor Simples 2 Sessões e Tomada 1 Sessão conjugada',
      ['Interruptor', 'Interruptor', 'Tomada']),
  nomesModulos('Interruptor Simples 2 Sessões e Tomada 1 Sessão conjugada',
      ['Interruptor', 'Tomada', 'Interruptor']),
  nomesModulos('Interruptor Simples 2 Sessões e Tomada 1 Sessão conjugada',
      ['Tomada', 'Interruptor', 'Interruptor']),

  //Interruptor Paralelo 2 Tecla e Tomada 1 Sessão conjugada
  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Tomada']),
  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Interruptor Paralelo']),
  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 1 Sessão conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Interruptor Paralelo']),

  //Interruptor 1 Sessão e Interruptor Paralelo 1 Sessão conjugada
  nomesModulos(
      'Interruptor 1 Sessão e Interruptor Paralelo 1 Sessão conjugada,',
      ['Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Simples 1 Sessão e Interruptor Paralelo 1 Sessão conjugada,',
      ['Interruptor Paralelo', 'Interruptor']),

//Interruptor 2 Sessões e Interruptor Paralelo 1 Sessão conjugada
  nomesModulos('Interruptor 2 Teclas e Interruptor Paralelo 1 Sessão conjugada',
      ['Interruptor', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos('Interruptor 2 Teclas e Interruptor Paralelo 1 Sessão conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor']),
  nomesModulos('Interruptor 2 Teclas e Interruptor Paralelo 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor']),

//Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada
  nomesModulos(
    'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
    ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor'],
  ),
  nomesModulos(
      'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor Paralelo']),

  //Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada
  nomesModulos(
      'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor Paralelo', 'Interruptor']),
  nomesModulos(
      'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Interruptor Paralelo']),
  nomesModulos(
      'Interruptor Paralelo 2 Sessões e Interruptor 1 Sessão conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Interruptor Paralelo']),

//Interruptor Paralelo 1 Sessão, Interruptor 1 Sessão e Tomada 1 Sessão conjugada
  nomesModulos(
      'Interruptor Paralelo 1 Sessão, Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Interruptor', 'Tomada']),
  nomesModulos(
      'Interruptor Paralelo 1 Sessão, Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Tomada', 'Interruptor']),
  nomesModulos(
      'Interruptor Paralelo 1 Sessão, Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor', 'Interruptor Paralelo', 'Tomada']),

  nomesModulos(
      'Interruptor Paralelo 1 Sessão, Interruptor 1 Sessão e Tomada 1 Sessão conjugada',
      ['Interruptor', 'Tomada', 'Interruptor Paralelo']),

  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Tomada', 'Interruptor', 'Interruptor Paralelo']),

  nomesModulos(
      'Interruptor Paralelo 1 Tecla, Interruptor Simples 1 Tecla e Tomada conjugada',
      ['Tomada', 'Interruptor Paralelo', 'Interruptor']),

//Tomada 1 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Tomada 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Tomada']),
  nomesModulos('Tomada 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada', 'Tomada 20A']),

//Interruptor 1 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor']),
  nomesModulos('Interruptor 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Tomada 20A']),

//Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor Paralelo']),

  nomesModulos('Interruptor Paralelo 1 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor Paralelo', 'Tomada 20A']),

//Interruptor 2 Sessão e Tomada 20A 1 Sessão conjugada
  nomesModulos('Interruptor 2 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Interruptor', 'Tomada 20A']),

  nomesModulos('Interruptor 2 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Tomada 20A', 'Interruptor']),

  nomesModulos('Interruptor 2 Sessão e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor', 'Interruptor']),

//Interruptor Paralelo 2 Teclas e Tomada 20A
  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Interruptor', 'Tomada 20A']),

  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 20A 1 Sessão conjugada',
      ['Interruptor', 'Tomada 20A', 'Interruptor']),

  nomesModulos('Interruptor Paralelo 2 Sessões e Tomada 20A 1 Sessão conjugada',
      ['Tomada 20A', 'Interruptor', 'Interruptor']),

//Tampa cega
  nomesModulos('Tampa Cega', ['Tampa Cega', 'Tampa Cega', 'Tampa Cega']),
];
