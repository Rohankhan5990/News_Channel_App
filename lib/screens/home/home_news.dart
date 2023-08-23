import 'package:flutter/material.dart';
import 'package:news_channel/providers/get_provider_data.dart';
import 'package:news_channel/screens/home/widgets/get_image_url.dart';
import 'package:news_channel/screens/widget/card.dart';
import 'package:provider/provider.dart';
import '../widget/tab_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContecontext) {
    final app = Provider.of<GetProvider>(context, listen: true);
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
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...GetImageUrl.imageurl.map(
                        (e) => TabTile(
                          title: e,
                          isSelected: GetImageUrl.imageurl.indexOf(e) ==
                              app.selectedTabIndex,
                          index: GetImageUrl.imageurl.indexOf(e),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            const Text(
              "Latest News",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const CardDisplay(),
          ],
        ),
      ),
    );
  }
}
