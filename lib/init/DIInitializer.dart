import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/apiservice.dart';
import '../data/remote/articleremotedata.dart';
import '../data/repository-impl/ArticleRepositoryImpl.dart';
import '../domain/repository/ArticleRepository.dart';
import '../domain/service/ArticleService.dart';

class DIInitializer {

  static Future init() async {
    Get.put(ApiService());
    Get.put(ArticleRemoteDataSource(apiService: Get.find<ApiService>()));
    Get.put<ArticleRepository>(ArticleRepositoryImpl(articleRemoteDataSource: Get.find<ArticleRemoteDataSource>()));
    Get.put(ArticlesService(articleRepository: Get.find<ArticleRepository>()));
  }

}