import 'package:flutter/material.dart';
import 'package:news_channel/screens/widget/api_data_screen.dart';
import '../../helper/services.dart';

class BussinessNews extends StatefulWidget {
  const BussinessNews({super.key});

  @override
  State<BussinessNews> createState() => _BussinessNewsState();
}

class _BussinessNewsState extends State<BussinessNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bussiness News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: DataScreen(url: ChannelService.businessnews),
    );
  }
}
