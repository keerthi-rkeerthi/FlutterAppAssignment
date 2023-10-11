import 'package:flutter/material.dart';

import 'dart:isolate';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Isolates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolates')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Run Heavy Task'),
              onPressed: () =>
                  useIsolate(), //to overcome that we are creating isolates, inthis the main thread continues his process
              //runHeavyTaskWithOutIsolate(4000000000),
              //When user press the button the heavy task will run by the main thread, so it will not concentrate on UI, until the task completes
            ),
          ],
        ),
      ),
    );
  }
}

useIsolate() async {
  final ReceivePort receivePort = ReceivePort();
  try {
    await Isolate.spawn(
        runHeavyTaskIWithIsolate, [receivePort.sendPort, 4000000000]);
  } on Object {
    debugPrint('Isolate Failed');
    receivePort.close();
  }
  final response = await receivePort.first;

  print('Result: $response');
}

int runHeavyTaskIWithIsolate(List<dynamic> args) {
  SendPort resultPort = args[0];
  int value = 0;
  for (var i = 0; i < args[1]; i++) {
    value += i;
  }
  Isolate.exit(resultPort, value);
}

int runHeavyTaskWithOutIsolate(int count) {
  int value = 0;
  for (var i = 0; i < count; i++) {
    value += i;
  }
  print(value);
  return value;
}
