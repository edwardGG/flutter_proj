import 'package:flutter/material.dart';

class DiscoverChildPage extends StatefulWidget {
  final String title;

  const DiscoverChildPage({super.key,
   required this.title});

  @override
  State<DiscoverChildPage> createState() => _DiscoverChildPageState();
}

class _DiscoverChildPageState extends State<DiscoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
