import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StockFacile",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
      
    );
  }
}
class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StockFacile'),
        backgroundColor: Colors.redAccent[150],
      ),
    );
  }
}