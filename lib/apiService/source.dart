class Source {
  String title;
  String description;
  String urlToImage;

  Source({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      title: json['id'],
      description: json['description'] ?? '',
      urlToImage: json["urlToImage"] ?? '',
    );
  }
}
