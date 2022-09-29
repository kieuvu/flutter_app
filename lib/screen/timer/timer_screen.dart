import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    super.key,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  bool isCounter = true;
  late Timer _timer;

  void updateCounterState(bool state) {
    setState(() {
      isCounter = state;
    });
  }

  void updateTimerValue() {
    setState(() {
      second++;
      if (second == 60) {
        minute++;
        second = 0;
        if (minute == 60) {
          hour++;
        }
      }
    });
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        updateCounterState(true);
        updateTimerValue();
      },
    );
  }

  void stopTimer() {
    updateCounterState(false);
    _timer.cancel();
  }

  String showTime() {
    String s = (second < 10) ? "0$second" : "$second";
    String m = (minute < 10) ? "0$minute" : "$minute";
    String h = (hour < 10) ? "0$hour" : "$hour";
    return "$h:$m:$s";
  }

  @override
  initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showTime(),
                style: Theme.of(context).textTheme.headline2,
              ),
              ElevatedButton(
                child: Text((!isCounter) ? 'Start timer' : "Pause Timer"),
                onPressed: () {
                  (!isCounter) ? startTimer() : stopTimer();
                },
              ),
            ],
          ),
        ));
  }
}
