import 'package:flutter/material.dart';

class FileDateScreen extends StatefulWidget {
  const FileDateScreen({Key? key}) : super(key: key);

  @override
  State<FileDateScreen> createState() => _FileDateScreenState();
}

class _FileDateScreenState extends State<FileDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
    );
  }
}