import 'package:flutter/material.dart';
import 'package:tomadeiro/telaDisjuntor.dart';

import 'telaTomada.dart';

void main() => runApp(const Tomadeiro());

class Tomadeiro extends StatelessWidget {
  const Tomadeiro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const AppBarExample(),
    );
  }
}

List<StatefulWidget> abas = <StatefulWidget>[
  /// Todas as TELAS  com o icone///

  const telaTomada(),
  const telaDisjuntor(),
  const telaTomada(),
  const telaTomada(),
];

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: abas.length,
      child: Scaffold(
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
                text: 'historico',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[abas[0], abas[1], abas[2], abas[3]],
        ),
      ),
    );
  }
}
