import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AutoMode extends StatelessWidget {
  const AutoMode({super.key, });

  @override
  Widget build(BuildContext context) {
    final _mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['Auto'],
      'Tamil': ['தானியங்கி'],
    };

    return ValueListenableBuilder(
      valueListenable: _mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('language', defaultValue: 'English');

        return Container(
          width: 100,
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Text(
              language[currentLanguage]?[0] ?? "default",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
