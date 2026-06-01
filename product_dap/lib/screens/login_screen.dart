import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../entities/list.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
bool login(String user, String pass) {
  return usuarios.any(
    (u) => u.username == user && u.password == pass,
  );
}
  final userController = TextEditingController();
  final passController = TextEditingController();

  void validar(BuildContext context) {
    if (login(userController.text, passController.text)) {
      context.go('/home');
    } else {
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Usuario incorrecto"),
  ),
);
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