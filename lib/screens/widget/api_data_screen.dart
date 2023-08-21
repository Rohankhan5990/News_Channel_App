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

  Widget build(BuildContext context) {
    final getter = Provider.of<GetProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          getter.isloading == false
              ? const Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        getter.news!.length,
                        (index) => ListTile(
                          title: Column(
                            children: [
                              Text(
                                getter.news?[index].title ?? 'not available',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 500,
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl: getter.news?[index].urlToImage ??
                                      'not available',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                          strokeWidth: 2),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(getter.news?[index].description ??
                              'not available'),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
