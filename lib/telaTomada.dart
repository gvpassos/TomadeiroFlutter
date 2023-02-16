import 'dart:ffi';

import 'package:flutter/material.dart';

//Class de Tomada
class ponto {
  List<String> modulos = [];
  ponto(this.modulos);

  exibir() {
    return Text('$modulos');
  }
}

//Lista de modulos
List<String> modulos = [];

//Lista de Pontos
List<ponto> listaPontos = [];

class telaTomada extends StatefulWidget {
  final String nome;
  final Icon icone;

  const telaTomada({
    super.key,
    this.nome = 'Tomadas',
    this.icone = const Icon(Icons.outlet_outlined),
  });
  @override
  State<telaTomada> createState() => _telaTomada();
}

class _telaTomada extends State<telaTomada> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              width: 200.0,
              height: 300.0,
              child: carregarmodulo()),
          SizedBox(
            width: 200.0,
            height: 300.0,
            child: Column(
              children: [
                // Botao Tomada -------------------------------
                Container(
                  width: 200,
                  height: 55,
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5)),
                    onPressed: () {
                      setState(() {
                        adicionarModulo('Tomada');
                      });
                    },
                    child: const Text('Tomada'),
                  ),
                ),
                // Botao Tomada 20A ---------------------------
                Container(
                  width: 200,
                  height: 55,
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5)),
                    onPressed: () {
                      setState(() {
                        adicionarModulo('Tomada 20A');
                      });
                    },
                    child: const Text('Tomada 20A'),
                  ),
                ),
                // Botao Interruptor --------------------------
                Container(
                  width: 200,
                  height: 55,
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1,
                            color: Colors.brown), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(
                            5) //content padding inside button
                        ),
                    onPressed: () {
                      setState(() {
                        adicionarModulo('Interruptor');
                      });
                    },
                    child: const Text('Interruptor'),
                  ),
                ),
                // Botao Interruptor Paralelo------------------
                Container(
                  width: 200,
                  height: 55,
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1,
                            color: Colors.brown), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(
                            5) //content padding inside button
                        ),
                    onPressed: () {
                      setState(() {
                        adicionarModulo('Interruptor Paralelo');
                      });
                    },
                    child: const Text('Interruptor Paralelo'),
                  ),
                ),
                // Botao TAMPA CEGA------------------
                Container(
                  width: 200,
                  height: 55,
                  padding: const EdgeInsets.all(1.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5)),
                    onPressed: () {
                      setState(() {
                        adicionarModulo('Tampa Cega');
                      });
                    },
                    child: const Text('Tampa Cega'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      Row(
        children: [
          const SizedBox(
            width: 55,
          ),
          ElevatedButton(
              onPressed: adicionarPonto, child: const Text("Adicionar")),
          const SizedBox(
            width: 15,
          ),
          ElevatedButton(onPressed: limparPonto, child: const Text("Remover")),
          const SizedBox(
            width: 15,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Compartilhar")),
        ],
      ),
      ultimodaLista(),
    ]);
  }

  //se a lLista de Pontos nao estiver vazia ela exibi a ultima insercao
  ultimodaLista() {
    if (listaPontos.isEmpty) {
      return const Text('Lista Vazia');
    } else {
      return listaPontos.last.exibir();
    }
  }

  /// RECARRECA e Exibi as insercoes do ponto na tela
  carregarmodulo() {
    if (modulos.isEmpty) {
      return const Text('adicione modulos ao lado ');
    } else {
      List<Container> tmpLista = [];
      for (var item in modulos) {
        tmpLista.add(Container(
            width: 200,
            height: 87.5,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 15, 107, 153)),
              borderRadius: const BorderRadius.all(Radius.circular(1)),
            ),
            child: Center(child: Text(item))));
      }
      ;
      return Column(children: tmpLista);
    }
  }

  adicionarModulo(String mod) {
    if (modulos.length < 3) {
      modulos.add(mod);
    } else {
      ///Limite de 3
    }
  }

  // Funcao para limpar o ponto
  // Limpar o array modulo
  limparPonto() {
    setState(() {
      modulos = [];
    });
  }

  // Funcao para mover o ponto para a lista final
  // Limpar o array modulo
  adicionarPonto() {
    listaPontos.add(ponto(modulos));
    setState(() {
      modulos = [];
    });
  }
}
