
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Producto {
  final String titulo;
  final IconData icono;
  final Color colorFondo;

  Producto({
    required this.titulo,
    required this.icono,
    required this.colorFondo,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITA Bebidas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LowFiScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LowFiScreen extends StatelessWidget {
  const LowFiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Producto> productos = [
      Producto(
        titulo: 'Soda',
        icono: Icons.wine_bar_outlined,
        colorFondo: Colors.white,
      ),
      Producto(
        titulo: 'Agua',
        icono: Icons.water_drop_outlined,
        colorFondo: Colors.white,
      ),
      Producto(
        titulo: 'Jugo',
        icono: Icons.liquor_outlined,
        colorFondo: Colors.white,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFC8E6C9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(text: 'I'),
              TextSpan(
                  text: 'T', style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
              TextSpan(text: 'A', style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
              TextSpan(text: ' Bebidas'),
            ],
          ),
        ),
        actions: [
          const Icon(Icons.arrow_back, color: Colors.black),
          const SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.all(8),
            width: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 0, 0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCategoryCard(productos[0]),
                const SizedBox(width: 16),
                _buildCategoryCard(productos[1]),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCategoryCard(productos[2]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Producto producto) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: producto.colorFondo,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            producto.titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            producto.icono,
            size: 60,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
