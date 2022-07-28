// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpups_final/Pages/explorepage.dart';
import 'package:wallpups_final/Pages/settingspage.dart';

import 'homepage.dart';

// Navigation
bool page1 = true;
bool page2 = false;
bool page3 = false;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 10,
          child: Container(
            width: width,
            height: height / 10,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (() {
                          controller.animateToPage(0,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                          setState(() {
                            page1 = true;
                            page2 = false;
                            page3 = false;
                          });
                        }),
                        icon: Icon(
                          CupertinoIcons.home,
                          color: page1 == true ? Colors.white : Colors.white54,
                        )),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: page1 == true ? Colors.white : Colors.white54,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (() {
                          controller.animateToPage(1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                          setState(() {
                            page1 = false;
                            page2 = true;
                            page3 = false;
                          });
                        }),
                        icon: Icon(CupertinoIcons.search,
                            color:
                                page2 == true ? Colors.white : Colors.white54)),
                    Text(
                      "Explore",
                      style: TextStyle(
                          color: page2 == true ? Colors.white : Colors.white54),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (() {
                          controller.animateToPage(2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                          setState(() {
                            page1 = false;
                            page2 = false;
                            page3 = true;
                          });
                        }),
                        icon: Icon(CupertinoIcons.settings,
                            color:
                                page3 == true ? Colors.white : Colors.white54)),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: page3 == true ? Colors.white : Colors.white54),
                    ),
                  ],
                )
              ],
            ),
          )),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: const [HomePage(), ExplorePage(), SettingsPage()],
      ),
    );
  }
}
