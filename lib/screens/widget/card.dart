import 'package:flutter/material.dart';
import 'package:news_channel/providers/get_provider_data.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatefulWidget {
  const CardDisplay({super.key});

  @override
  State<CardDisplay> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<GetProvider>(context, listen: true);

    return Expanded(
      child: Card(
        color: Colors.grey.shade100,
        child: app.buildSelectedWidget(app.selectedTabIndex),
      ),
    );
  }
}
