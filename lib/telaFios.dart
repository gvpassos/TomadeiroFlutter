import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tomadeiro/compartilhar.dart';

class Fios extends objeto {
  String cor, diametro, tipo;
  int quant;

  Fios(this.cor, this.diametro, this.tipo, this.quant);

  @override
  String nomeExibicao() {
    return 'Cabo Flexivel de ${diametro}mm $cor';
  }

  String nomeExibicaoCompleto() {
    String plural = quant > 1 ? '${tipo}s' : tipo;
    return '${nomeExibicao()}: $quant $plural ';
  }

  @override
  String gerarQuant() {
    return '${quant.toString()} ${quant > 1 ? '${tipo}s' : tipo}';
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
  TextEditingController isolanteControle = TextEditingController();

  //Incluir Isolante
  bool teraIsolante = false;
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
                    setState(() {
                      limparFios();
                    });
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
        height: 230.0,
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(child: carregarFios()),
      ),
      Row(children: [
        Checkbox(
            checkColor: Colors.white,
            value: teraIsolante,
            onChanged: (bool? value) {
              setState(() {
                teraIsolante = value!;
              });
            }),
        incluirIsolante()
      ]),
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
      exibirFios.add(TextButton(
          onPressed: () {
            setState(() {
              diminiurQuant(cont);
            });
          },
          child: Text(
            element.nomeExibicaoCompleto(),
            style: const TextStyle(color: Colors.black),
          )));
    }
    return Column(
      children: exibirFios,
    );
  }

  diminiurQuant(int pos) {
    /// diminuir a Quantidade de fios ao tocar no item
    if (listaFios[pos].quant > 1) {
      listaFios[pos].quant--;
    } else {
      listaFios.removeAt(pos);
    }
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
    File file = await criarPDFFios(listaFios, controleNomedoArquivo.text);

    //compartilhar
    compartilhador(file);
    listaFios.clear();
  }

  Widget incluirIsolante() {
    if (teraIsolante) {
      return Container(
        padding: const EdgeInsets.only(left: 20),
        width: 80,
        height: 30,
        child: TextField(
          controller: isolanteControle,
          keyboardType: TextInputType.number,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 20),
        width: 180,
        height: 30,
        child: const Text('incluir isolante'),
      );
    }
  }

  Future<File> criarPDFFios(
      List<objeto> listaStrings, String nomeArquivo) async {
    //Criar novo PDF document
    PdfDocument document = PdfDocument();

    //Criar a PdfGrid
    PdfGrid grid = PdfGrid();

    //Adicionando as cabeçalho para o grid
    grid.columns.add(count: 2);
    grid.columns[0].width = 400;
    grid.columns[0].format = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.bottom);

    grid.columns[1].format = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.bottom);

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
    for (int cont = 0; cont < listaStrings.length; cont++) {
      //configurando o style
      PdfBrush corLinha =
          cont % 2 == 0 ? PdfBrushes.white : PdfBrushes.lightGray;

      grid.style = PdfGridStyle(
          cellPadding: PdfPaddings(left: 2, right: 2, top: 4, bottom: 5),
          backgroundBrush: corLinha,
          textBrush: PdfBrushes.black,
          font: PdfStandardFont(PdfFontFamily.timesRoman, 25));

      PdfGridRow row = grid.rows.add();
      row.cells[0].value = listaStrings[cont].nomeExibicao();
      row.cells[1].value = listaStrings[cont].gerarQuant();
    }

    if (teraIsolante) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = 'Isolante de 20 Metros';
      row.cells[1].value =
          '${isolanteControle.text} Unidade${isolanteControle.text == '1' ? '' : 's'}';
    }
    //desenhar a tabela
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    //Salvar o documento
    List<int> bytes = await document.save();
    final directory = await getApplicationDocumentsDirectory();

    File file = File(
        '${directory.path}/$nomeArquivo.pdf'); // Local onde sera salvo o documento
    await file.writeAsBytes(bytes, flush: true);

    /// armazenar na memoria
    document.dispose();

    return file;
  }
}
