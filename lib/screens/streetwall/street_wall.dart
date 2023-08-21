import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';

class StreetNews extends StatefulWidget {
  const StreetNews({super.key});
  @override
  State<StreetNews> createState() => _StreetNewsState();
}

class _StreetNewsState extends State<StreetNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Street Wall News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: DataScreen(url: ChannelService.wallsnews),
    );
  }
}
