import 'package:flutter/material.dart';
import '../../helper/services.dart';
import '../widget/api_data_screen.dart';

class AppleNews extends StatefulWidget {
  const AppleNews({super.key});

  @override
  State<AppleNews> createState() => _AppleNewsState();
}

class _AppleNewsState extends State<AppleNews> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Apple News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: DataScreen(url: ChannelService.applenews),
    );
  }
}
