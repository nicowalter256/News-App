import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/sources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../repositories/home_repository.dart';

class HomeController extends ChangeNotifier {
  bool loading = true;
  List<Source> sources = [];
  List<Article> articles = [];
  dynamic exception;
  int pageSize = 10;
  int page = 1;
  RefreshController? refreshController;

  void fetchMore({source = "bbc-news"}) async {
    try {
      page = page + 1;

      List<Article> results =
          await HomeRepository.getNews(page, pageSize, source);

      articles.addAll(results);
    } catch (_) {
      page = page - 1;
      refreshController?.loadFailed();
    }

    notifyListeners();
  }

  Future fetchNewsSources({bool refresh = false}) async {
    if (!loading) {
      loading = true;
      exception = null;
      notifyListeners();
    }
    try {
      List<Source> results =
          await HomeRepository.getNewsSources(refresh: refresh);
      sources = [];
      sources.addAll(results);
    } catch (e) {
      rethrow;
    }
    loading = false;
    notifyListeners();
  }

  Future fetchNews({bool refresh = false, source = "bbc-news"}) async {
    if (!loading) {
      loading = true;
      exception = null;
      notifyListeners();
    }
    try {
      List<Article> results = await HomeRepository.getNews(
          page, pageSize, source,
          refresh: refresh);
      if (results.length < pageSize) {
        refreshController?.loadNoData();
      }
      articles = [];
      articles.addAll(results);
    } catch (e) {
      rethrow;
    }
    loading = false;
    notifyListeners();
  }

  // void init() async {
  //   if (!loading) {
  //     loading = true;
  //     exception = null;
  //     notifyListeners();
  //   }
  //   try {
  //     await Future.wait([
  //       fetchNewsSources(),
  //       fetchNews(),
  //     ], eagerError: true);

  //     exception = null;
  //   } catch (e) {
  //     exception = e;
  //   }
  //   loading = false;
  //   notifyListeners();
  // }
}
