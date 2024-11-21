import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Globe App',
      home: GlobeImageScreen(),
    );
  }
}

class GlobeImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Globe Image'),
      ),
      body: Center(
        child: Image.asset(
          'assets/world_3d.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
