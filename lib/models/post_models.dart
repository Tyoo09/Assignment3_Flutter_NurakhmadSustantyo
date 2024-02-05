class PostModels {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModels({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostModels.fromJson(Map<String, dynamic> json) {
    return PostModels(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String? ?? 'No Title',
      body: json['body'] as String? ?? 'No Body',
    );
  }
}