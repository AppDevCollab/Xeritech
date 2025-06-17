import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ValveController extends StatefulWidget {
  const ValveController({super.key});

  @override
  State<ValveController> createState() => _ValveControllerState();
}

class _ValveControllerState extends State<ValveController> {
  final ref = FirebaseDatabase.instance.ref();
  String soil_moisture = "Loading";
  String water_level = 'Loading';
  Map<String, List<String>> Languages = {
    "English": ["Valve Controller"],
    "Tamil": ["வால்வ் கட்டுப்பாடு"], // Tamil translation
  };
  // ignore: unused_field
  final _mybox = Hive.box("mybox");
  @override
  void initState() {
    super.initState();
    _fetchSoilMoisture();
    _waterlevel();
  }

  void _fetchSoilMoisture() {
    ref.child('soil_moisture').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          soil_moisture = data.toString(); 
        });
      }
    });
  }

  void _waterlevel() {
    ref.child('water_level').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          water_level = data.toString();
        });
      }
    });
  }

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
                Text(soil_moisture),
                Text(water_level),
              ],
            ),
          ),
        );
      },
    );
  }
}
