import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String? cardDescription;
  const DescriptionWidget({super.key, this.cardDescription});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        showTrailingIcon: false,
        expandedAlignment: Alignment.topLeft,
        title: Text("data"),
        children: [
          Text(
            cardDescription ?? 'Описание товара отсутствует.',
            style: const TextStyle(fontSize: 16),
          ),
        ]);
  }
}
