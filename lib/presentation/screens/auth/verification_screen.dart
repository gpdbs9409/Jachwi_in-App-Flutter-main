import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/data/repositories/auth_repository.dart';
import 'package:ja_chuiin/presentation/screens/auth/profile_form_screen.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _authRepository = AuthRepository();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('본인인증'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: deviceHeight,
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset('assets/images/my_logo.png', width: 150, height: 150),
            SizedBox(
              width: deviceWidth * 0.3,
              child: Column(
                children: [
                  const Text('이메일을 입력해주세요', textAlign: TextAlign.center),
                  SizedBox(height: deviceHeight * 0.03),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kBackgroundGray,
                      hintText: '이메일',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: deviceHeight * 0.05),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryLight),
                    onPressed: () async {
                      await _authRepository
                          .sendVerificationEmail(_emailController.text);
                    },
                    child: const Text('인증번호 전송'),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  const Text('인증번호'),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _codeController,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kBackgroundGray,
                      hintText: '인증번호 입력',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryLight),
                    onPressed: () => Get.to(() => ProfileFormScreen()),
                    child: const Text('인증완료'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: const SizedBox(height: 50.0),
      ),
    );
  }
}
