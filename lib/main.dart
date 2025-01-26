import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/set_image_screen.dart';
import 'screens/info_screen.dart'; // Importa la pantalla de configuración

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/set_image': (context) => SetImageScreen(),
        '/info': (context) => InfoScreen(), 
      },
    );
  }
}
