import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/get_provider_data.dart';

class DataScreen extends StatefulWidget {
  final String url;
  const DataScreen({super.key, required this.url});
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
    super.initState();
    final getter = Provider.of<GetProvider>(context, listen: false);
    getter.getData(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    final getter = Provider.of<GetProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          if (getter.isloading == false)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (getter.news != null)
            SingleChildScrollView(
              child: Column(
                children: getter.news!
                    .map((newsItem) => ListTile(
                          title: Column(
                            children: [
                              Text(
                                newsItem.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 500,
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      newsItem.urlToImage ?? 'not available',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                          strokeWidth: 2),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                          subtitle:
                              Text(newsItem.description ?? 'not available'),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
