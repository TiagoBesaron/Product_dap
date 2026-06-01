import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../entities/product.dart';
import '../entities/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  void agregarProducto(Product p) {
  agregarProducto(p);
}

void ordenarProductos() {
  ordenarProductos();
}
}

class _HomeScreenState extends State<HomeScreen> {

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();

  void agregar() {
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

    // 👉 usamos la lista global
    agregarProducto(product);

    nameController.clear();
    descController.clear();
    priceController.clear();

    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carga de productos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                  onPressed: agregar,
                  child: const Text('Agregar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.push('/result');
                  },
                  child: const Text('Ver resultados'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 👉 OPCIONAL (pero suma): mostrar lista actual
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final p = productos[index];
                  return ListTile(
                    title: Text(p.name),
                    subtitle: Text(p.description),
                    trailing: Text("\$${p.price}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}