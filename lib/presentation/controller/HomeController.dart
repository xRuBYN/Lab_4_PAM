import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:laboratorul4v3/domain/service/ArticleService.dart';

import '../../domain/model/Article.dart';
import '../../domain/model/PaginationRespons.dart';
import '../modules/featured.dart';

class HomeController extends GetxController {
  final ArticlesService articlesUseCase;

  RxList<Featured> featured = RxList();
  RxList<Article> articles = RxList();
  ScrollController articlesScrollController = ScrollController();
  int _totalArticlesPages = 1;
  int _currentArticlesPage = 0;

  HomeController({
    required this.articlesUseCase
  });

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    articlesScrollController.dispose();
  }

  void loadData() async {
    if (_totalArticlesPages == _currentArticlesPage) {
      return;
    } else {
      _currentArticlesPage += 1;
    }

    await readJsonFile();

    try {
      PaginatedResponse<Article> response = await articlesUseCase.getArticles(_currentArticlesPage);
      articles.addAll(response.items);
      _totalArticlesPages = response.totalPages;
    } catch (e) {
      log("Failed fetch to articles: $e");
    }
  }

  Future<void> readJsonFile() async {
    final String jsonString = await rootBundle.loadString('assets/news.json');
    final data = await json.decode(jsonString);

    featured.value = (data ['featured'] as List).map((value) => Featured.fromJson(value)).toList();
  }
}