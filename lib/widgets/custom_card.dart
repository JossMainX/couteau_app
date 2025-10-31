import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String route;

  const CustomCard({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
