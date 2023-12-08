import 'package:flutter/material.dart';
import 'package:timer_popup/timer.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: const Text("Timer")),
        );
  }
}