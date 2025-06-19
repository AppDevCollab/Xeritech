import 'package:flutter/material.dart';
import 'package:xeritech001final/appbar/appbar.dart';
import 'package:xeritech001final/body/auto_body/auto_body.dart';
import 'package:xeritech001final/bottomnavigationbar/bottom_navigation_bar.dart';

class Auto extends StatefulWidget {
  const Auto({super.key});

  @override
  State<Auto> createState() => _AutoState();
}

class _AutoState extends State<Auto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Appbar(),
      ),
      body: ListView(children: [AutoBody()],),
      bottomNavigationBar: BottomNavigation_Bar(),
    );
  }
}
