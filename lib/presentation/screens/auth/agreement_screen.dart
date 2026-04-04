import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/presentation/screens/auth/verification_screen.dart';

class _Agreement {
  String title;
  String contents;
  bool isChecked;

  _Agreement(this.title, this.contents, this.isChecked);
}

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  final List<_Agreement> _agreements = [
    _Agreement('약관1', 'content', false),
    _Agreement('약관2', 'content', false),
    _Agreement('약관3', 'content', false),
  ];

  @override
  Widget build(BuildContext context) {
    final bool allChecked = _agreements.every((a) => a.isChecked);

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.separated(
        itemCount: _agreements.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: _agreements[index].isChecked,
              onChanged: (value) {
                setState(() {
                  _agreements[index].isChecked = value ?? false;
                });
              },
            ),
            title: Text(_agreements[index].title),
            subtitle: Text(_agreements[index].contents),
            trailing: const Icon(Icons.more_vert),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 2, color: Colors.black);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: allChecked
                ? () => Get.to(() => VerificationScreen())
                : null,
            child: const Text('다음'),
          ),
        ),
      ),
    );
  }
}
