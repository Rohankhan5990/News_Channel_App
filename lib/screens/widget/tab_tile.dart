import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/get_provider_data.dart';

class TabTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int index;
  const TabTile(
      {required this.index,
      required this.title,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<GetProvider>(context, listen: true);

    return GestureDetector(
      onTap: () {
        app.changeTab(index);
      },
      child: ClipRRect(
        child: Container(
          height: isSelected ? 120 : 80,
          width: isSelected ? 140 : 100,
          decoration: isSelected
              ? BoxDecoration(
                  border:
                      Border.all(color: Colors.cyan.withOpacity(0.9), width: 6),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          child: Image.asset(
            title,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
