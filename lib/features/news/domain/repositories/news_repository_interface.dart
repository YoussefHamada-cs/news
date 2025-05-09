import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/news/domain/entities/article.dart';

abstract class NewsRepositoryInterface {
  Future<Either<Failure, List<Article>>> getAllNews();
  Future<Either<Failure, List<Article>>> searchNews(String query);
  Future<Either<Failure, Article>> getArticleDetails(String articleTitle);
}
