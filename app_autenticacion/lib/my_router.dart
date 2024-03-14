import 'package:flutter/material.dart';
import 'package:app_autenticacion/my_routes.dart';
import 'package:app_autenticacion/autenticacion.dart';


final Map<String, Widget Function(BuildContext)> routes = {
  
  MyRoutes.inicio.name: (context) => Autenticacion(),

};