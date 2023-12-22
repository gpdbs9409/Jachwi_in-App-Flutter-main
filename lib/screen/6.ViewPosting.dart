import 'package:flutter/material.dart';
import 'package:ja_chuiin/models/postings.dart';
import 'package:ja_chuiin/utilities/SizeConfig.dart';
import 'package:ja_chuiin/widgets/Appbar.dart';
import 'package:ja_chuiin/widgets/BottomAppBar.dart';

class vieweachpostings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _vieweachpostingsState();
  }
}

class _vieweachpostingsState extends State<vieweachpostings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: Appbar(),
      body: Container(width: 500,
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(

            children: [
              Text(postings[0].title,

                style: TextStyle(
                    fontSize: 20
                ),),
              SizedBox(height: SizeConfig.deviceHeight* 0.01,),
              Text(postings[0].contents),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up_off_alt),
                      onPressed: () {
                        int thumb = 0;
                        thumb++;
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.thumb_up_alt_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.thumb_up_alt_outlined),
                      onPressed: () {},
                    )
                  ])])

    ), bottomNavigationBar:  Bottom() );
  }
}