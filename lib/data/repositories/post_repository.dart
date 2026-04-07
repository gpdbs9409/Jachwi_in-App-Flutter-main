import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ja_chuiin/data/models/posting.dart';

class PostRepository {
  static const String _baseUrl = 'http://3.36.110.85:8080/api/v1/posts';

  // 게시글 목록 — GET /api/v1/posts?category=&page=&size=
  Future<List<Posting>> fetchPosts({String? category, int page = 0, int size = 20}) async {
    final params = {
      'page': page.toString(),
      'size': size.toString(),
      if (category != null) 'category': category,
    };
    final uri = Uri.parse(_baseUrl).replace(queryParameters: params);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final content = body['content'] as List<dynamic>;
      return content.map((e) => Posting.fromJson(e as Map<String, dynamic>)).toList();
    }
    throw Exception('게시글 목록 조회 실패: ${response.statusCode}');
  }

  // 게시글 상세 — GET /api/v1/posts/{id}
  Future<Posting> fetchPost(int postId) async {
    final response = await http.get(Uri.parse('$_baseUrl/$postId'));

    if (response.statusCode == 200) {
      return Posting.fromJson(json.decode(response.body) as Map<String, dynamic>);
    }
    throw Exception('게시글 조회 실패: ${response.statusCode}');
  }

  // 게시글 작성 — POST /api/v1/posts (JWT 필요)
  Future<Posting> createPost({
    required String title,
    required String content,
    required String category,
    required String token,
  }) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'title': title, 'content': content, 'category': category}),
    );

    if (response.statusCode == 200) {
      return Posting.fromJson(json.decode(response.body) as Map<String, dynamic>);
    }
    throw Exception('게시글 작성 실패: ${response.statusCode}');
  }

  // 게시글 삭제 — DELETE /api/v1/posts/{id} (JWT 필요)
  Future<void> deletePost(int postId, String token) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$postId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 204) {
      throw Exception('게시글 삭제 실패: ${response.statusCode}');
    }
  }

  // 댓글 작성 — POST /api/v1/posts/{id}/comments (JWT 필요)
  Future<void> createComment({
    required int postId,
    required String content,
    int? parentId,
    required String token,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$postId/comments'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'content': content,
        if (parentId != null) 'parentId': parentId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('댓글 작성 실패: ${response.statusCode}');
    }
  }
}
