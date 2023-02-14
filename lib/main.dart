import 'package:flutter/material.dart';

class aba {
  ///Classe para agrupar as ABAS do Software//
  String nome;
  Icon icone;

  aba(this.nome, this.icone);
}

List<aba> titles = <aba>[
  /// Todas as TELAS  com o icone///
  aba('Tomadas', const Icon(Icons.outlet_outlined)),
  aba('Disjuntores', const Icon(Icons.switch_camera)),
  aba('Fios', const Icon(Icons.cable)),
  aba('Historico', const Icon(Icons.history))
];

void main() => runApp(const Tomadeiro());

class Tomadeiro extends StatelessWidget {
  const Tomadeiro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: titles.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criador de Listas Para eletricistas'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: titles[0].icone,
                text: titles[0].nome,
              ),
              Tab(
                icon: titles[1].icone,
                text: titles[1].nome,
              ),
              Tab(
                icon: titles[2].icone,
                text: titles[2].nome,
              ),
              Tab(
                icon: titles[3].icone,
                text: titles[3].nome,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text(titles[0].nome)),
            Center(child: Text(titles[1].nome)),
            Center(child: Text(titles[2].nome)),
            Center(child: Text(titles[3].nome)),
          ],
        ),
      ),
    );
  }
}
