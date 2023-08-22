import 'dart:convert';
import 'package:collection/collection.dart';
import 'apimodel.dart';

class ChannelApi {
  final String status;
  final int totalResults;
  List<ChaneelModel> newsdata;
  ChannelApi({
    required this.status,
    required this.totalResults,
    required this.newsdata,
  });

  ChannelApi copyWith({
    String? status,
    int? totalResults,
    List<ChaneelModel>? newsdata,
  }) {
    return ChannelApi(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      newsdata: newsdata ?? this.newsdata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'newsdata': newsdata.map((x) => x.toMap()).toList(),
    };
  }

  factory ChannelApi.fromMap(Map<String, dynamic> map) {
    final data = map["articles"] as List<dynamic>;
    return ChannelApi(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      newsdata: data
          .map((e) => ChaneelModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelApi.fromJson(String source) =>
      ChannelApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChannelApi(status: $status, totalResults: $totalResults, newsdata: $newsdata)';

  @override
  bool operator ==(covariant ChannelApi other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.status == status &&
        other.totalResults == totalResults &&
        listEquals(other.newsdata, newsdata);
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ newsdata.hashCode;
}
