import '../../domain/model/Article.dart';
import '../../domain/model/PaginationRespons.dart';
import '../../domain/repository/ArticleRepository.dart';
import '../model/articlemodel.dart';
import '../model/paginationresponse.dart';
import '../remote/articleremotedata.dart';

class ArticleRepositoryImpl extends ArticleRepository {

  final ArticleRemoteDataSource articleRemoteDataSource;

  ArticleRepositoryImpl({
    required this.articleRemoteDataSource
  });

  @override
  Future<PaginatedResponse<Article>> getAll(int page) async {
    final PaginationResponse response = await articleRemoteDataSource.getArticles(page);

    return PaginatedResponse(
        totalPages: response.total_pages,
        items: ArticleModel.fromJsonList(response.results).map((e) => e.toDomain()).toList()
    );
  }

  @override
  Future<Article> getById(String id) async {
    return (await articleRemoteDataSource.getArticle(id)).toDomain();
  }
}