import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/list.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userController = TextEditingController();
  final passController = TextEditingController();

  void validar(BuildContext context) {
    if (login(userController.text, passController.text)) {
      context.go('/home');
    } else {
      print("Usuario incorrecto");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: userController, decoration: const InputDecoration(labelText: "Usuario")),
            TextField(controller: passController, decoration: const InputDecoration(labelText: "Contraseña")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => validar(context),
              child: const Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}