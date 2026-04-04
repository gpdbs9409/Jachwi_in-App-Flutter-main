import 'package:flutter/material.dart';
import 'package:ja_chuiin/data/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final bool isInternal;

  const CommentItem({
    super.key,
    required this.comment,
    this.isInternal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/my_logo.png',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(comment.content),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Reply',
                        style: TextStyle(color: Colors.black26)),
                    Text(
                      '${comment.date} at ${comment.time}',
                      style: const TextStyle(color: Colors.black26),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
