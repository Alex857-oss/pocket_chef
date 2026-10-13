class Receta {
  final String id;
  final String nombre;
  final String categoria;
  final String imagenUrl;
  final String descripcion;
  final String tiempo;
  final int calorias;

  Receta({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.imagenUrl,
    required this.descripcion,
    required this.tiempo,
    required this.calorias,
  });
}

final List<Receta> listaRecetas = [
  Receta(
    id: '1',
    nombre: 'Toast de Aguacate y Huevo',
    categoria: 'Desayunos',
    imagenUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8',
    descripcion: 'Pan artesanal tostado con aguacate fresco en rodajas, huevo pochado y semillas de ajonjolí.',
    tiempo: '10 min',
    calorias: 310,
  ),
  Receta(
    id: '2',
    nombre: 'Ensalada Bowl Verde',
    categoria: 'Saludable',
    imagenUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
    descripcion: 'Mix de lechugas, espinacas, pepino, aguacate, cubos de tofu y aderezo de limón y cilantro.',
    tiempo: '15 min',
    calorias: 250,
  ),
  Receta(
    id: '3',
    nombre: 'Salmón a las Finas Hierbas',
    categoria: 'Comidas',
    imagenUrl: 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2',
    descripcion: 'Filete de salmón fresco horneado con mantequilla, ajo, romero y espárragos al vapor.',
    tiempo: '25 min',
    calorias: 480,
  ),
  Receta(
    id: '4',
    nombre: 'Bowl de Açaí y Frutos Rojos',
    categoria: 'Postres',
    imagenUrl: 'https://images.unsplash.com/photo-1590301157890-4810ed352733',
    descripcion: 'Puré de açaí congelado con arándanos, frambuesas, coco rallado y granola crujiente.',
    tiempo: '10 min',
    calorias: 290,
  ),
];