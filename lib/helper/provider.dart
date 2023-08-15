import 'package:dio/dio.dart';
import '../model/channel_api.dart';

class ChannelProvider {
  static final dio = Dio();
  static Future<List<ApiModel>> getNews(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responsedata = response.data as Map<String, dynamic>;
        var data = ChannelApi.fromJson(responsedata);
        return data.newsdata!;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
