import 'package:flutter/material.dart';
import '../models/receta_model.dart';

class DetailScreen extends StatelessWidget {
  final Receta receta;

  const DetailScreen({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receta.nombre),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen grande con transición Hero
            Hero(
              tag: receta.id,
              child: Image.network(
                receta.imagenUrl,
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receta.nombre,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Chip(
                        backgroundColor: Colors.teal[50],
                        label: Text(receta.categoria, style: TextStyle(color: Colors.teal[800])),
                      ),
                      const SizedBox(width: 12),
                      Text('⏱️ Tiempo: ${receta.tiempo}', style: const TextStyle(fontSize: 15)),
                      const SizedBox(width: 12),
                      Text('🔥 ${receta.calorias} kcal', style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Preparación',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    receta.descripcion,
                    style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.4),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('¡Receta agregada a tu plan saludable!')),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                      label: const Text('Guardar en Favoritos', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}