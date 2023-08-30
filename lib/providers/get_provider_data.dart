import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../helper/provider.dart';
import '../helper/services.dart';
import '../model/apimodel.dart';
import '../screens/widget/api_data_screen.dart';

class GetProvider with ChangeNotifier {
  List<ChaneelModel>? _newsdata;
  List<ChaneelModel>? get news => _newsdata;
  bool isloading = false;

  void getData(String endpoint) async {
    final data = await ChannelProvider.getNews(endpoint);
    _newsdata = data;
    _newsdata != null ? isloading = true : isloading = false;
    notifyListeners();
  }

  int selectedTabIndex = 0;
  void changeTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  Widget buildSelectedWidget(int selectedTabIndex) {
    if (selectedTabIndex == 0) {
      return DataScreen(url: ChannelService.applenews);
    } else if (selectedTabIndex == 1) {
      return DataScreen(url: ChannelService.businessnews);
    } else if (selectedTabIndex == 2) {
      return DataScreen(url: ChannelService.technews);
    } else if (selectedTabIndex == 3) {
      return DataScreen(url: ChannelService.teslanews);
    } else if (selectedTabIndex == 4) {
      return DataScreen(url: ChannelService.wallsnews);
    } else {
      return const CircularProgressIndicator(
        strokeWidth: 3,
      );
    }
  }
}
