import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';
import '../widget/custom_appbar.dart';

class StreetNews extends StatefulWidget {
  const StreetNews({super.key});
  @override
  State<StreetNews> createState() => _StreetNewsState();
}

class _StreetNewsState extends State<StreetNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: "Streets wall News"),
      ),
      body: DataScreen(url: ChannelService.wallsnews),
    );
  }
}
