import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/presentation/screens/home/home_screen.dart';

class ProfileFormScreen extends StatefulWidget {
  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _schoolController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nicknameController.dispose();
    _schoolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원정보작성'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(deviceWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInputField(_nameController, '이름'),
            _buildInputField(_emailController, '이메일'),
            _buildInputField(_nicknameController, '닉네임'),
            _buildInputField(_schoolController, '학교'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kAccentDark),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  content: const Text('환영합니다'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                        Get.offAll(() => HomeScreen());
                      },
                      child: const Text('자취인시작하기'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('작성했어요'),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kBackgroundGray,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
