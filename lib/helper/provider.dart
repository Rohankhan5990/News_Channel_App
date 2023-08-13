import 'package:dio/dio.dart';
import '../model/channel_api.dart';

class ChannelProvider {
  static final _client = Dio();
  static Future<List<Articles>> getNews(String url) async {
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final articles = response.data as Map<String, dynamic>;
        var data = ChannelApi.fromJson(articles);
        return data.articles!;
      } else {
        throw Exception('Failed to fetch articals');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
