import 'package:get/get.dart';
import 'package:hotelio/src/models/user.dart';

class UserC extends GetxController {
  final _data = User().obs;
  User get data => _data.value;
  setData(n) => _data.value;
}
