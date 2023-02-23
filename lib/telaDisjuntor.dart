import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class disjuntor {
  String polar, amper;
  int quant;
  disjuntor(this.polar, this.amper, this.quant);
}

class telaDisjuntor extends StatefulWidget {
  final String nome;
  final Icon icone;

  const telaDisjuntor({
    super.key,
    this.nome = 'Tomadas',
    this.icone = const Icon(Icons.outlet_outlined),
  });
  @override
  State<telaDisjuntor> createState() => _telaDisjuntor();
}

class _telaDisjuntor extends State<telaDisjuntor> {
  // Quantidade de polos numa chave
  static const List<String> polar = <String>['Monopolar', 'Bipolar'];
  String polarValor = polar.first;
  // Amperagem do Disjuntor
  static const List<String> amper = <String>[
    '10',
    '16',
    '20',
    '25',
    '32',
    '40',
    '50',
    '63'
  ];
  String amperValor = amper.first;

  // Lista de Disjuntores
  List<disjuntor> listaDisjuntores = [];

  //Controlador input
  TextEditingController quantController = TextEditingController(text: '1');

  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            height: 80,
            width: 140,
            alignment: Alignment.bottomCenter,
            child: DropdownButton<String>(
              value: polarValor,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  polarValor = value!;
                });
              },
              items: polar.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: 90,
            height: 80,
            alignment: Alignment.bottomCenter,
            child: DropdownButton<String>(
              value: amperValor,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  amperValor = value!;
                });
              },
              items: amper.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Flexible(
            child: TextField(
              controller: quantController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
              ),
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
                      adicionarDisjuntor();
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
                    setState(() {
                      limparDisjuntor();
                    });
                  },
                  child: const Text("Limpar"))),
        ],
      ),
      const Text("Lista de Disjuntores"),
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
        child: SingleChildScrollView(child: carregarDisjuntores()),
      ),
      Container(
          margin: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Compartilhar"))),
    ]);
  }

  adicionarDisjuntor() {
    var naoInserido = true;
    for (var element in listaDisjuntores) {
      //Aumenta a quantidade se ja estiver na lista
      if (element.amper == amperValor && element.polar == polarValor) {
        element.quant += int.tryParse(quantController.text)!;
        naoInserido = false;
      }
    }
    if (naoInserido) {
      //Nova entrada na lista
      listaDisjuntores.add(
          disjuntor(polarValor, amperValor, int.parse(quantController.text)));
    }
  }

  limparDisjuntor() {
    //showAboutDialog(context: null);
  }

  carregarDisjuntores() {
    List<TextButton> exibirDisjuntores = [];
    for (var cont = 0; cont < listaDisjuntores.length; cont++) {
      var element = listaDisjuntores[cont];
      var aux = '';
      if (element.quant == 1) {
        aux =
            'Disjuntor ${element.polar} de ${element.amper} Ampers : ${element.quant} unidade';
      } else {
        aux =
            'Disjuntores ${element.polar} de ${element.amper} Ampers: ${element.quant} unidades';
      }
      exibirDisjuntores.add(TextButton(
          onPressed: diminiurQuant(cont),
          child: Text(
            aux,
            style: TextStyle(color: Colors.black),
          )));
    }
    return Column(
      children: exibirDisjuntores,
    );
  }

  diminiurQuant(int pos) {
    setState(() {
      //listaDisjuntores[pos].quant -= 1;
    });
  }
}
