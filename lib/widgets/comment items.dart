import 'package:ja_chuiin/utilities/Utils.dart';
import 'package:flutter/material.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';

class comments {
  final String name;
  final String comment;
  final Image userProfileImage;
  final String date;
  final String time;

  comments({
    required this.name,
    required this.comment,
    required this.userProfileImage,
    required this.date,
    required this.time,
  });
}
class CommentItem extends StatefulWidget {
  final comments comment;
  final bool isInternal;

  @override
  _CommentItemState createState() => _CommentItemState();

  CommentItem({required this.comment, required this.isInternal});
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/my_logo.png',
            width: 20,
            height: 20,
          ),
          Container(
            width: 300,

            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: widget.comment.name,
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                  child: RichText(
                    textAlign: TextAlign.start,
                    softWrap: true,
                    text: TextSpan(
                      text: widget.comment.comment,
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2,
                          color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, bottom: 5, right: 10, top: 8),
                      child: RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          text: "Reply",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 2,
                              color: Colors.black26),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 5),
                      child: RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          text: widget.comment.date +
                              " at " +
                              widget.comment.time,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 1.5,
                              color: Colors.black26),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            iconSize: 20,
            icon:Icon (Icons.thumb_up_alt_outlined),
            onPressed:() {},
          ),
          IconButton(
            iconSize: 20,
            icon:Icon (Icons.thumb_up_alt_outlined),
            onPressed:() {},
          ),
          IconButton(
            iconSize: 20,
            icon:Icon (Icons.thumb_up_alt_outlined),
            onPressed:() {},
          ),
        ],
      ),
    );
  }
}
List<comments> myComments = [
  comments(
    name: 'John Doe',
    comment: 'This is a great post!',
    userProfileImage: Image.asset(
      'assets/images/my_logo.png',
      width: 10,
      height: 10,
    ),
    date: '2023-08-08',
    time: '12:34 PM',
  ),
  comments(
    name: 'John',
    comment: 'This is a great post!',
    userProfileImage: Image.asset(
      'assets/images/my_logo.png',
      width: 10,
      height: 10,
    ),
    date: '2023-08-08',
    time: '12:34 PM',
  ),
];
