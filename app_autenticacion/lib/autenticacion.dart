import 'package:flutter/material.dart';


class Autenticacion extends StatelessWidget {
  Autenticacion({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio de sesion'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: 
        Padding(
             padding: const EdgeInsets.all(16),
             child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        const Text('Bienvenido', style: TextStyle(fontSize: 22, color: Colors.black87),),
                        const SizedBox(height: 20,),
                         CustomInput(controller: emailController,
                             labelText: 'Email',
                             prefixIcon: const Icon(Icons.email),
                             obscureText: false,
                        ),
                        const SizedBox(height: 20,),
                        CustomInput(controller: passwordController,
                             labelText: 'Password',
                             prefixIcon: const Icon(Icons.lock),
                             suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                             obscureText: true,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            
                            final usuario = emailController.text;
                            final password = passwordController.text;

                            if (usuario.isEmpty)
                            {
                               ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content:Text('El Email es obligatorio'))
                             );
                            }

                            if(password.isEmpty)
                            {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content:Text('El Email es obligatorio'))
                             );
                            }

                          }, 
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Iniciar sesion'),
                            ],
                          ))
                      ],
                    )
                  )
                ],
              ),
             ),

          )
      );
  }
}  



class CustomInput extends StatefulWidget {
 CustomInput({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon
  });

  final TextEditingController controller;
  bool obscureText;
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed:(){
                  setState(() {
                     widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}