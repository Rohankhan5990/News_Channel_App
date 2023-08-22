import 'package:flutter/material.dart';
import '../../helper/services.dart';
import '../widget/api_data_screen.dart';
import '../widget/custom_appbar.dart';

class AppleNews extends StatefulWidget {
  const AppleNews({super.key});

  @override
  State<AppleNews> createState() => _AppleNewsState();
}

class _AppleNewsState extends State<AppleNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: "Apple News"),
      ),
      body: DataScreen(url: ChannelService.applenews),
    );
  }
}
