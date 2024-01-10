import 'package:dio_http/dio_http.dart';
import 'package:news_app/constants/constants.dart';
import '../models/articles.dart';
import '../models/sources.dart';

class HomeRepository {
  static Future<List<Source>> getNewsSources() async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Constants.baseURL,
        method: 'GET',
        connectTimeout: Constants.timeOut,
        responseType: ResponseType.json);
    Dio dio = Dio(baseOptions);

    try {
      final response =
          await dio.request('top-headlines/sources', queryParameters: {
        'apiKey': Constants.apiKey,
      });

      List<Source> sources = [];
      for (Map source in response.data['sources']) {
        sources.add(Source.fromJson(source));
      }
      return sources;
    } catch (__) {
      rethrow;
    }
  }

  static Future<List<Article>> getNews(
      int page, int pageSize, String source) async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Constants.baseURL,
        method: 'GET',
        connectTimeout: Constants.timeOut,
        responseType: ResponseType.json);
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio.request(
        'everything?apiKey=${Constants.apiKey} &pageSize=$pageSize&page=$page&sources=$source',
      );

      List<Article> articles = [];
      for (Map article in response.data['articles']) {
        articles.add(Article.fromJson(article));
      }
      return articles;
    } catch (__) {
      rethrow;
    }
  }
}
