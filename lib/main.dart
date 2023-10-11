import 'package:flutter/material.dart';
import 'package:background/background_fetch.dart';
import 'package:background_fetch/background_fetch.dart';

void main() {
  runApp(MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
