import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ValveStatus extends StatefulWidget {
  const ValveStatus({super.key});

  @override
  State<ValveStatus> createState() => _ValveStatusState();
}

class _ValveStatusState extends State<ValveStatus> {
  @override
  Widget build(BuildContext context) {
    final mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['Valve status', 'Data'],
      'Tamil': ['வால்வு நிலை', 'தரவு'],
    };
    return ValueListenableBuilder(
      valueListenable: mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('language', defaultValue: 'English');

        return Container(
          width: 194,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.white,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                language[currentLanguage]?[0] ?? 'default',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(language[currentLanguage]?[1] ?? 'default'),
            ],
          ),
        );
      },
    );
  }
}
