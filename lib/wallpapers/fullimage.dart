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
    return Scaffold(
      backgroundColor: Colors.black,
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
          "Image preview",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
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
                    GestureDetector(
                      onTap: (() async {
                        String url =
                            'https://source.unsplash.com/random/1080x1920?$type/$index';
                        int location = WallpaperManagerFlutter.HOME_SCREEN;
                        WallpaperManagerFlutter().setwallpaperfromFile(
                            await DefaultCacheManager().getSingleFile(url),
                            location);
                      }),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Set Wallpaper",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height / 1.2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 10),
                        GestureDetector(
                          child: const Icon(CupertinoIcons.share_up,
                              color: Colors.white, size: 20),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
