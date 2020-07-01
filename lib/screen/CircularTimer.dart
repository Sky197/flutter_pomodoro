import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
      duration: Duration(seconds: 1),
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

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Column(
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 300.0,
            height: 300.0,
            child: LiquidCircularProgressIndicator(
              value: animationController.value,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.redAccent),
              center: Text(
                "${percentage.toStringAsFixed(0)}%",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:32.0),
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
      ],
    );
  }
}
