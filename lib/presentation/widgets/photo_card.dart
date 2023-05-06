import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galary_flutter_application/domain/models/photo.dart';
import 'package:galary_flutter_application/presentation/screens/about_photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPhoto(photo: photo),
                ),
              );
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: CachedNetworkImage(
            imageBuilder: (context, imageProvioder) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvioder, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black45
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            utf8.decode(photo.authorName.toString().runes.toList()),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          if(photo.description != null)
                            Text(
                              utf8.decode(photo.description.toString().runes.toList()),
                              style: const TextStyle(color: Colors.white, fontSize: 9.0),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress))),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: photo.urlImage.toString(),
            fit: BoxFit.cover),
      ),
    );
  }
}
