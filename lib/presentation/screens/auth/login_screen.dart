import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:ja_chuiin/data/repositories/auth_repository.dart';
import 'package:ja_chuiin/presentation/screens/auth/agreement_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authRepository = AuthRepository();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(SizeConfig.deviceWidth * 0.1),
        margin: EdgeInsets.all(SizeConfig.deviceWidth * 0.05),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset('assets/images/my_logo.png',
                width: SizeConfig.deviceWidth * 0.25),
            SizedBox(
              width: SizeConfig.deviceWidth * 0.25,
              child: Column(
                children: [
                  TextField(
                    controller: _idController,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kBackgroundGray,
                      hintText: '아이디',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kBackgroundGray,
                      hintText: '비밀번호',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryLight),
                    onPressed: () async {
                      await _authRepository.login(
                        _idController.text,
                        _passwordController.text,
                      );
                      Get.toNamed('/home');
                    },
                    child: const Text('로그인'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.to(() => AgreementScreen()),
                    child: const Text('회원가입',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.to(() => AgreementScreen()),
                    child: const Text('PW찾기',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.to(() => AgreementScreen()),
                    child: const Text('ID찾기',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
