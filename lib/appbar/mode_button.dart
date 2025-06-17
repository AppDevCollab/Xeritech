
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xeritech001final/appbar/auto_mode.dart';
import 'package:xeritech001final/appbar/mannual_mode.dart';

class ModeButton extends StatefulWidget {
  const ModeButton({super.key});

  @override
  State<ModeButton> createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  final Box _mybox = Hive.box("mybox");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void mode(String mode) {
    setState(() {
      _mybox.put('mode', mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(onTap: ()=>{mode('Mannual')}, child: MannualMode()),
            GestureDetector(onTap: () => {mode('Auto')}, child: AutoMode()),
          ],
        ),
      ),
    );
  }
}
