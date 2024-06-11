import 'dart:convert';

import 'package:dio_http/dio_http.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:news_app/constants/constants.dart';
import '../models/articles.dart';
import '../models/sources.dart';

class HomeRepository {
  static Future<List<Source>> getNewsSources({refresh = false}) async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Constants.baseURL,
        method: 'GET',
        connectTimeout: Constants.timeOut,
        responseType: ResponseType.json);
    Dio dio = Dio(baseOptions);

    try {
      final cacheManager = DefaultCacheManager();
      const key = 'getNewsSources';
      FileInfo? cachedData = await cacheManager.getFileFromCache(key);
      if (cachedData != null && refresh == false) {
        final resultJson = await cachedData.file.readAsBytes();
        final results = List<Source>.from(
            jsonDecode(utf8.decode(resultJson))['sources']
                .map((farm) => Source.fromJson(farm)));
        // We fetch new info to refresh the cache
        getNewsSources(refresh: true);
        return results;
      }
      final response =
          await dio.request('top-headlines/sources', queryParameters: {
        'apiKey': Constants.apiKey,
      });

      List<Source> sources = [];
      for (Map source in response.data['sources']) {
        sources.add(Source.fromJson(source));
      }
      cacheManager.putFile(key, utf8.encode(jsonEncode(response.data)),
          key: key);
      return sources;
    } catch (__) {
      rethrow;
    }
  }

  static Future<List<Article>> getNews(int page, int pageSize, String source,
      {refresh = false}) async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Constants.baseURL,
        method: 'GET',
        connectTimeout: Constants.timeOut,
        responseType: ResponseType.json);
    Dio dio = Dio(baseOptions);

    try {
      final cacheManager = DefaultCacheManager();
      const key = 'getNews';
      FileInfo? cachedData = await cacheManager.getFileFromCache(key);
      if (cachedData != null && refresh == false) {
        final resultJson = await cachedData.file.readAsBytes();
        final results = List<Article>.from(
            jsonDecode(utf8.decode(resultJson))['articles']
                .map((farm) => Article.fromJson(farm)));
        // We fetch new info to refresh the cache
        getNews(page, pageSize, source, refresh: true);
        return results;
      }
      final response = await dio.request(
        'everything?apiKey=${Constants.apiKey} &pageSize=$pageSize&page=$page&sources=$source',
      );

      List<Article> articles = [];
      for (Map article in response.data['articles']) {
        articles.add(Article.fromJson(article));
      }

      cacheManager.putFile(key, utf8.encode(jsonEncode(response.data)),
          key: key);
      return articles;
    } catch (__) {
      rethrow;
    }
  }
}
