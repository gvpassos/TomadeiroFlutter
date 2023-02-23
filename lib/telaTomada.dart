import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:collection/collection.dart';

import 'listaNome.dart';

//Class de Tomada
class ponto {
  List<String> modulos = [];
  int quant = 1;
  String nomeExibicao = "";

  ponto(this.modulos);

  finalizarAdicao() {
    for (var nome in listaNomes) {
      if (const ListEquality().equals(nome.getModulos(), modulos)) {
        nomeExibicao = nome.Nome;
      }
    }
    if (nomeExibicao == "") {
      nomeExibicao = modulos.toString();
    }
  }

  exibir() {
    return Text('$nomeExibicao: $quant unidade');
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
  late ponto ultimo;
  TextEditingController controleNomedoArquivo = TextEditingController();

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
          /* Botao que adiciona o ponto na Lista de Pontos*/
          ElevatedButton(
              onPressed: adicionarPonto, child: const Text("Adicionar")),
          const SizedBox(
            width: 15,
          ),
          /* Botao para limpar os pontos colocados na tela*/
          ElevatedButton(onPressed: limparPonto, child: const Text("Remover")),
          const SizedBox(
            width: 15,
          ),
          /* Botao de Compartilhamento das Listas */
          ElevatedButton(
              onPressed: compartilharLista, child: const Text("Compartilhar")),
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
      // ignore: unnecessary_null_comparison
      if (ultimo == null) {
        return listaPontos.last.exibir();
      } else {
        return ultimo.exibir();
      }
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
              border: Border.all(color: Color.fromARGB(255, 15, 107, 153)),
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
    if (modulos.length < 3) {
      modulos.add(mod);
    } else {
      ///Limite de 3
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
    //Criar novo PDF document
    PdfDocument document = PdfDocument();

    //Criar a PdfGrid
    PdfGrid grid = PdfGrid();

    //Adicionando as cabeçalho para o grid
    grid.columns.add(count: 2);

    //Adicionando as cabeçalho para o grid
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Nome';
    header.cells[1].value = 'Quantidade';

    //configurando o style do cabeçalho
    header.style = PdfGridCellStyle(
      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.dimGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 30,
          style: PdfFontStyle.bold),
    );

    //Adicionando as Linhas para o grid
    for (int cont = 0; cont < listaPontos.length; cont++) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = listaPontos[cont].nomeExibicao;
      row.cells[1].value = listaPontos[cont].quant.toString();

      //configurando o style
      PdfBrush corLinha =
          cont % 2 == 0 ? PdfBrushes.lightGray : PdfBrushes.white;

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
    final path = directory.path;

    await obterNome(
        context); //Chama um dialogo para cadastrar o nome do arquivo
    String nome = controleNomedoArquivo.text;
    File file = File('$path/$nome.pdf'); // Local onde sera salvo o documento

    await file.writeAsBytes(bytes, flush: true);

    /// armazenar na memoria

    // ignore: deprecated_member_use
    Share.shareFiles([file.path]);

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
