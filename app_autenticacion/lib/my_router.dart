

import 'package:app_autenticacion/pantallafinal.dart';
import 'package:flutter/material.dart';
import 'package:app_autenticacion/my_routes.dart';
import 'package:app_autenticacion/autenticacion.dart';
import 'package:app_autenticacion/registro.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  
  MyRoutes.inicio.name: (context) => Autenticacion(),
  MyRoutes.registro.name : (context) => Registro(),
  MyRoutes.pantallafinal.name : (context) => Geo(),
};