import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpups_final/wallpapers/fullimage.dart';

class Wallpapers extends StatelessWidget {
  var type;
  Wallpapers({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(type),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
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
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://source.unsplash.com/random/1080x1920?$type/$index'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          },
        ),
      ),
    );
  }
}
