import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Historico',
        style: TextStyle(
          fontFamily: 'timesRoman',
          fontSize: 21,
          color: Color.fromARGB(255, 4, 23, 39),
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        width: 350,
        height: 390,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 73, 122, 146)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
            child: FutureBuilder(
                future: gerarLista(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return const Center(
                      child: Text(
                        'oiii',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    );
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
  Future<List<String>> gerarLista() async {
    //Obetendo a Lista de aqruivos
    Directory directory = await getApplicationSupportDirectory();
    List<FileSystemEntity> files = directory.listSync();

    List<String> listaArquivos = [];
    for (var file in files) {
      listaArquivos.add(file.path);
    }

    return listaArquivos;
  }
}
