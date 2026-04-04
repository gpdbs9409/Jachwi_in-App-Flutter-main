import 'package:flutter/material.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:ja_chuiin/data/models/posting.dart';
import 'package:ja_chuiin/presentation/widgets/bottom_nav_bar.dart';
import 'package:ja_chuiin/presentation/widgets/common_app_bar.dart';

class PostingDetailScreen extends StatefulWidget {
  @override
  _PostingDetailScreenState createState() => _PostingDetailScreenState();
}

class _PostingDetailScreenState extends State<PostingDetailScreen> {
  int _thumbCount = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: CommonAppBar(),
      body: Container(
        width: 500,
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              dummyPostings[0].title,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(height: SizeConfig.deviceHeight * 0.01),
            Text(dummyPostings[0].contents),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up_off_alt),
                  onPressed: () => setState(() => _thumbCount++),
                ),
                Text('$_thumbCount'),
                IconButton(
                  icon: const Icon(Icons.thumb_down_alt_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
