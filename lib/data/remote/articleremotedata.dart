
import 'package:flutter/cupertino.dart';
import 'package:laboratorul4v3/common/apiservice.dart';

import '../model/articlemodel.dart';
import '../model/paginationresponse.dart';

class ArticleRemoteDataSource {
  final ApiService apiService;

  ArticleRemoteDataSource({required this.apiService});

  Future<PaginationResponse> getArticles(int page) async {
    final dynamic json = (await apiService.get("articles?page=$page")).body;
    return PaginationResponse.fromJson(json);
  }

  Future<ArticleModel> getArticle(String articleId) async {
    final dynamic json = (await apiService.get("articles/$articleId")).body;
    return ArticleModel.fromJson(json);
  }
}
