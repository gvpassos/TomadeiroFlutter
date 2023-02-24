import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class disjuntor {
  String polar, amper;
  int quant;
  disjuntor(this.polar, this.amper, this.quant);

  String nomeExibicao() {
    return 'Disjuntor $polar de $amper Amperes';
  }
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

  //Controle para recuperar o nome do alert
  TextEditingController controleNomedoArquivo = TextEditingController();

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
              style: const TextStyle(color: Colors.black87),
              underline: Container(
                height: 2,
                color: Colors.black87,
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
              style: const TextStyle(color: Colors.black87),
              underline: Container(
                height: 2,
                color: Colors.black87,
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
      const Text(
        "Lista de Disjuntores",
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
        child: SingleChildScrollView(child: carregarDisjuntores()),
      ),
      Container(
          margin: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: compartilharLista, child: const Text("Compartilhar"))),
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

  compartilharLista() async {
    //Criar novo PDF document
    PdfDocument document = PdfDocument();

    //Criar a PdfGrid
    PdfGrid grid = PdfGrid();

    //Adicionando as cabeçalho para o grid
    grid.columns.add(count: 2);
    grid.columns[0].width = 400;

    //Adicionando as cabeçalho para o grid
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Nome';
    header.cells[1].value = 'Quant.';

    //configurando o style do cabeçalho
    header.style = PdfGridCellStyle(
      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.dimGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 30,
          style: PdfFontStyle.bold),
    );

    //Adicionando as Linhas para o grid
    for (int cont = 0; cont < listaDisjuntores.length; cont++) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = listaDisjuntores[cont].nomeExibicao();
      row.cells[1].value = listaDisjuntores[cont].quant.toString();

      //configurando o style
      PdfBrush corLinha =
          cont % 2 == 0 ? PdfBrushes.white : PdfBrushes.lightGray;

      grid.style = PdfGridStyle(
          cellPadding: PdfPaddings(left: 2, right: 2, top: 4, bottom: 5),
          backgroundBrush: corLinha,
          textBrush: PdfBrushes.black,
          font: PdfStandardFont(PdfFontFamily.timesRoman, 25));
    }

    //desenhar a tabela
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    //Salvar o documento
    List<int> bytes = await document.save();
    final directory = await getApplicationSupportDirectory();

    await obterNome(
        context); //Chama um dialogo para cadastrar o nome do arquivo

    File file = File(
        '${directory.path}/${controleNomedoArquivo.text}.pdf'); // Local onde sera salvo o documento
    await file.writeAsBytes(bytes, flush: true);

    /// armazenar na memoria

    // ignore: deprecated_member_use
    Share.shareXFiles([XFile(file.path)]);

    //Dispose the document
    document.dispose();
  }

  //Input para pegar o nome do Arquivo usando na funcao de compartilhamento
  Future<void> obterNome(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Digite o Nome para o PDF:'),
            content: TextField(
              controller: controleNomedoArquivo,
              decoration: const InputDecoration(hintText: "Lista de Materiais"),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
