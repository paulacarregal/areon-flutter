import 'package:flutter/material.dart';

import '../models/post.dart';

class PostCard extends StatelessWidget {

  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // topo
          Row(
            children: [

              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 22,
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    post.nome,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    post.info,

                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              const Icon(Icons.more_horiz),
            ],
          ),

          const SizedBox(height: 12),

          // estrelas
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,

                color: index < post.rating
                    ? Colors.amber
                    : Colors.grey,

                size: 18,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // texto
          Text(post.texto),

          const SizedBox(height: 12),

          // imagem fake
          Container(
            width: double.infinity,
            height: 180,

            decoration: BoxDecoration(
              color: Colors.grey.shade300,

              borderRadius:
                  BorderRadius.circular(16),
            ),

            child: const Center(
              child: Icon(
                Icons.image,
                size: 60,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // curtidas
          Row(
            children: [

              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),

              const SizedBox(width: 4),

              Text("${post.likes} curtidas"),
            ],
          ),
        ],
      ),
    );
  }
}