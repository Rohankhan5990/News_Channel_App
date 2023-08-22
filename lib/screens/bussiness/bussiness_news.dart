import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';
import '../widget/custom_appbar.dart';

class BussinessNews extends StatefulWidget {
  const BussinessNews({super.key});

  @override
  State<BussinessNews> createState() => _BussinessNewsState();
}

class _BussinessNewsState extends State<BussinessNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: "Bussiness News"),
      ),
      body: DataScreen(url: ChannelService.businessnews),
    );
  }
}
