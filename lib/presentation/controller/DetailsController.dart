import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:laboratorul4v3/domain/service/ArticleService.dart';

import '../../domain/model/Article.dart';

class DetailsController extends GetxController {

  final String? articleId;
  final ArticlesService articlesUseCase;

  final article = Rx<Article?>(null);

  DetailsController({
    required this.articleId,
    required this.articlesUseCase
  });

  @override
  void onInit() {
    super.onInit();
    _fetchDetails();
  }

  void _fetchDetails() async {
    try {
      if (articleId != null) {
        article.value = await articlesUseCase.getArticle(articleId ?? "");
      }
    } catch (e) {
      log("Failed fo fetch article details: $e");
    }
  }
}