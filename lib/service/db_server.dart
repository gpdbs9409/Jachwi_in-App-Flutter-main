import 'package:ja_chuiin/screen/1.log_in.dart';
import 'package:ja_chuiin/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';


Future<void> saveUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse("http://server-uri/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception("Failed to send data");
    } else {
      print("User Data sent successfully");
      Get.to(LOGIN());
    }
  } catch (e) {
    print("Failed to send post data: ${e}");
  }
}