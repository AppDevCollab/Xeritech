import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SystemOverview extends StatefulWidget {
  const SystemOverview({super.key});

  @override
  State<SystemOverview> createState() => _SystemOverviewState();
}

class _SystemOverviewState extends State<SystemOverview> {
  @override
  Widget build(BuildContext context) {
    final mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['System Overview'],
      'Tamil': ['கணினி கண்ணோட்டம்'],
    };
    return ValueListenableBuilder(
      valueListenable: mybox.listenable(),
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
                  language[currentLanguage]?[0]??'default',
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
