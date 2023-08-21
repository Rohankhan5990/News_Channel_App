import 'apimodel.dart';

class ChannelApi {
  String? status;
  int? totalResults;
  List<ChaneelModel>? newsdata;

  ChannelApi({this.status, this.totalResults, this.newsdata});

  ChannelApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      newsdata = <ChaneelModel>[];
      json['articles'].forEach((v) {
        newsdata!.add(ChaneelModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (newsdata != null) {
      data['newsdata'] = newsdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
