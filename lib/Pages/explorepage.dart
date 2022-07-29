import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpups_final/wallpapers/displaywalls.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List images = [
      'https://images.unsplash.com/photo-1582769923195-c6e60dc1d8dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      'https://images.unsplash.com/photo-1591181520189-abcb0735c65d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1917&q=80',
      'https://images.unsplash.com/photo-1578070181910-f1e514afdd08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1533&q=80',
      'https://images.unsplash.com/photo-1530533718754-001d2668365a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    ];

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 10),
                    child: Row(
                      children: const [
                        Text(
                          "Search ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 10, vertical: 10),
                      child: CupertinoSearchTextField(
                        autofocus: false,
                        style: const TextStyle(color: Colors.white),
                        controller: controller,
                        onSubmitted: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Wallpapers(
                                      type: controller.text.trim()))));
                        },
                        placeholder: "Search for wallpapers",
                        placeholderStyle:
                            const TextStyle(color: Colors.white60),
                        itemColor: Colors.white60,
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.white24,
                      ))
                ],
              ))
            ]),
          ),
        ),
        SizedBox(
          height: height - height / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: width / 20),
                child: const Text("Suggested Catagories",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "sunset"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: SizedBox(
                            width: width / 2.3,
                            height: height / 9.5,
                            child: Stack(children: [
                              Image(
                                  color: Colors.black.withOpacity(0.3),
                                  colorBlendMode: BlendMode.dstIn,
                                  width: width,
                                  fit: BoxFit.cover,
                                  image: const CachedNetworkImageProvider(
                                      "https://source.unsplash.com/random/1920x1080/?sunset")),
                              Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Sunsets",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      Text("the drowning sun?",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15)),
                                    ],
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "roadside"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?roadside")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Roadside",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("For the long drives",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "anime"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?japan")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Anime",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("Some anime stuff?",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "Forest"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?forest")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Woods",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("The Nature!",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "minimal"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?minimalistic")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Minimal",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("minimalistic stuff",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "aesthetic"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?aesthetic")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Aesthetic ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("The Nature!",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "night"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?night")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Night Life",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("sleepy nights",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(7),
                        splashColor: Colors.deepPurple,
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Wallpapers(type: "festivals"))));
                        }),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            child: SizedBox(
                              width: width / 2.3,
                              height: height / 9.5,
                              child: Stack(children: [
                                Image(
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.dstIn,
                                    width: width,
                                    fit: BoxFit.cover,
                                    image: const CachedNetworkImageProvider(
                                        "https://source.unsplash.com/random/1920x1080/?festival")),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Festivals",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Text("The festivities",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15)),
                                      ],
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
