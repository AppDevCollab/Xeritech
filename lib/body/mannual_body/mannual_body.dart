import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:xeritech001final/body/mannual_body/schudle/schudle.dart';
import 'package:xeritech001final/body/mannual_body/schudle/schudler_page.dart';
import 'package:xeritech001final/body/mannual_body/sensors/sensors.dart';
import 'package:xeritech001final/body/mannual_body/status_bar/status_bar.dart';
import 'package:xeritech001final/body/mannual_body/system_overview/system_overview.dart';
import 'package:xeritech001final/body/mannual_body/valve_controller/valve_collections.dart';
import 'package:xeritech001final/body/mannual_body/valve_controller/valve_controller.dart';
import 'package:xeritech001final/body/mannual_body/weather/weather.dart';

class MannualBody extends StatefulWidget {
  const MannualBody({super.key});

  @override
  State<MannualBody> createState() => _MannualBodyState();
}

class _MannualBodyState extends State<MannualBody> {
  final _mybox = Hive.box('mybox');
  late String language;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    language = _mybox.get('language', defaultValue: 'English');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StatusBar(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ValveCollections()),
              );
            },
            child: ValveController(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchudlerPage()),
              );
            },
            child: Schudle(),
          ),
          Sensors(),
          Weather(),
          SystemOverview(),
        ],
      ),
    );
  }
}
