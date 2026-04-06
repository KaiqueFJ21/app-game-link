import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void registrar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Cadastro simulado com sucesso!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: registrar,
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}
