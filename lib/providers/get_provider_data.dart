import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../helper/provider.dart';
import '../model/apimodel.dart';

class GetProvider with ChangeNotifier {
  List<ApiModel>? _newsdata;
  List<ApiModel>? get news => _newsdata;
  bool isloading = false;

  void getData(String endpoint) async {
    final data = await ChannelProvider.getNews(endpoint);
    _newsdata = data;
    _newsdata != null ? isloading = true : isloading = false;
    notifyListeners();
  }
}
