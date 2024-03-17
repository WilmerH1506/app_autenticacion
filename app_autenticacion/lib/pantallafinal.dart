import 'package:app_autenticacion/my_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Geo(),
  ));
}

class Geo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Correo Electrónico'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingresa tu correo electrónico',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'example@example.com',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí es donde navegamos a la siguiente pantalla
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaPantalla()),
                );
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Pantalla'),
        leading: IconButton(icon: const Icon(Icons.ac_unit),
        onPressed: (){
Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);

        }),
      ),
      body: const Center(
        child:  Text(
          '¡Correo electrónico enviado!',
          style: TextStyle(fontSize: 20),
        ),
    

    
      
      
      
      ),
    );
  }
}
