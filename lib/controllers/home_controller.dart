import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/sources.dart';

import '../repositories/home_repository.dart';

class HomeController extends ChangeNotifier {
  bool loading = true;
  List<Source> sources = [];
  List<Article> articles = [];
  dynamic exception;
  int pageSize = 10;
  int page = 1;
  String source = "al-jazeera-english";

  Future fetchNewsSources() async {
    try {
      sources = [];
      List<Source> results = await HomeRepository.getNewsSources();
      sources.addAll(results);
    } catch (e) {
      rethrow;
    }
  }

  Future fetchNews() async {
    try {
      articles = [];
      List<Article> results =
          await HomeRepository.getNews(page, pageSize, source);
      articles.addAll(results);
    } catch (e) {
      rethrow;
    }
  }

  void init() async {
    if (!loading) {
      loading = true;
      exception = null;
      notifyListeners();
    }
    try {
      await Future.wait([
        fetchNewsSources(),
        fetchNews(),
      ], eagerError: true);

      exception = null;
    } catch (e) {
      exception = e;
    }
    loading = false;
    notifyListeners();
  }
}
