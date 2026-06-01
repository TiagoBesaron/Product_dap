import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/list.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No hay productos")),
      );
    }

    ordenarProductos();

    final caro = productos.reduce((a, b) => a.price > b.price ? a : b);
    final barato = productos.reduce((a, b) => a.price < b.price ? a : b);

    final promedio = productos
            .map((p) => p.price)
            .reduce((a, b) => a + b) /
        productos.length;

    return Scaffold(
      appBar: AppBar(title: const Text("Resultados")),
      body: Column(
        children: [
          const Text("Más caro"),
          Text("${caro.name} - \$${caro.price}"),

          const SizedBox(height: 20),

          const Text("Más barato"),
          Text("${barato.name} - \$${barato.price}"),

          const SizedBox(height: 20),

          Text("Promedio: $promedio"),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => context.go('/home'),
            child: const Text("Volver"),
          ),
        ],
      ),
    );
  }
}