import 'package:flutter/material.dart';
import 'package:practica2/src/screens/agregar_nota_screen.dart';
import 'package:practica2/src/screens/edit_user_screen.dart';
import 'package:practica2/src/screens/intenciones_screen.dart';
import 'package:practica2/src/screens/movies_screen/detail_screen.dart';
import 'package:practica2/src/screens/movies_screen/popular_screen.dart';
import 'package:practica2/src/screens/notas_screen.dart';
import 'package:practica2/src/screens/propinas_screen.dart';
import 'package:practica2/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/propinas': (BuildContext context) => PropinasScreen(),
        '/intenciones': (BuildContext context) => IntencionesScreen(),
        '/notas': (BuildContext context) => NotasScreen(),
        '/agregar': (BuildContext context) => AgregarNotaScreen(),
        '/editUser': (BuildContext context) => editUserScreen(),
        '/movie': (BuildContext context) => PopularScreen(),
        '/detail': (BuildContext context) => DetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
