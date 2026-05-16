import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../entities/product.dart';

class ResultScreen extends StatelessWidget {
  final List<Product> products;

  const ResultScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double promedio = 0;
    Product? caro;
    Product? barato;

    if (products.isNotEmpty) {
      double suma = 0;

      caro = products[0];
      barato = products[0];

      for (var p in products) {
        suma += p.price;

        if (p.price > caro!.price) {
          caro = p;
        }

        if (p.price < barato!.price) {
          barato = p;
        }
      }

      promedio = suma / products.length;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados"),
      ),
      body: Center(
        child: Column(
          children: [
const Text("Más caro"),

if (caro != null)
  Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Nombre: ${caro.name}"),
        Text("Descripción: ${caro.description}"),
        Text("Precio: ${caro.price}"),
      ],
    ),
  ),

const SizedBox(height: 20),

const Text("Más barato"),

if (barato != null)
  Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Nombre: ${barato.name}"),
        Text("Descripción: ${barato.description}"),
        Text("Precio: ${barato.price}"),
      ],
    ),
  ),
            const SizedBox(height: 30),

            Text("Promedio: $promedio"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}