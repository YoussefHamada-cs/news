import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/core/resources/app_strings.dart';

class NewsmarkedCubit extends Cubit<List<Article>> {
  final Box<Article> _newsmarkedBox;

  NewsmarkedCubit()
      : _newsmarkedBox = Hive.box<Article>(AppStrings.newsmarkedBox),
        super([]) {
    loadNewsmarked();
    _setupListener();
  }

  void loadNewsmarked() {
    final newsmarked = _newsmarkedBox.values.toList();
    emit(newsmarked);
  }

  void _setupListener() {
    _newsmarkedBox.watch().listen((event) {
      loadNewsmarked();
    });
  }

  Future<void> addToNewsmarked(Article article) async {
    if (!isNewsmarked(article)) {
      await _newsmarkedBox.add(article);
    }
  }

  Future<void> removeFromNewsmarked(Article article) async {
    final key = _getKeyForArticle(article);
    if (key != null) {
      await _newsmarkedBox.delete(key);
    }
  }

  Future<void> clearAllNewsmarked() async {
    await _newsmarkedBox.clear();
  }

  bool isNewsmarked(Article article) {
    return state.any((a) => a.id == article.id);
  }

  int? _getKeyForArticle(Article article) {
    final articleMap = _newsmarkedBox.toMap();
    for (final entry in articleMap.entries) {
      if (entry.value.id == article.id) {
        return entry.key as int;
      }
    }
    return null;
  }
}
