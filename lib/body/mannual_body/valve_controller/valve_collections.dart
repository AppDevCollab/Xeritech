import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hive/hive.dart';

class ValveCollections extends StatefulWidget {
  const ValveCollections({super.key});

  @override
  State<ValveCollections> createState() => _ValveCollectionsState();
}

class _ValveCollectionsState extends State<ValveCollections> {
  final ref = FirebaseDatabase.instance.ref();
  late Box timingBox;
  bool _isBoxReady = false;

  bool valve1 = false;
  bool valve2 = false;
  bool valve3 = false;
  bool valve4 = false;
  bool valve5 = false;
  bool motor = false;
  int itemCount = 5;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      timingBox = Hive.box('mybox');
      await test();
      setState(() {
        _isBoxReady = true;
      });
    });
  }

  Future<void> test() async {
    try {
      final valve1snapshot = await ref.child('valve1').get();
      final valve2snapshot = await ref.child('valve2').get();
      final valve3snapshot = await ref.child('valve3').get();
      final valve4snapshot = await ref.child('valve4').get();
      final valve5snapshot = await ref.child('valve5').get();

      setState(() {
        valve1 = valve1snapshot.value.toString() == "true";
        valve2 = valve2snapshot.value.toString() == "true";
        valve3 = valve3snapshot.value.toString() == "true";
        valve4 = valve4snapshot.value.toString() == "true";
        valve5 = valve5snapshot.value.toString() == "true";
        motor = valve1 || valve2 || valve3 || valve4 || valve5;
      });
    } catch (e) {
      print("Error reading from Firebase: $e");
    }
  }

  bool getValveState(int index) {
    switch (index) {
      case 0:
        return valve1;
      case 1:
        return valve2;
      case 2:
        return valve3;
      case 3:
        return valve4;
      case 4:
        return valve5;
      default:
        return false;
    }
  }

  void setValveState(int index, bool value) {
    switch (index) {
      case 0:
        valve1 = value;
        break;
      case 1:
        valve2 = value;
        break;
      case 2:
        valve3 = value;
        break;
      case 3:
        valve4 = value;
        break;
      case 4:
        valve5 = value;
        break;
    }
  }

  void saveStartTime(int index) {
    final now = DateTime.now();
    final key = 'valve${index + 1}_start';
    final endKey = 'valve${index + 1}_end';
    timingBox.put(key, now.toIso8601String());
    
    timingBox.delete(endKey);
  }

  void saveEndTime(int index) {
    final now = DateTime.now();
    final key = 'valve${index + 1}_end';
    timingBox.put(key, now.toIso8601String());
  }

  String? getFormattedTime(String? isoTime) {
    if (isoTime == null) return "00:00";
    final dt = DateTime.tryParse(isoTime);
    if (dt == null) return "00:00";
    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }

  String? getStartTime(int index) {
    return getFormattedTime(timingBox.get('valve${index + 1}_start'));
  }

  String? getEndTime(int index) {
    return getFormattedTime(timingBox.get('valve${index + 1}_end'));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBoxReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Valve Controller")),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          int displayIndex = index + 1;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Valve - $displayIndex",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Start Time: ${getStartTime(index)}"),
                      Text("End Time: ${getEndTime(index)}"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Switch(
                    value: getValveState(index),
                    onChanged: (val) async {
                      final valveKey = 'valve${index + 1}';
                      await ref.update({valveKey: val});

                      setState(() {
                        setValveState(index, val);
                        motor = valve1 || valve2 || valve3 || valve4 || valve5;
                        ref.update({'motor': motor});

                        if (val) {
                          saveStartTime(index);
                        } else {
                          saveEndTime(index);
                        }
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}






