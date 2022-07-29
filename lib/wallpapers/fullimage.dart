import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var index;
  // ignore: prefer_typing_uninitialized_variables
  var type;
  FullScreen({Key? key, required this.index, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // ignore: prefer_const_constructors
      key: Key("fullScreen"),
      direction: DismissDirection.startToEnd,
      onDismissed: ((direction) {
        Navigator.pop(context);
      }),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.1),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: const Text(
            "Preview Wallpaper",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://source.unsplash.com/random/1080x1920?$type/$index'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dimensions:1080x1920",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            letterSpacing: 0.4),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Source:Unsplash",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 0.4,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.white,
                            onTap: (() async {
                              String url =
                                  'https://source.unsplash.com/random/1080x1920?$type/$index';
                              int location =
                                  WallpaperManagerFlutter.BOTH_SCREENS;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        insetAnimationDuration:
                                            const Duration(seconds: 1),
                                        title: const Text(
                                          " Wallpaper set",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        ),
                                        content: const Text(
                                            "Check out your new wallpaper"),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("done",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.deepPurple)))
                                        ],
                                      ));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Both Screens",
                                      style: TextStyle(color: Colors.white70),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              String url =
                                  'https://source.unsplash.com/random/1080x1920?$type/$index';
                              int location =
                                  WallpaperManagerFlutter.LOCK_SCREEN;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        insetAnimationDuration:
                                            const Duration(seconds: 1),
                                        title: const Text(
                                          " Wallpaper set",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        ),
                                        content: const Text(
                                            "Check out your Lock Screen wallpaper"),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("done",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.deepPurple)))
                                        ],
                                      ));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Lock Screen",
                                      style: TextStyle(color: Colors.white70),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              String url =
                                  'https://source.unsplash.com/random/1080x1920?$type/$index';
                              int location =
                                  WallpaperManagerFlutter.HOME_SCREEN;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        insetAnimationDuration:
                                            const Duration(seconds: 1),
                                        title: const Text(
                                          " Wallpaper set",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        ),
                                        content: const Text(
                                            "Check out your Home Screen wallpaper"),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("done",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.deepPurple)))
                                        ],
                                      ));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Home Screen",
                                      style: TextStyle(color: Colors.white70),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
