

import 'package:app_autenticacion/my_routes.dart';

import 'package:flutter/material.dart';

final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final namecontroller = TextEditingController();
  final apellidocontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final telfonocontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();



class Registro extends StatelessWidget {
  Registro({
    super.key,
  });
bool _estado = true;

  
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
       leading: IconButton(

icon: const Icon(Icons.arrow_back),
onPressed: (){
  Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
   namecontroller.clear();
                apellidocontroller.clear();
                emailController.clear();
                telfonocontroller.clear();
                passwordController.clear();
                confirmpasswordcontroller.clear();
},

       ),
      ),
     body:  Padding(padding: const EdgeInsets.all(16),
     child: SingleChildScrollView(
child: Column(
  children: [
    Form( key: formKey,
    child:
     Column( children: [
      const SizedBox(height: 20,),
       const Text('Bienvenido', style: TextStyle(fontSize: 22, color: Colors.black87),),
       TextFormField(controller: namecontroller,//Nombre
       maxLength: 20,
       validator: (value) => validador(value, 'Nombre'),
       keyboardType: TextInputType.text ,
       decoration: const InputDecoration(label: Text('Nombre'),
       icon: Icon(Icons.person_2),
       border: OutlineInputBorder(),),),

         TextFormField(controller: apellidocontroller,
       maxLength: 20,
       validator: (value) => validador(value, 'Apellido'),//Apellido
       keyboardType: TextInputType.text ,
       decoration: const InputDecoration(label: Text('Apellido'),
       icon: Icon(Icons.person),
       border: OutlineInputBorder(),),),

       TextFormField(controller: emailController,//Email
       maxLength: 20,
       validator: (value) => validador(value, 'Email'),
       keyboardType: TextInputType.text ,
       decoration: const InputDecoration(label: Text('Email'),
       icon: Icon(Icons.email_rounded),
       border: OutlineInputBorder(),),),

        TextFormField(controller: telfonocontroller,//Telefono
       maxLength: 20,
       validator: (value) => validador(value, 'Telefono'),
       keyboardType: TextInputType.text ,
       decoration: const InputDecoration(label: Text('Telefono'),
       icon: Icon(Icons.phone_android),
       border: OutlineInputBorder(),),),

         TextFormField(controller: passwordController,//Password
       maxLength: 20,
       validator: (value) => validador(value, 'Password'),
       keyboardType: TextInputType.text ,       
       decoration:  InputDecoration(label: const  Text('Password'),
       icon:  const  Icon(Icons.lock),
       suffixIcon: IconButton(
          icon: Icon(_estado ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
              _estado = !_estado;
          },
        ),
       border: const OutlineInputBorder(),),),

        TextFormField(controller: confirmpasswordcontroller,//Confirmar Password
       maxLength: 20,
       validator: (value) => validador(value, 'Confirm Password'),
       keyboardType: TextInputType.text ,
       decoration:  InputDecoration(label: const  Text('Confirm Password'),
       icon:  const  Icon(Icons.lock),
       suffixIcon: IconButton(
          icon: Icon(_estado ? Icons.visibility : Icons.visibility_off),
          onPressed: () { 
              _estado = !_estado;    
          },
        ),
       border: const OutlineInputBorder(),),),

                     
                      
                        const SizedBox(height: 20,),
                         ElevatedButton(
                          onPressed: () {
                             
   if (formKey.currentState!.validate()) {
              print('formulario valido',);
              print(namecontroller.text);
               print(apellidocontroller.text);
                print(emailController.text);
                print(telfonocontroller.text);
                print(passwordController.text);
                print(confirmpasswordcontroller.text);
                const Text('Te has registrado correctamente');
                
                Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
                namecontroller.clear();
                apellidocontroller.clear();
                emailController.clear();
                telfonocontroller.clear();
                passwordController.clear();
                confirmpasswordcontroller.clear();
              //TODO: LOGICA PARA GUARDAR LOS DATOS
            }





                          }, 
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Registrarse'),
                            ],
                          )),
     ],
     ), ),
  ],
),
     ),   
     ),
    );
  }
} 



 String? validador(value, fieldtype,  ) {

    if(fieldtype == 'Nombre'){
if(value!.isEmpty) return 'El Nombre es obligatorio';
if (value.length < 3) return 'El nombre debe tener al menos 3 caracteres';
    }

    if(fieldtype == 'Apellido'){
if(value!.isEmpty) return 'El Apellido es obligatorio';
if (value.length < 3) return 'El Apellido debe tener al menos 3 caracteres';
    }

     if(fieldtype == 'Email'){
if(value!.isEmpty) return 'El Correo es obligatorio';
if (!value.contains('@unah.hn')) return 'El Correo debe terminar en @unah.hn';
    }

       if(fieldtype == 'Telefono'){
if(value!.isEmpty) return 'El Telefono es obligatorio';
if (value.length < 8) return 'Debe contener 8 digitos minimo';
    }

           if(fieldtype == 'Password'){
if(value!.isEmpty) return 'El La contraseña es obligatoria';
if (value.length < 3) return 'Debe contener almenos 3 caracteres';
    }

           if(fieldtype == 'Confirm Password'){
if(value!.isEmpty) return 'El La contraseña es obligatoria';
if (value.length < 3) return 'Debe contener almenos 3 caracteres';
if(confirmpasswordcontroller.text != passwordController.text) return 'No coiciden las constraseñas';
    }
  
    return null;
  }

class CustomInput extends StatefulWidget {
 CustomInput({
    super.key,
    required this.controller,
    required this.obscureText,
    
   
    this.suffixIcon
  });

  final TextEditingController controller;
  bool obscureText;
  
  
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

