import 'package:flutter/material.dart';
import 'package:xeritech001final/bottomnavigationbar/language.dart';

class BottomNavigation_Bar extends StatefulWidget {
  const BottomNavigation_Bar({super.key});

  @override
  State<BottomNavigation_Bar> createState() => _BottomNavigation_BarState();
}

class _BottomNavigation_BarState extends State<BottomNavigation_Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(4, 4),
          ),
        ],
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => Language()
              );
            },
            icon: Icon(Icons.language_sharp, color: Colors.black, size: 50),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.security_rounded, color: Colors.black, size: 50),
          ),
        ],
      ),
    );
  }
}
