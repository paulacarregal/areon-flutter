import '../models/post.dart';

List<Post> getAllPosts() {

  return [

    Post(
      nome: "Blair Willows",
      info: "12 Avaliações . 30 Fotos",
      texto:
          "Descobri um restaurante incrível hoje, perfeito para trabalhar e relaxar ☕.📍 Terraço Jardins",
      rating: 5,
      likes: 32,
    ),

    Post(
      nome: "Draculaura",
      info: "6 Avaliações . 13 Fotos",
      texto:
          "Hoje fui conhecer um dos marcos históricos de São Paulo, uma experiência cultural incrível.📍 Catedral da Sé",
      rating: 4,
      likes: 45,
    ),

    Post(
      nome: "Ken Fashionista",
      info: "8 Avaliações . 15 Fotos",
      texto:
          "Esse rooftop é simplesmente incrível, com uma vista absurda da cidade.📍 Vista Rooftop Bar",
      rating: 5,
      likes: 12,
    ),
  ];
}