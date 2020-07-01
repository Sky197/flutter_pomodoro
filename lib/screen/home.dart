import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/screen/CircularTimer.dart';
import 'package:flutter_pomodoro/screen/TextTimer.dart';
import 'package:liquid_ui/liquid_ui.dart';

bool buttonResetVisibility = false;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POMODORO"),
      ),
      body: LCarousel(
        canScroll: true,
        autoScroll: false,
        showIndicator: true,
        enableIndicatorTapControl: true,
        items: [
          LCarouselItem(
            child: CircularTimer(),
          ),
          LCarouselItem(
            child: TextTimer(),
          ),
        ],
      ),
    );
  }
}
