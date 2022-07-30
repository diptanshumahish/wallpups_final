import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpups_final/Pages/home.dart';
import 'package:wallpups_final/introscreens/intro.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  bool seen;
  SplashScreen({Key? key, required this.seen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (() async {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: false,
        barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 400),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return (widget.seen) ? const Home() : const Intro();
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
      );
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.5),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            LottieBuilder.asset(
              'assets/stars.json',
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.white.withOpacity(0.3), //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 80, // blur radius
                          offset:
                              const Offset(5, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    child: Image(
                        height: height / 5,
                        image: const AssetImage('assets/wallpupslogo.png')),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
