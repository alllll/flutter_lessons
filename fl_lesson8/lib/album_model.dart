class AlbumModel {
  final int userId;
  final int id;
  final String title;

  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        userId: json['userId'], id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
}
