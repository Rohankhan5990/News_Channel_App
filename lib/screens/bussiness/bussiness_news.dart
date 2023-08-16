import 'package:flutter/material.dart';
import '../../helper/provider.dart';
import '../../helper/services.dart';
import '../../model/apimodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BussinessNews extends StatefulWidget {
  const BussinessNews({super.key});

  @override
  State<BussinessNews> createState() => _BussinessNewsState();
}

class _BussinessNewsState extends State<BussinessNews> {
  List<ApiModel>? newsdata;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final data = await ChannelProvider.getNews(ChannelService.businessnews);
    setState(
      () {
        newsdata = data;
      },
    );
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
      body: newsdata == null
          ? const Center(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Column(
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
                  )
                ],
              ),
            ),
    );
  }
}
