import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:ja_chuiin/data/models/posting.dart';
import 'package:ja_chuiin/presentation/screens/map/map_screen.dart';
import 'package:ja_chuiin/presentation/screens/posting/posting_detail_screen.dart';
import 'package:ja_chuiin/presentation/widgets/bottom_nav_bar.dart';
import 'package:ja_chuiin/presentation/widgets/common_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const List<String> _menuItems = ['공동구매', '룸메이트', '방구해요'];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: CommonAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 0.8 * SizeConfig.deviceHeight,
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.deviceHeight * 0.05),
                    TextField(
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: kBackgroundGray,
                        hintText: '검색어를 입력하세요',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(height: SizeConfig.deviceHeight * 0.05),
                    Row(
                      children: _menuItems
                          .map((label) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: kBackgroundGray,
                                      ),
                                      onPressed: () =>
                                          Get.to(() => MapScreen()),
                                      child: Text(
                                        label,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: SizeConfig.deviceHeight * 0.05),
                    SizedBox(
                      height: 400,
                      child: Container(
                        color: kBackgroundGray,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dummyPostings.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const CircleAvatar(
                                radius: 10,
                                child: Icon(Icons.person, size: 12),
                              ),
                              title: Text(dummyPostings[index].title),
                              subtitle: Text(dummyPostings[index]
                                  .content
                                  .substring(0, dummyPostings[index].content.length.clamp(0, 20))),
                              onTap: () =>
                                  Get.to(() => PostingDetailScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
