import 'package:dio_http/dio_http.dart';
import 'package:news_app/constants/constants.dart';
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
}
