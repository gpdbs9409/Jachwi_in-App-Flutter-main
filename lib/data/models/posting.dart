import 'package:flutter/material.dart';

class Posting {
  final String title;
  final String contents;
  final Image image;

  Posting({required this.title, required this.contents, required this.image});
}

// 임시 더미 데이터 — 추후 API 응답으로 교체 예정
final List<Posting> dummyPostings = List.generate(
  12,
  (_) => Posting(
    title: 'title',
    contents: 'examplecontents',
    image: Image.asset('assets/images/my_logo.png'),
  ),
);
