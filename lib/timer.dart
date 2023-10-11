import 'dart:async';

import 'dart:async';

void main() {
  int executionCount = 0; // Initialize a counter

  Timer timer = Timer.periodic(const Duration(seconds: 2), (timer) {
    executionCount++; // Increment the counter
    print('Task executed at ${DateTime.now()}');

    // stop the timer after a certain number of executions
    if (executionCount >= 5) {
      print('Stopping the timer after 5 executions.');
      timer.cancel(); // Cancel the timer after 5 executions
    }
  });

  print('Main program started.');

  // Allow some time for the timer to run
  Future.delayed(const Duration(seconds: 12), () {
    print('Main program completed.');
  });
}
