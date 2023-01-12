import 'package:flutter/cupertino.dart';

import 'ArticleTag.dart';

class ArticleTagGroup extends StatelessWidget {

  final List<String> tags;

  const ArticleTagGroup({
    super.key,
    required this.tags
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags.map((e) => ArticleTag(tag: e)).toList(),
      ),
    );
  }
}