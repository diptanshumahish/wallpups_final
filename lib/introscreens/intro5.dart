import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/sad.json'),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Currently some phone models don't support Lock Screen wallpaper changing, in that case you can only set the home screen wallpaper :(",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
