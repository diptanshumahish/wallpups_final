import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

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
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          child: Container(
            height: height / 3.7,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    fit: BoxFit.cover,
                    image: NetworkImage(images[Random().nextInt(4 - 0)]))),
            child: Stack(children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 10),
                    child: Row(
                      children: [
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
                    child: CupertinoTextField(
                      placeholder: "Search for wallpapers",
                      cursorColor: Colors.deepPurple,
                    ),
                  )
                ],
              ))
            ]),
          ),
        ),
        Container(
          height: height - height / 2.5,
          // color: Colors.deepPurple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: width / 20),
                child: Text("Suggested Catagories",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                              child: Center(
                                  child: Text(
                                "Sunsets",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              width: width / 2.5,
                              height: height / 10,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      opacity: 0.5,
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          "https://source.unsplash.com/random/1920x1080/?sunsets")))),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                              child: Center(
                                  child: Text(
                                "Roads",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              width: width / 2.5,
                              height: height / 10,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      opacity: 0.5,
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          "https://source.unsplash.com/random/1920x1080/?roads")))),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 20, vertical: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                              child: Center(
                                  child: Text(
                                "Anime",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              width: width / 2.5,
                              height: height / 10,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      opacity: 0.5,
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          "https://source.unsplash.com/random/1920x1080/?anime")))),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                              child: Center(
                                  child: Text(
                                "Forests",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              width: width / 2.5,
                              height: height / 10,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      opacity: 0.5,
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          "https://source.unsplash.com/random/1920x1080?forests")))),
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
