import 'package:flutter/material.dart';


class Registro extends StatelessWidget {
  Registro({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
      ),
      body: const Column(
             children: [
                Text('Hola')
             ],
      ),
    );
  }
} 