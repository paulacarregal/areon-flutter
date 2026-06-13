class Post {

  final String nome;
  final String info;
  final String texto;
  final int rating;
  final int likes;

  final List<String> imagens;

  Post({
    required this.nome,
    required this.info,
    required this.texto,
    required this.rating,
    required this.likes,
    required this.imagens,
  });
}