// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_practice_project/pages/Homepage.dart';
import 'package:todo_list_practice_project/Theme/ThemeData.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemedataApp.lightMode,
      darkTheme: ThemedataApp.darkMode,
    );
  }
}
