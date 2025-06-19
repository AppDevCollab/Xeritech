import 'package:flutter/material.dart';
import 'package:xeritech001final/body/mannual_body/status_bar/motor_status.dart';
import 'package:xeritech001final/body/mannual_body/status_bar/valve_status.dart';

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Colors.black,
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ValveStatus(), MotorStatus()],
        ),
      ),
    );
  }
}
