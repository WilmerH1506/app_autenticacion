import 'package:app_autenticacion/autenticacion.dart';
import 'package:app_autenticacion/registro.dart';
import 'package:flutter/material.dart';
import 'package:app_autenticacion/my_routes.dart';

void main() {
  runApp(const MaterialApp(
    home: PantallaFinal(),
  ));
}


class PantallaFinal extends StatelessWidget {
  const PantallaFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gracias por elegir nuestra app'),
        leading: 
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MyRoutes.Bienvenida.name);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              '¡Bienvenido de nuevo!',
              style: TextStyle(fontSize: 24),
            ),
             
             Text(xi),
            const SizedBox(height: 10),

           

            const Text(
              'Has iniciado sesión exitosamente.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: const Text('Comenzar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}