
import '../model/Article.dart';
import '../model/PaginationRespons.dart';

abstract class ArticleRepository{
  Future<PaginatedResponse<Article>> getAll(int page);
  Future<Article> getById(String id);
}