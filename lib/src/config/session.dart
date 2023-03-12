import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotelio/src/controllers/userC.dart';
import 'package:hotelio/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  // NOTE: Save User Session
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);
    if (success) {
      final cUser = Get.put(UserC());
      cUser.setData(user);
    }
    return success;
  }

  // NOTE: Get User Session
  static Future<User> getUser() async {
    User user = User();
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(UserC());
    cUser.setData(user);
    return user;
  }

  // NOTE: Logout User Session
  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(UserC());
    cUser.setData(User());
    return success;
  }
}
