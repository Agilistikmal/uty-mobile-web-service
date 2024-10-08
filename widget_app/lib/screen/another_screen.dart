import 'package:flutter/material.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Screen"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Menentukan maksimal 1 garis horizontal ada berapa item
          crossAxisCount: 3,
        ),
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              "Child 1",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text(
              "Child 2",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              "Child 3",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "Child 4",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
