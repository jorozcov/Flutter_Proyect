import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetImageScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/image1.jpeg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
  ];

  SetImageScreen({super.key});

  Future<void> _setBackgroundImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('background_image', imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración de Imagen: Selecciona una opción'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(imagePaths[index], width: 50, height: 50),
            title: Text('Imagen ${index + 1}'),
            onTap: () async {
              // Guarda la imagen seleccionada
              await _setBackgroundImage(imagePaths[index]);
              // Envía un valor true al regresar a la pantalla principal
              Navigator.pop(context, true);
            },
          );
        },
      ),
    );
  }
}
