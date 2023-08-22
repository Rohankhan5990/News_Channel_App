import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';
import '../widget/custom_appbar.dart';

class TeslaNews extends StatefulWidget {
  const TeslaNews({super.key});

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: "Tesla News"),
      ),
      body: DataScreen(url: ChannelService.teslanews),
    );
  }
}
