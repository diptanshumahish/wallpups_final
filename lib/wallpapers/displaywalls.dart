import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpups_final/wallpapers/fullimage.dart';

// ignore: must_be_immutable
class Wallpapers extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var type;
  Wallpapers({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type),
            const Text(
              "Select a wallpaper to preview",
              style: TextStyle(fontSize: 15, color: Colors.white60),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 35,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              childAspectRatio: 9 / 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FullScreen(
                          index: index,
                          type: type,
                          url:
                              'https://source.unsplash.com/random/2160x3840/?$type/$index.jpg',
                        )));
              },
              child: Container(
                // ignore: sort_child_properties_last
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    placeholder: (context, url) {
                      return const CupertinoActivityIndicator(
                        color: Colors.white54,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            const Text(
                              "No Internet",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    },
                    imageUrl:
                        'https://source.unsplash.com/random/2160x3840/?$type/$index.jpg',
                  ),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            );
          },
        ),
      ),
    );
  }
}
