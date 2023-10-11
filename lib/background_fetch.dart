import 'package:flutter/material.dart';
import 'package:background_fetch/background_fetch.dart';

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  // Simulate data synchronization
  print('Background Task: Data synchronization started...');

  // Perform your background task here
  // For example, you can fetch data from a server, process it, and store it locally

  // Simulate a delay to mimic a time-consuming task
  await Future.delayed(Duration(seconds: 5));

  // Finish the background task
  BackgroundFetch.finish(task.taskId);

  // Print a message to indicate the task is completed
  print('Background Task: Data synchronization completed.');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Fetch Example'),
      ),
      body: const Center(
        child: Text('Background Fetch Example'),
      ),
    );
  }
}
