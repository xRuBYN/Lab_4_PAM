
import 'dart:math';

import 'ArticleAuthor.dart';

class Article {
  final int id;
  final String title;
  final String description;
  final String content;
  final String image;
  final String category;
  final int viewsCount;
  final ArticleAuthor author;
  final List<String> tags;
  final bool isFeatured;
  int likes = Random().nextInt(100);
  int comments = Random().nextInt(100);

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.category,
    required this.viewsCount,
    required this.author,
    required this.tags,
    required this.isFeatured
  });
}