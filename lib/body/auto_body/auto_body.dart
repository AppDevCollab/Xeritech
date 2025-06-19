import 'package:flutter/material.dart';

class AutoBody extends StatefulWidget {
  const AutoBody({super.key});

  @override
  State<AutoBody> createState() => _AutoBodyState();
}

class _AutoBodyState extends State<AutoBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text("Auto Pilot mote was Activated")]),
    );
  }
}
