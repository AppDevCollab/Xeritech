import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Schudle extends StatefulWidget {
  const Schudle({super.key});

  @override
  State<Schudle> createState() => _SchudleState();
}

class _SchudleState extends State<Schudle> {
  @override
  Widget build(BuildContext context) {
    final _mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['Schudle'],
      'Tamil': ['அட்டவணை'],
    };
    return ValueListenableBuilder(
      valueListenable: _mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('language', defaultValue: 'English');

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  language[currentLanguage]?[0] ?? 'dfault',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
