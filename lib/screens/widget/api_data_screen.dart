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
  Widget build(BuildContext context) {
    final getter = Provider.of<GetProvider>(context, listen: true);
    getter.getData(widget.url);
    return SingleChildScrollView(
      child: Column(
        children: [
          if (getter.isloading == false)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 300),
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              ),
            )
          else if (getter.news != null)
            SingleChildScrollView(
              child: Column(
                children: getter.news!
                    .map(
                      (newsItem) => ListTile(
                        title: Column(
                          children: [
                            Text(
                              newsItem.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 500,
                              height: 200,
                              child: CachedNetworkImage(
                                imageUrl: newsItem.urlToImage ?? "",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(
                                    Icons.error_rounded,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(newsItem.description ?? 'not available'),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
