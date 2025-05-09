import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/core/api/dio_client.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/news/data/models/article_model.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/domain/repositories/news_repository_interface.dart';

class NewsRepository implements NewsRepositoryInterface {
  final DioClient _dioClient;

  NewsRepository(this._dioClient);

  @override
  Future<Either<Failure, List<Article>>> getAllNews() async {
    try {
      final response = await _dioClient.get(
        '/everything',
        queryParameters: {
          'q': 'technology',
          'language': 'en',
          'pageSize': 30,
          'sortBy': 'publishedAt',
        },
      );

      log('News Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final articles = response.data['articles'] as List;
        final articlesList =
            articles.map((article) => ArticleModel.fromJson(article)).toList();
        return Right(articlesList);
      } else {
        return Left(
            ServerFailure('Failed to load news: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      log('DioError in getAllNews: $e');
      return Left(ServerFailure(e.message ?? 'Failed to connect to server'));
    } catch (e) {
      log('Error in getAllNews: $e');
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> searchNews(String query) async {
    try {
      final response = await _dioClient.get(
        '/everything',
        queryParameters: {
          'q': query,
          'language': 'en',
          'pageSize': 20,
          'sortBy': 'relevancy',
        },
      );

      log('Search Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final articles = response.data['articles'] as List;
        final articlesList =
            articles.map((article) => ArticleModel.fromJson(article)).toList();
        return Right(articlesList);
      } else {
        return Left(
            ServerFailure('Failed to search news: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      log('DioError in searchNews: $e');
      return Left(ServerFailure(e.message ?? 'Failed to connect to server'));
    } catch (e) {
      log('Error in searchNews: $e');
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Article>> getArticleDetails(
      String articleTitle) async {
    try {
      final response = await _dioClient.get(
        '/everything',
        queryParameters: {
          'q': articleTitle,
          'language': 'en',
          'pageSize': 1,
          'sortBy': 'relevancy',
        },
      );

      log('Article Details Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final articles = response.data['articles'] as List;
        if (articles.isNotEmpty) {
          final article = ArticleModel.fromJson(articles.first);
          return Right(article);
        }
        return Left(ServerFailure('Article not found'));
      } else {
        return Left(ServerFailure(
            'Failed to load article details: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      log('DioError in getArticleDetails: $e');
      return Left(ServerFailure(e.message ?? 'Failed to connect to server'));
    } catch (e) {
      log('Error in getArticleDetails: $e');
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }
}
