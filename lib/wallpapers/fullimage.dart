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
  // ignore: prefer_typing_uninitialized_variables
  var url;
  FullScreen(
      {Key? key, required this.index, required this.type, required this.url})
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  placeholder: (context, url) {
                    return const CupertinoActivityIndicator(
                      color: Colors.white54,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(CupertinoIcons.alarm);
                  },
                  imageUrl: url),
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.white,
                            onTap: (() async {
                              int location =
                                  WallpaperManagerFlutter.BOTH_SCREENS;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.deepPurple,
                                      content: Text(
                                          "Wallpaper set for both screens")));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    Text(
                                      "Both Screens",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              int location =
                                  WallpaperManagerFlutter.LOCK_SCREEN;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.deepPurple,
                                      content: Text(
                                          "Wallpaper set for lock screen")));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    Text(
                                      "Lock Screen",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              int location =
                                  WallpaperManagerFlutter.HOME_SCREEN;
                              WallpaperManagerFlutter().setwallpaperfromFile(
                                  await DefaultCacheManager()
                                      .getSingleFile(url),
                                  location);
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.deepPurple,
                                      content: Text(
                                          "Wallpaper set for home screen")));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Set Wallpaper",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                    Text(
                                      "Home Screen",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
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
