import 'package:flutter/material.dart';
import '../../helper/provider.dart';
import '../../helper/services.dart';
import '../../model/apimodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TeslaNews extends StatefulWidget {
  const TeslaNews({super.key});

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  List<ApiModel>? newsdata;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final articles = await ChannelProvider.getNews(ChannelService.teslanews);
    setState(() {
      newsdata = articles;
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
        child: newsdata == null
            ? const Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  ...List.generate(
                    newsdata!.length,
                    (index) => ListTile(
                      title: Column(
                        children: [
                          Text(
                            newsdata?[index].title ?? 'not available',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 500,
                            height: 200,
                            child: CachedNetworkImage(
                              imageUrl: newsdata?[index].urlToImage ??
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
                          Text(newsdata?[index].description ?? 'not available'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
