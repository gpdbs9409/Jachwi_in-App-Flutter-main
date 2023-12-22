import 'package:flutter/material.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';
import 'package:ja_chuiin/models/Comment_Model.dart';


class CommentItem extends StatefulWidget {
  final comments comment;
  final bool isInternal;

  CommentItem({required this.comment, required this.isInternal});

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          // If the image has a fixed size, consider wrapping it in a Flexible or Expanded widget.
          Image.asset(
            'assets/images/my_logo.png',
            width: 20,
            height: 20,
          ),
          SizedBox(width: 10), // Spacing between the image and the text
          // Wrap the Column with an Expanded widget to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.comment.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.comment.comment,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                // If you want the date-time and reply to be at the end, consider using MainAxisAlignment.spaceBetween
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Reply", style: TextStyle(color: Colors.black26)),
                    Text(
                      "${widget.comment.date} at ${widget.comment.time}",
                      style: TextStyle(color: Colors.black26),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // If you need the icons to be at the end of the row, they should be outside the Expanded widget.
          IconButton(
            icon: Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

