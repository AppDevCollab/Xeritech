import 'package:flutter/material.dart';
import 'package:xeritech001final/appbar/appbar.dart';
import 'package:xeritech001final/body/mannual_body/mannual_body.dart';
import 'package:xeritech001final/bottomnavigationbar/bottom_navigation_bar.dart';

class Mannual extends StatefulWidget {
  const Mannual({super.key});

  @override
  State<Mannual> createState() => _MannualState();
}

class _MannualState extends State<Mannual> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(),
      ),
      body: ListView(children: [MannualBody()]),
      bottomNavigationBar: BottomNavigation_Bar(),
    );
  }
}
