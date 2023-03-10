import 'dart:io';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:tomadeiro/compartilhar.dart';

import 'listaNome.dart';

//Class de Tomada
class ponto extends objeto {
  List<String> modulos = [];
  String nome = "";

  ponto(this.modulos);

  finalizarAdicao() {
    for (var item in listaNomes) {
      if (const ListEquality().equals(item.getModulos(), modulos)) {
        nome = item.Nome;
      }
    }
    if (nome == "") {
      nome = modulos.toString();
    }
  }

  @override
  String nomeExibicao() {
    return '$nome';
  }
  String nomeQuantExibicao() {
    return '$nome : $quant Unidades';
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
  //armazena o ultimo ponto para exibir em um alinha no final da tela
  ponto ultimo = ponto(['Lista Vazia']);
  TextEditingController controleNomedoArquivo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive;
    responsive = MediaQuery.of(context);
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
              width: responsive.size.width * 0.5,
              height: 300.0,
              child: carregarmodulo()),
          SizedBox(
            width: responsive.size.width * 0.4,
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
          SizedBox(
            width: responsive.size.width * 0.02,
          ),
          /* Botao que adiciona o ponto na Lista de Pontos*/
          SizedBox(
            width: responsive.size.width * 0.3,
            child: ElevatedButton(
                onPressed: adicionarPonto, child: const Text("Adicionar")),
          ),
          SizedBox(
            width: responsive.size.width * 0.02,
          ),
          /* Botao para limpar os pontos colocados na tela*/
          SizedBox(
              width: responsive.size.width * 0.3,
              child: ElevatedButton(
                  onPressed: limparPonto, child: const Text("Remover"))),
          SizedBox(
            width: responsive.size.width * 0.02,
          ),
          /* Botao de Compartilhamento das Listas */
          SizedBox(
              width: responsive.size.width * 0.3,
              child: ElevatedButton(
                onPressed: compartilharLista,
                child: const Text("Compartilhar"),
              )),
        ],
      ),
      ultimodaLista(),
    ]);
  }

  //se a Lista de Pontos nao estiver vazia ela exibi a ultima insercao
  Widget ultimodaLista() {
    if (listaPontos.isEmpty) {
      return const Text('Lista Vazia');
    } else {
      return Text(listaPontos.last.nomeQuantExibicao());
    }
  }

  /*RECARRECA e Exibi as insercoes do ponto na tela*/
  carregarmodulo() {
    if (modulos.isEmpty) {
      return const Text('adicione modulos ao lado ');
    } else {
      List<Container> tmpLista = [];

      for (var index = 0; index < modulos.length; index++) {
        tmpLista.add(Container(
            width: 200,
            height: 87.5,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 15, 107, 153)),
              borderRadius: const BorderRadius.all(Radius.circular(1)),
            ),
            child: TextButton(
                onPressed: () {
                  removerPonto(index);
                },
                child: Center(child: Text(modulos.elementAt(index))))));
      }
      return Column(children: tmpLista);
    }
  }

  //adiciona o modulo a array de modulos
  adicionarModulo(String mod) {
    /// SE for precionado Tampa Cega ?? necessario que o ponto esteja vazio
    if (mod == 'Tampa Cega' && modulos.isEmpty) {
      modulos = ['Tampa Cega', 'Tampa Cega', 'Tampa Cega'];
      return null;
    }
    // SE N??O estiver vazio ele nao ser?? adicionado
    else if (mod == 'Tampa Cega') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text('ERRO !'),
                content: const Text(
                    'N??o ?? possivel adicionar mais de 3 Modulos em um Ponto'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok')),
                ]);
          });
      return null;
    }

    /// Limite de 3 por ponto
    if (modulos.length < 3) {
      modulos.add(mod);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text('ERRO !'),
                content: const Text(
                    'N??o ?? possivel adicionar mais de 3 Modulos em um Ponto'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok')),
                ]);
          });
    }
  }

  /* Funcao para remover um ponto especifico adicionado na lista */
  removerPonto(int pos) {
    setState(() {
      modulos.removeAt(pos);
    });
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
    bool novaentrada = true;
    if (listaPontos.isNotEmpty) {
      for (var p in listaPontos) {
        if (const ListEquality().equals(p.modulos, modulos)) {
          p.quant++;
          novaentrada = false;
          ultimo = p;
        }
      }
    }
    if (novaentrada) {
      listaPontos.add(ponto(modulos));
      listaPontos.last.finalizarAdicao();
      ultimo = listaPontos.last;
    }
    setState(() {
      modulos = [];
    });
  }

  compartilharLista() async {
    await obterNome(context,
        controleNomedoArquivo); //Chama um dialogo para cadastrar o nome do arquivo

    File pdf = await criarPDF(listaPontos, controleNomedoArquivo.text);

    compartilhador(pdf);
    listaPontos.clear();
  }

//Input para pegar o nome do Arquivo usando na funcao de compartilhamento
}
