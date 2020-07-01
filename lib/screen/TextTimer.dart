import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widget/TimerText.dart';

class TextTimer extends StatefulWidget {
  @override
  _TextTimerState createState() => _TextTimerState();
}

class _TextTimerState extends State<TextTimer> {
  Stopwatch watch = Stopwatch();

  void leftButtonPressed() {
    setState(() {
      if (watch.isRunning) {
        print("${watch.elapsedMilliseconds}");
      } else {
        watch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (watch.isRunning) {
        watch.stop();
      } else {
        watch.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:200),
      child: Column(children: <Widget>[
        TimerText(
          stopwatch: watch,
        ),
        Padding(
          padding: const EdgeInsets.only(top:135),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.forward),
                onPressed: () {
                  setState(() {
                    watch.start();
                  });
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () {
                  setState(() {
                    watch.stop();
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
