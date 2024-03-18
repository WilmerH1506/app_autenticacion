import 'package:app_autenticacion/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_autenticacion/autenticacion.dart';

final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final namecontroller = TextEditingController();
  final apellidocontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final telfonocontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();



class Registro extends StatelessWidget {
  const Registro({
    super.key,
  });

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
                Navigator.pushReplacementNamed(context, MyRoutes.Bienvenida.name);
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
       const Text('Crear Usuario', style: TextStyle(fontSize: 22, color: Colors.black87),),
       const SizedBox(height: 20,),
       CustomInput(
         controller: namecontroller, 
         validator: (value) 
         {
           if (value!.isEmpty)
           {
             return 'El campo nombre es obligatorio';
           }  

           if (value.length < 3)
           {
              return 'Por favor ingrese un nombre valido';
           }

           return null;
         },
        tamMax: 20,
        obscureText: false, 
        labelText: 'Nombre', 
        prefixIcon: const Icon(Icons.person_2),
        bordes: const OutlineInputBorder(),
        ),

      CustomInput(
      controller: apellidocontroller, 
      validator: (value)
      {
           if (value!.isEmpty)
           {
             return 'El campo Apellido es obligatorio';
           }  

           if (value.length < 3)
           {
              return 'Por favor ingrese un Apellido valido';
           }

           return null;
      }, 
      tamMax: 20,
      obscureText: false, 
      labelText: 'Apellido', 
      prefixIcon: const Icon(Icons.person_2),
      bordes: const OutlineInputBorder(),
      ),
      
      CustomInput(
      controller: emailController, 
      validator: (value)
      {
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
      obscureText: false, 
      tamMax: 30,
      labelText: 'Email', 
      prefixIcon: const Icon(Icons.email_rounded),
      bordes: const OutlineInputBorder(),
      ),
       
      CustomInput(
      controller: telfonocontroller, 
      validator: (value) 
      {
         if (value!.isEmpty)
           {
             return 'El campo Telefono es obligatorio';
           }  

           if (value.length < 8)
           {
              return 'Por favor ingrese un Telefono valido';
           }

           return null;
      }, 
      obscureText: false,
      tamMax: 20, 
      labelText: 'Telefono', 
      prefixIcon: const Icon(Icons.phone_iphone),
      bordes: const OutlineInputBorder(),
      ), 
    
      CustomInput(
        controller: passwordController, 
        validator: (value)
        {
           if (value!.isEmpty)
           {
             return 'El campo Contraseña es obligatorio';
           }  

           if (value.length < 3)
           {
              return 'Por favor ingrese una Contraseña valida';
           }

           return null;
        }, 
        obscureText: true, 
        tamMax: 20,
        labelText: 'Contraseña', 
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        bordes: const OutlineInputBorder(),
        ),

       CustomInput(
        controller: confirmpasswordcontroller, 
        validator: (value)
        {
           if (value!.isEmpty)
           {
             return 'El campo Contraseña es obligatorio';
           }  

           if (value.length < 3)
           {
              return 'Por favor ingrese una Contraseña valida';
           }

           return null;
        }, 
        obscureText: true, 
        labelText: 'Contraseña', 
        tamMax: 20,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        bordes: const OutlineInputBorder(),
        ),
       const SizedBox(height: 20,),
       
       ElevatedButton(
         child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Registrarse'),
                        ],
        ),
        onPressed: () 
        {                     
             final password = passwordController.text;
             final confirm = confirmpasswordcontroller.text;

              if (formKey.currentState!.validate()) 
            {
                  if (password == confirm)
                  {
                      print('formulario valido',);
                  print(namecontroller.text);
                  print(apellidocontroller.text);
                  print(emailController.text);
                  print(telfonocontroller.text);
                  print(passwordController.text);
                  const Text('Te has registrado correctamente');
                
                Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
                namecontroller.clear();
                apellidocontroller.clear();
                emailController.clear();
                telfonocontroller.clear();
                passwordController.clear();
                confirmpasswordcontroller.clear();
                  } 
                  else
                  {
                     ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content:Text('Las contraseñas ingresadas no coinciden'))
                          );
                  }
            }
        }, 
        ),
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