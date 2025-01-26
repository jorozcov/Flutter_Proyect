import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _backgroundImage = 'assets/default_image.jpeg'; // Imagen predeterminada

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  Future<void> _loadBackgroundImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('background_image');
    if (imagePath != null) {
      setState(() {
        _backgroundImage = imagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo que cubre toda la pantalla
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Botones centrados
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result =
                        await Navigator.pushNamed(context, '/set_image');
                    if (result == true) {
                      _loadBackgroundImage();
                    }
                  },
                  child: Text('Abrir configuración de imagen'),
                ),
                SizedBox(height: 20), // Espaciado entre los botones
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/info');
                  },
                  child: Text('Ir a información personal'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
