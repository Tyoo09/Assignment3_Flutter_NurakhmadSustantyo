class AlbumModels {
  int? userId;
  int? id;
  String? title;

  AlbumModels({
    this.userId,
    this.id,
    this.title,
  });

  factory AlbumModels.fromJson(Map<String, dynamic> json) => AlbumModels(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
