class Photo {
  final String? urlImage;
  final String? authorName;
  final String? description;

  Photo(
      {required this.urlImage,
      required this.authorName,
      required this.description});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      urlImage: json["urls"]["full"] as String,
      authorName: json["user"]["name"],
      description: json["alt_description"],
    );
  }
}
