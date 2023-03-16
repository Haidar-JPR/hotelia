import 'package:get/get.dart';

class HomeC extends GetxController {
  final _currentIndex = 0.obs;
  int get pageIndex => _currentIndex.value;
  set pageIndex(n) => _currentIndex.value = n;
}
