import 'package:flutter/material.dart';
import '../../helper/provider.dart';
import '../../helper/services.dart';
import '../../model/channel_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TeslaNews extends StatefulWidget {
  const TeslaNews({super.key});

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  List<Articles>? articles;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    final articles = await ChannelProvider.getNews(ChannelService.teslanews);
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
              "Tesla News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: articles == null
            ? const Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
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
                        ],
                      ),
                      subtitle:
                          Text(articles?[index].description ?? 'not available'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
