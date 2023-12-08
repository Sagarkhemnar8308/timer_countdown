import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = const Duration(seconds: 2);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds > 0) {
        addTime();
      } else {
        timer.cancel();
        showSuccessSnackbar();
      }
    });
  }

  void addTime() {
    setState(() {
      final int seconds = duration.inSeconds - 1;
      duration = Duration(seconds: seconds);
    });
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Payment Successfully!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: duration.inSeconds > 0
            ? CircularCountDownTimer(
                duration: duration.inSeconds,
                initialDuration: 0,
                controller: CountDownController(),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey[300]!,
                fillColor: Colors.green,
                backgroundColor: Colors.white,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                  fontSize: 33.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
              )
            : Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green, style: BorderStyle.solid, width: 19),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 150.0,
                  weight: 60,
                  textDirection: TextDirection.ltr,
                ),
              ),
      ),
    );
  }
}
