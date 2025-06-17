import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Sensors extends StatefulWidget {
  const Sensors({super.key});

  @override
  State<Sensors> createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  @override
  Widget build(BuildContext context) {
    final _mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['Sensors'],
      'Tamil': ['சென்சார்கள்'],
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
                  language[currentLanguage]?[0] ?? 'default',
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
