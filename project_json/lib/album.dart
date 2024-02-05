class Album {
  int? userId;
  int? id;
  final String title;

  Album({
    this.userId,
    this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
