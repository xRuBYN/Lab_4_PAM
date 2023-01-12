import 'package:flutter/material.dart';
import 'package:laboratorul4v3/presentation/App.dart';
import 'init/DIInitializer.dart';



Future<void> main() async {
  await DIInitializer.init();
  runApp(App());
}