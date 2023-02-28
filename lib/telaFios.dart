import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tomadeiro/compartilhar.dart';

class Fios extends objeto {
  String cor, diametro, tipo;
  int quant;

  Fios(this.cor, this.diametro, this.tipo, this.quant);

  String nomeExibicao() {
    String plural = quant > 1 ? '${tipo}s' : tipo;
    return 'Fio de $diametro mm da $cor : $quant $plural ';
  }
}

class telaFios extends StatefulWidget {
  final String nome;
  final Icon icone;

  const telaFios({
    super.key,
    this.nome = 'Fios',
    this.icone = const Icon(Icons.outlet_outlined),
  });
  @override
  State<telaFios> createState() => _telaFios();
}

class _telaFios extends State<telaFios> {
  // Quantidade de polos numa chave
  static const List<String> cor = <String>[
    'Azul',
    'Amarelo',
    'Branco',
    'Marron',
    'Preto',
    'Verde',
    'Vermelho',
  ];
  String corValor = cor.first;
  // Amperagem do Disjuntor
  static const List<String> diametroFio = <String>[
    '1,5',
    '2,5',
    '4',
    '6',
    '10',
    '16',
  ];
  String diametroFioValor = diametroFio.first;

  static const List<String> tipo = <String>[
    'Metro',
    'Rolo',
  ];
  String tipoValor = tipo.first;
  // Lista de Disjuntores
  List<Fios> listaFios = [];

  //Controlador input
  TextEditingController quantController = TextEditingController(text: '1');

  //Controle para recuperar o nome do alert
  TextEditingController controleNomedoArquivo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Menu para cadastrar o fio
      Row(children: [
        Container(
            padding: EdgeInsets.only(top: 9),
            width: 89,
            alignment: Alignment.bottomCenter,
            child: const Text("Cor:")),
        Container(
            padding: EdgeInsets.only(top: 9),
            width: 80,
            alignment: Alignment.bottomCenter,
            child: const Text("Diametro:")),
        Container(
            padding: EdgeInsets.only(top: 9),
            width: 100,
            alignment: Alignment.bottomCenter,
            child: const Text("Quantidade:")),
      ]),
      Row(
        children: [
          Container(
            width: 95,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 10),
            child: DropdownButton<String>(
              value: corValor,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black87),
              onChanged: (String? value) {
                setState(() {
                  corValor = value!;
                });
              },
              items: cor.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: 80,
            alignment: Alignment.topCenter,
            child: DropdownButton<String>(
              value: diametroFioValor,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black87),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  diametroFioValor = value!;
                });
              },
              items: diametroFio.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: 80,
            height: 30,
            child: TextField(
              controller: quantController,
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            // TIPO DE QUANTIDADE
            padding: EdgeInsets.only(left: 5),
            width: 90,
            alignment: Alignment.topCenter,
            child: DropdownButton<String>(
              value: tipoValor,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black87),
              onChanged: (String? value) {
                setState(() {
                  tipoValor = value!;
                });
              },
              items: tipo.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),

      Row(
        children: [
          const SizedBox(
            width: 35,
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      adicionarFios();
                    });
                  },
                  child: const Text("Adicionar"))),
          const SizedBox(
            width: 85,
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {
                    limparFios();
                  },
                  child: const Text("Limpar"))),
        ],
      ),

      const Text(
        "Lista de Fios",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        width: 500.0,
        height: 250.0,
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(child: carregarFios()),
      ),
      Container(
          margin: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: compartilharLista, child: const Text("Compartilhar"))),
    ]);
  }

  Widget carregarFios() {
    List<TextButton> exibirFios = [];
    for (var cont = 0; cont < listaFios.length; cont++) {
      var element = listaFios[cont];
      var plural = element.quant > 1 ? 's' : '';
      exibirFios.add(TextButton(
          onPressed: () {
            diminiurQuant(cont);
          },
          child: Text(
            element.nomeExibicao(),
            style: const TextStyle(color: Colors.black),
          )));
    }
    return Column(
      children: exibirFios,
    );
  }

  diminiurQuant(int pos) {
    /// diminuir a Quantidade de fios ao tocar no item
    listaFios[pos].quant--;
  }

  adicionarFios() {
    var naoInserido = true;
    for (var element in listaFios) {
      //Aumenta a quantidade se ja estiver na lista
      if (element.cor == corValor &&
          element.diametro == diametroFioValor &&
          element.tipo == tipoValor) {
        element.quant += int.tryParse(quantController.text)!;
        naoInserido = false;
      }
    }
    if (naoInserido) {
      //Nova entrada na lista
      listaFios.add(Fios(corValor, diametroFioValor, tipoValor,
          int.parse(quantController.text)));
    }
  }

  limparFios() {
    listaFios = [];
  }

  compartilharLista() async {
    await obterNome(context,
        controleNomedoArquivo); //Chama um dialogo para cadastrar o nome do arquivo

    //Criar PDF
    File file = await criarPDF(listaFios, controleNomedoArquivo.text);

    //compartilhar
    compartilhador(file);
    listaFios.clear();
  }
}
