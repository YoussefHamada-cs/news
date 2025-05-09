import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/domain/repositories/news_repository_interface.dart';

// States
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> featuredNews;
  final List<Article> latestNews;

  NewsLoaded({
    required this.featuredNews,
    required this.latestNews,
  });

  @override
  List<Object?> get props => [featuredNews, latestNews];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchLoading extends NewsState {}

class SearchLoaded extends NewsState {
  final List<Article> searchResults;
  final String searchQuery;

  SearchLoaded({
    required this.searchResults,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [searchResults, searchQuery];
}

class SearchError extends NewsState {
  final String message;

  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class ArticleDetailsLoading extends NewsState {}

class ArticleDetailsLoaded extends NewsState {
  final Article article;

  ArticleDetailsLoaded({required this.article});

  @override
  List<Object?> get props => [article];
}

class ArticleDetailsError extends NewsState {
  final String message;

  ArticleDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class NewsCubit extends Cubit<NewsState> {
  final NewsRepositoryInterface _repository;

  NewsCubit(this._repository) : super(NewsInitial());

  Future<void> loadNews() async {
    try {
      emit(NewsLoading());
      log('Loading news...');

      final result = await _repository.getAllNews();

      result.fold(
        (failure) {
          log('Error loading news: ${failure.message}');
          emit(NewsError(failure.message));
        },
        (articles) {
          log('News loaded: ${articles.length} articles');

          if (articles.isEmpty) {
            emit(NewsError('No news articles available'));
            return;
          }

          // First 4 articles will be featured news
          final featuredNews = articles.take(4).toList();
          // Rest of the articles will be latest news
          final latestNews = articles.skip(4).toList();

          emit(NewsLoaded(
            featuredNews: featuredNews,
            latestNews: latestNews,
          ));
          log('News split successfully: ${featuredNews.length} featured, ${latestNews.length} latest');
        },
      );
    } catch (e) {
      log('Unexpected error loading news: $e');
      emit(NewsError(e.toString()));
    }
  }

  Future<void> searchNews(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchError('Please enter a search term'));
      return;
    }

    try {
      emit(SearchLoading());
      log('Searching news for: $query');

      final result = await _repository.searchNews(query);

      result.fold(
        (failure) {
          log('Error searching news: ${failure.message}');
          emit(SearchError(failure.message));
        },
        (articles) {
          log('Search results: ${articles.length} articles found for "$query"');
          emit(SearchLoaded(
            searchResults: articles,
            searchQuery: query,
          ));
        },
      );
    } catch (e) {
      log('Unexpected error searching news: $e');
      emit(SearchError(e.toString()));
    }
  }

  Future<void> getArticleDetails(String title) async {
    if (title.trim().isEmpty) {
      emit(ArticleDetailsError('Invalid article title'));
      return;
    }

    try {
      emit(ArticleDetailsLoading());
      log('Loading article details for: $title');

      final result = await _repository.getArticleDetails(title);

      result.fold(
        (failure) {
          log('Error loading article details: ${failure.message}');
          emit(ArticleDetailsError(failure.message));
        },
        (article) {
          log('Article details loaded successfully');
          emit(ArticleDetailsLoaded(article: article));
        },
      );
    } catch (e) {
      log('Unexpected error loading article details: $e');
      emit(ArticleDetailsError(e.toString()));
    }
  }
}
