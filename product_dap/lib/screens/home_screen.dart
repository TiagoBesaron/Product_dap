import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../entities/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product> products = [];

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();

  void agregarProducto() {
    if (nameController.text.isEmpty ||
        descController.text.isEmpty ||
        priceController.text.isEmpty) {
      return;
    }

    final product = Product(
      name: nameController.text,
      description: descController.text,
      price: double.parse(priceController.text),
    );

    products.add(product);

    nameController.clear();
    descController.clear();
    priceController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carga de productos")),
      body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      const Text(
        "Agregar Producto",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),

      const SizedBox(height: 20),

      TextField(
        controller: nameController,
        decoration: const InputDecoration(
          labelText: 'Nombre',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: descController,
        decoration: const InputDecoration(
          labelText: 'Descripción',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: priceController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Precio',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 20),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: agregarProducto,
            child: const Text('Agregar'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              context.push('/result', extra: products);
            },
            child: const Text('Calcular'),
          ),
        ],
      ),
    ],
  ),
),
    );
  }
}