class Comment {
  final String name;
  final String content;
  final String date;
  final String time;

  Comment({
    required this.name,
    required this.content,
    required this.date,
    required this.time,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'],
      content: json['comment'],
      date: json['date'],
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'comment': content,
        'date': date,
        'time': time,
      };
}
