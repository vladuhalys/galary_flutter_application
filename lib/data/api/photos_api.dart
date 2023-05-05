import 'dart:convert';
import 'package:galary_flutter_application/domain/models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApi {
  Future<List<Photo>> fetchPhotos() async {
    const key = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
    final response = await http.get(Uri.parse('https://api.unsplash.com/photos?page=1&per_page=30&client_id=$key'));

    if (response.statusCode == 200) {
      var photosJson = jsonDecode(response.body) as List<dynamic>;
      return photosJson.map((c) => Photo.fromJson(c)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

