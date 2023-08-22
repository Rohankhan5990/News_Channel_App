import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';
import '../widget/custom_appbar.dart';

class TechNews extends StatefulWidget {
  const TechNews({super.key});
  @override
  State<TechNews> createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: "Tech News"),
      ),
      body: DataScreen(url: ChannelService.technews),
    );
  }
}
