import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MotorStatus extends StatefulWidget {
  const MotorStatus({super.key});

  @override
  State<MotorStatus> createState() => _MotorStatusState();
}

class _MotorStatusState extends State<MotorStatus> {
  @override
  Widget build(BuildContext context) {
    final _mybox = Hive.box("mybox");

    Map<String, List<String>> language = {
      'English': ['Motor status'],
      'Tamil': ['மோட்டார் நிலை'],
    };
    return ValueListenableBuilder(
      valueListenable: _mybox.listenable(),
      builder: (context, Box box, _) {
        String currentLanguage = box.get('language', defaultValue: 'English');

        return Container(
          width: 194,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            color: Colors.black,
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
                language[currentLanguage]?[0] ?? "default",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text("data", style: TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
