import 'package:flutter/material.dart';

class SchudlerPage extends StatefulWidget {
  const SchudlerPage({super.key});

  @override
  State<SchudlerPage> createState() => _SchudlerPageState();
}

class _SchudlerPageState extends State<SchudlerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schudler Page")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(child: Text("Schudle01"));
        },
      ),
    );
  }
}
