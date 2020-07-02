import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:liquid_ui/liquid_ui.dart';

AnimationController animationController;

class CircularTimer extends StatelessWidget {
  Widget animated = AnimatedLiquidCircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AnimatedLiquidCircularProgressIndicator(),
      ],
    );
  }
}

class AnimatedLiquidCircularProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      AnimatedLiquidCircularProgressIndicatorState();
}

class AnimatedLiquidCircularProgressIndicatorState
    extends State<AnimatedLiquidCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animationController.addListener(() => setState(() {}));
    animationController
        .addStatusListener((state) => print('status atual $state'));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Duration time = Duration(minutes: 25);

  String getDisplayTime(Duration time) {
    int minutes = time.inMinutes;
    int seconds = (time.inSeconds - (time.inMinutes * 60));
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Column(
      children: <Widget>[
        const Divider(
          color: Colors.white,
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              textColor: Colors.grey[900],
              animationDuration: Duration(seconds: 3),
              hoverElevation: 50,
              onPressed: () {},
              child: Text('Pomodoro'),
            ),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.grey[900],
              animationDuration: Duration(seconds: 3),
              hoverElevation: 50,
              onPressed: () {},
              child: Text('Short Break'),
            ),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.grey[900],
              animationDuration: Duration(seconds: 3),
              hoverElevation: 50,
              onPressed: () {},
              child: Text('Long Break'),
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              child: LiquidCircularProgressIndicator(
                borderColor: Colors.white,
                borderWidth: 3,
                value: animationController.value,
                backgroundColor: Colors.redAccent,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                center: Text(
                  "${percentage.toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.forward),
                onPressed: () {
                  setState(() {
                    animationController.forward();
                  });
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () {
                  setState(() {
                    animationController.stop();
                  });
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    animationController.reset();
                  });
                },
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 20,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
