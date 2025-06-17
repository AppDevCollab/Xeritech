import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xeritech001final/auto_mode/auto.dart';
import 'package:xeritech001final/mannual_mode/mannual.dart';

class Main01 extends StatefulWidget {
  const Main01({super.key});

  @override
  State<Main01> createState() => _Main01State();
}

class _Main01State extends State<Main01> {
  final _mybox = Hive.box("mybox");
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('mode', defaultValue: 'Mannual');

        return currentLanguage == 'Mannual' ? Mannual() : Auto();
      },
    );
  }
}
