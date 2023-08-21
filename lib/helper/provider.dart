import 'package:dio/dio.dart';
import '../model/apimodel.dart';
import '../model/channel_api.dart';

class ChannelProvider {
  static final _dio = Dio();
  static Future<List<ChaneelModel>> getNews(String url) async {
    try {
      final response = await _dio.get(url);
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
