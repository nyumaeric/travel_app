import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  DetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.fromARGB(255, 186, 183, 180),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 64, 95, 1),
        title: Text('About Country'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Region: ${country['region']}',
                style: TextStyle(fontSize: 18)),
            Text('Population: ${country['population']}',
                style: TextStyle(fontSize: 18)),
            Text(
              'Languages: ${country['languages']?.values.join(", ")}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

extension on Color {
  fromARGB(int i, int j, int k, int l) {}
}
