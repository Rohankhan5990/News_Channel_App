import 'package:flutter/material.dart';
import 'package:news_channel/constants/sizedbox.dart';
import 'package:news_channel/screens/apple/apple_news.dart';
import '../../constants/assets.dart';
import '../bussiness/bussiness_news.dart';
import '../streetwall/street_wall.dart';
import '../tech/tech_news.dart';
import '../tesla/tesla_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContecontext) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Channel",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppleNews(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(ConstantImage.apple),
                ),
              ),
              SpaceBox.height10,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BussinessNews(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(ConstantImage.bussiness),
                ),
              ),
              SpaceBox.height10,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeslaNews(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(ConstantImage.tesla),
                ),
              ),
              SpaceBox.height10,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TechNews(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(ConstantImage.tech),
                ),
              ),
              SpaceBox.height10,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreetNews(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(ConstantImage.wall),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
