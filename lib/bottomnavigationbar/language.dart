import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final Box _mybox = Hive.box("mybox");

  final Map<String, String> languages = {
    "English": "Current : English ",
    "Tamil": "தற்போதையது : தமிழ்",
  };

  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = _mybox.get('language', defaultValue: 'English');
  }

  void _saveLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
      _mybox.put('language', language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Choose Language"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" ${languages[_selectedLanguage]}"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {_saveLanguage('English'), Navigator.pop(context)},
            child: Text("English"),
          ),
          ElevatedButton(
            onPressed: () => {_saveLanguage('Tamil'), Navigator.pop(context)},
            child: Text("தமிழ்"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
