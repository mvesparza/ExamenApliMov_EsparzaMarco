import 'package:flutter/material.dart';
import 'pantallas/pantalla_bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triángulo Rectángulo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaBienvenida(),
    );
  }
}
