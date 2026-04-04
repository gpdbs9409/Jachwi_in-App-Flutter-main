class Posting {
  final int id;
  final int userId;
  final String title;
  final String content;
  final String category;
  final int viewCount;
  final int commentCount;
  final DateTime createdAt;

  Posting({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.category,
    required this.viewCount,
    required this.commentCount,
    required this.createdAt,
  });

  factory Posting.fromJson(Map<String, dynamic> json) => Posting(
        id:           json['id'] as int,
        userId:       json['userId'] as int,
        title:        json['title'] as String,
        content:      json['content'] as String,
        category:     json['category'] as String,
        viewCount:    json['viewCount'] as int,
        commentCount: json['commentCount'] as int,
        createdAt:    DateTime.parse(json['createdAt'] as String),
      );
}
