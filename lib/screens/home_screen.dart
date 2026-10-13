import 'package:flutter/material.dart';
import '../models/receta_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  String selectedCategory = 'Todas';

  final List<String> categorias = ['Todas', 'Desayunos', 'Saludable', 'Comidas', 'Postres'];

  @override
  Widget build(BuildContext context) {
    final recetasFiltradas = listaRecetas.where((receta) {
      final coincideNombre = receta.nombre.toLowerCase().contains(searchQuery.toLowerCase()) ||
          receta.descripcion.toLowerCase().contains(searchQuery.toLowerCase());
      final coincideCategoria = selectedCategory == 'Todas' || receta.categoria == selectedCategory;
      return coincideNombre && coincideCategoria;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenPlate 🥗'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar recetas...',
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                filled: true,
                fillColor: Colors.teal.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Chips de categorías
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final isSelected = selectedCategory == categoria;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: isSelected,
                    selectedColor: Colors.teal,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = categoria;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Cuadrícula dinámica (GridView.builder)
          Expanded(
            child: recetasFiltradas.isEmpty
                ? const Center(
                    child: Text('No se encontraron recetas', style: TextStyle(color: Colors.grey)),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columnas
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75, // Proporción de las tarjetas
                    ),
                    itemCount: recetasFiltradas.length,
                    itemBuilder: (context, index) {
                      final receta = recetasFiltradas[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(receta: receta),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 3,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Imagen con Hero
                              Expanded(
                                child: Hero(
                                  tag: receta.id,
                                  child: Image.network(
                                    receta.imagenUrl,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      receta.nombre,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '⏱️ ${receta.tiempo} • 🔥 ${receta.calorias} kcal',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}