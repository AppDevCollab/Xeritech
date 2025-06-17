import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MannualMode extends StatelessWidget {
  const MannualMode({super.key});

  @override
  Widget build(BuildContext context) {
    final _mybox = Hive.box("mybox");

    Map<String, List<String>> Languages = {
      "English": ["Mannual"],
      "Tamil": ["கையேடு"], // Tamil translation
    };

    return ValueListenableBuilder(
      valueListenable: _mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('language', defaultValue: 'English');

        return Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 17, 0),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Text(
              Languages[currentLanguage]?[0] ?? "Default",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
