import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galary_flutter_application/data/api/photos_api.dart';
import 'package:galary_flutter_application/domain/models/photo.dart';
import 'package:galary_flutter_application/presentation/widgets/photo_card.dart';
//import 'package:image_card/image_card.dart';

final userProvider = Provider<PhotoApi>((ref) => PhotoApi());

final photosListProvider = FutureProvider<List<Photo>>((ref) async {
  return ref.watch(userProvider).fetchPhotos();
});

class PhotoCardList extends ConsumerWidget {
  const PhotoCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosData = ref.watch(photosListProvider);
    return photosData.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (photosData) {
        List<Photo> photos = photosData.map((e) => e).toList();
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          children: [
            for (final photo in photos)
              // TransparentImageCard(
              //   width: 500,
              //   height: 500,
              //   imageProvider: Image.network(photo.urlImage.toString()).image,
              //   title: Text(photo.authorName.toString(),
              //       style: const TextStyle(color: Colors.white)),
              //   // description: Text(photo.description.toString())
              // ),
              PhotoCard(photo: photo),
          ],
        );
      },
    );
  }
}
