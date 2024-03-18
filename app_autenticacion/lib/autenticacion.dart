import 'package:app_autenticacion/my_routes.dart';
import 'package:flutter/material.dart';

final emailController = TextEditingController();
final xi = emailController.text;
class Autenticacion extends StatelessWidget {
  Autenticacion({super.key});

  
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Iniciar Sesion'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: ()
         {
          emailController.clear();
                Navigator.pushReplacementNamed(context, MyRoutes.Bienvenida.name);      
         },
       ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Introduzca sus credenciales',
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) 
                        {
                          return 'El campo email es obligatorio';
                        }
                        if (!value.contains('@') || !value.contains('unah.hn')) 
                        {
                          return 'El formato del correo electrónico es incorrecto';
                        }
                        return null;
                      },
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      obscureText: false,
                      bordes: const OutlineInputBorder(),
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) 
                        {
                          return 'El campo contraseña es obligatorio';
                        }

                        if (value.length < 3)
                        {
                          return 'Por favor ingrese una contraseña valida';
                        }

                        return null;
                      },
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      obscureText: true,
                      bordes: const OutlineInputBorder(),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {

                        final email = emailController.text;
                        final password = passwordController.text;

                        if(formKey.currentState!.validate())
                        {
                          if (( email == 'wyhernandezr@unah.hn' && password == '20222001369')
                        || (email == 'cdmontoyaa@unah.hn' && password == '20222001250'))
                        {
                        
                           Navigator.pushReplacementNamed(context, MyRoutes.pantallafinal.name);
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content:Text('El email o la contraseña son incorrectos'))
                          );
                        }
                      }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Iniciar sesión'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


typedef Validator = String? Function(String?);

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
   CustomInput({
    Key? key,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.tamMax,
    this.bordes,

  }) : super(key: key);

  final TextEditingController controller;
  bool obscureText;
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final Validator validator;
  final int? tamMax;
  final InputBorder? bordes;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText,
      validator: widget.validator,
      maxLength: widget.tamMax,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        border: widget.bordes,
      ),
    );
  }
}