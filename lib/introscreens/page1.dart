import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Welcome to wallpups, set beautiful wallpapers with ease!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          LottieBuilder.asset('assets/phone.json'),
          const Text(
            "Click next to continue",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
