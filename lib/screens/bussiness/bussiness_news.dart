import 'package:flutter/material.dart';
import '../../helper/provider.dart';
import '../../helper/services.dart';
import '../../model/channel_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BussinessNews extends StatefulWidget {
  const BussinessNews({super.key});

  @override
  State<BussinessNews> createState() => _BussinessNewsState();
}

class _BussinessNewsState extends State<BussinessNews> {
  List<Articles>? articles;
  @override
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    final articles = await ChannelProvider.getNews(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=12ca909335de49c986576aa019fe0ebd");
    setState(() {
      this.articles = articles;
    });
  }

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
      body: articles == null
          ? const Center(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    articles!.length,
                    (index) => ListTile(
                      title: Column(
                        children: [
                          Text(
                            articles?[index].title ?? 'not available',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 500,
                            height: 200,
                            child: CachedNetworkImage(
                              imageUrl: articles?[index].urlToImage ??
                                  'not available',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),

                          // Text(articles?[index].publishedAt ?? 'not available'),
                        ],
                      ),
                      subtitle:
                          Text(articles?[index].description ?? 'not available'),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
