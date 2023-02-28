import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class telaHistorico extends StatefulWidget {
  final String nome;
  final Icon icone;

  const telaHistorico({
    super.key,
    this.nome = 'Tomadas',
    this.icone = const Icon(Icons.outlet_outlined),
  });
  @override
  State<telaHistorico> createState() => _telaHistorico();
}

class _telaHistorico extends State<telaHistorico> {
  late String directory;
  List file = [];
  MediaQueryData responsive = MediaQueryData();

  @override
  Widget build(BuildContext context) {
    responsive = MediaQuery.of(context);

    return Column(children: [
      Container(
        margin: EdgeInsets.all(15),
        width: 400,
        height: 390,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 73, 122, 146)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: SingleChildScrollView(
            child: FutureBuilder(
                future: gerarLista(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: snapshot.requireData);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      )
    ]);
  }

//Buscar os arquivos na pasta do app
  Future<List<Widget>> gerarLista() async {
    //Obetendo a Lista de aqruivos
    Directory directory = await getApplicationSupportDirectory();
    List<FileSystemEntity> files = directory.listSync();

    List<Widget> listaArquivos = [];
    for (var file in files) {
      var texto = file.path.split('/').last.split('.pdf').first;
      listaArquivos.add(Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 73, 122, 146)))),
        child: Row(
          children: [
            Container(
              width: responsive.size.width * 0.60,
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                /// Arquivo Armazenado na memoria
                texto,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            IconButton(
              ///Botao de compatilhar
              onPressed: () {
                compartilharPDF(file.path);
              },
              icon: const Icon(
                Icons.share,
                color: Colors.black54,
                size: 30.0,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    deletarPDF(file.path);
                  });
                },
                icon: const Icon(
                  Icons.delete_forever_sharp,
                  color: Colors.black54,
                  size: 30.0,
                )),
          ],
        ),
      ));
    }

    return listaArquivos;
  }

  compartilharPDF(String path) async {
    Share.shareXFiles([XFile(path)]);
  }

  deletarPDF(String path) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Digite o Nome para o PDF:'),
            content: Text(
                "voce realmente deseja deletar o arquivo ${path.split('/').last}"),
            actions: [
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  try {
                    File(path).delete();
                  } catch (e) {
                    print(e);
                  }
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
