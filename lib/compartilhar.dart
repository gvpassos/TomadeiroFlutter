import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class objeto {
  int quant = 1;
  String nomeExibicao() {
    return "Nome do Objeto";
  }
}

Future<void> obterNome(
    BuildContext context, TextEditingController controleNomedoArquivo) async {
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
              onPressed: () {
                controleNomedoArquivo.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

Future<File> criarPDF(List<objeto> listaStrings, String nomeArquivo) async {
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
    font:
        PdfStandardFont(PdfFontFamily.timesRoman, 30, style: PdfFontStyle.bold),
  );

  //Adicionando as Linhas para o grid
  for (int cont = 0; cont < listaStrings.length; cont++) {
    //configurando o style
    PdfBrush corLinha = cont % 2 == 0 ? PdfBrushes.white : PdfBrushes.lightGray;

    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 2, top: 4, bottom: 5),
        backgroundBrush: corLinha,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 25));

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = listaStrings[cont].nomeExibicao();
    row.cells[1].value = listaStrings[cont].quant.toString();
  }

  //desenhar a tabela
  grid.draw(
      page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

  //Salvar o documento
  List<int> bytes = await document.save();
  final directory = await getApplicationSupportDirectory();

  File file = File(
      '${directory.path}/$nomeArquivo.pdf'); // Local onde sera salvo o documento
  await file.writeAsBytes(bytes, flush: true);

  /// armazenar na memoria
  document.dispose();

  return file;
}

compartilhador(File pdf) {
  Share.shareXFiles([XFile(pdf.path)]);
}
