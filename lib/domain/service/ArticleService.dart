
import '../model/Article.dart';
import '../model/PaginationRespons.dart';
import '../repository/ArticleRepository.dart';

class ArticlesService {

  final ArticleRepository articleRepository;

  ArticlesService({
    required this.articleRepository
  });

  Future<PaginatedResponse<Article>> getArticles(int page) async {
    return await articleRepository.getAll(page);
  }

  Future<Article> getArticle(String id) async {
    return await articleRepository.getById(id);
  }
}