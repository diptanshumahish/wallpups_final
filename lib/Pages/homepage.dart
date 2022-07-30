import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpups_final/wallpapers/displaywalls.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: height / 3.5,
            ),
            ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ).createShader(const Rect.fromLTRB(0, 0, 0, 200));
                },
                blendMode: BlendMode.dstIn,
                child: const Image(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        "https://source.unsplash.com/random/1920x1080/?purple"))),
            Positioned(
                bottom: 0,
                left: width / 20,
                child: Text(
                  "Wallpups",
                  style: TextStyle(
                      fontSize: size.height / 18, color: Colors.white),
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.all(width / 20),
          child: Text(
            "The best wallpapers you can have!",
            style: TextStyle(fontSize: size.height / 50, color: Colors.white70),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 20),
          child: Text(
            "Featured",
            style: TextStyle(fontSize: size.height / 40, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: InkWell(
            borderRadius: BorderRadius.circular(7),
            splashColor: Colors.deepPurple,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "Nature",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://source.unsplash.com/random/1920x1080?forest')),
                  borderRadius: BorderRadius.circular(5)),
              height: height / 7,
              child: Stack(children: [
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Nature",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Colors.white),
                    ))
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "night skies",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://source.unsplash.com/random/1920x1080?night')),
                  borderRadius: BorderRadius.circular(5)),
              height: height / 7,
              child: Stack(children: [
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Night Skies",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Colors.white),
                    ))
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "Dark",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://source.unsplash.com/random/1920x1080?dark')),
                  borderRadius: BorderRadius.circular(5)),
              height: height / 7,
              child: Stack(children: [
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Dark",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Colors.white),
                    ))
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "City line",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://source.unsplash.com/random/1920x1080?sunset+city')),
                  borderRadius: BorderRadius.circular(5)),
              height: height / 7,
              child: Stack(children: [
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "City Lines",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Colors.white),
                    ))
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width / 25),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Wallpapers(
                            type: "Purple",
                          ))));
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      opacity: 0.5,
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://source.unsplash.com/random/1920x1080?purple')),
                  borderRadius: BorderRadius.circular(5)),
              height: height / 7,
              child: Stack(children: [
                Positioned(
                    right: width / 20,
                    bottom: height / 50,
                    child: Text(
                      "Purples",
                      style: TextStyle(
                          fontSize: size.height / 35, color: Colors.white),
                    ))
              ]),
            ),
          ),
        )
      ],
    );
  }
}
