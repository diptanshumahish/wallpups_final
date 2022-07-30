import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wallpups_final/introscreens/intro.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List images = [
      'https://images.unsplash.com/photo-1516410529446-2c777cb7366d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1494122353634-c310f45a6d3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565526486230-f92dc52d4b4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1557682250-33bd709cbe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80',
    ];
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          child: Container(
            height: height / 3.7,
            decoration: BoxDecoration(
                image: DecorationImage(
              opacity: 0.5,
              fit: BoxFit.cover,
              image:
                  CachedNetworkImageProvider(images[Random().nextInt(4 - 0)]),
            )),
            child: Stack(children: [
              Positioned(
                bottom: height / 20,
                left: width / 30,
                child: const Text(
                  "Settings",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: (() {
              setState(() {
                DefaultCacheManager().emptyCache();
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                        insetAnimationDuration: const Duration(seconds: 1),
                        title: const Text(" Wallpapers refreshed"),
                        content: const Text("Check out the updated wallpapers"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("done",
                                  style: TextStyle(color: Colors.deepPurple)))
                        ],
                      ));
            }),
            splashColor: Colors.deepPurple,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Refresh Wallpapers",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "This will refersh the wallpapers",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              launchUrlString("mailto:diptanshumahish2016@gmail.com");
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Colors.deepPurple,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Contact Developer",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Any suggestions?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const Intro())));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Colors.deepPurple,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Show intro Screen tips",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Incase you missed them ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
