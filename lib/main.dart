import 'package:flutter/material.dart';
import 'package:tomadeiro/historico.dart';
import 'package:tomadeiro/telaDisjuntor.dart';
import 'package:tomadeiro/telaFios.dart';

import 'telaTomada.dart';

void main() => runApp(const Tomadeiro());

class Tomadeiro extends StatelessWidget {
  const Tomadeiro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AppBarExample(),
    );
  }
}

List<StatefulWidget> abas = <StatefulWidget>[
  /// Todas as TELAS  com o icone///

  const telaTomada(),
  const telaDisjuntor(),
  const telaFios(),
  const telaHistorico(),
];

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: abas.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Criador de Listas para Eletricistas'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.outlet_outlined),
                text: 'Tomadas',
              ),
              Tab(
                icon: Icon(Icons.switch_camera_outlined),
                text: 'Disjuntores',
              ),
              Tab(
                icon: Icon(Icons.outlet_outlined),
                text: 'Fios',
              ),
              Tab(
                icon: Icon(Icons.outlet_outlined),
                text: 'Historico',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: abas,
        ),
      ),
    );
  }
}
