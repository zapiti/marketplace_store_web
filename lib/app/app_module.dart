import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Temporary empty binds for now
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const TemporaryHomePage(),
    ),
  ];
}

class TemporaryHomePage extends StatelessWidget {
  const TemporaryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marketplace Web')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bem-vindo ao Marketplace Web',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('Em desenvolvimento...', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
