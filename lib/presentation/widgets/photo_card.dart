import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galary_flutter_application/domain/models/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: SizedBox(width: 50, height: 50, child:  CircularProgressIndicator(value: downloadProgress.progress))),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: photo.urlImage.toString(),
            fit: BoxFit.cover
          ),
        );
  }
}