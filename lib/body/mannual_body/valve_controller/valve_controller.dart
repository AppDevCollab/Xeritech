import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ValveController extends StatefulWidget {
  const ValveController({super.key});

  @override
  State<ValveController> createState() => _ValveControllerState();
}

class _ValveControllerState extends State<ValveController> {
  Map<String, List<String>> Languages = {
    "English": ["Valve Controller"],
    "Tamil": ["வால்வ் கட்டுப்பாடு"], // Tamil translation
  };
  // ignore: unused_field
  final _mybox = Hive.box("mybox");
  @override
  Widget build(BuildContext context) {
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
                  Languages[currentLanguage]?[0] ?? 'default',
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
