final List<Posting> dummyPostings = [
  Posting(id: 1, userId: 1, title: '서울 신림동 원룸 후기', content: '조용하고 교통 편리해서 만족스러웠어요. 근처에 편의점도 많고 지하철역도 가깝습니다.', category: 'REVIEW', viewCount: 42, commentCount: 3, createdAt: DateTime(2025, 3, 1)),
  Posting(id: 2, userId: 2, title: '자취방 구할 때 꼭 확인해야 할 것들', content: '계약 전 반드시 등기부등본 확인하세요. 전입신고도 잊지 마시고요.', category: 'TIP', viewCount: 108, commentCount: 12, createdAt: DateTime(2025, 3, 5)),
  Posting(id: 3, userId: 3, title: '룸메이트 구해요 (홍대 근처)', content: '2인실 쉐어하우스 같이 살 룸메이트 구합니다. 비흡연자 선호.', category: 'ROOMMATE', viewCount: 33, commentCount: 7, createdAt: DateTime(2025, 3, 10)),
];

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
