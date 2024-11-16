import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/presentation/home/chats/chats.dart';
import 'package:flutter_firebase_test/presentation/home/home_page/home_page.dart';
import 'package:flutter_firebase_test/presentation/home/journal/journal.dart';
import 'package:flutter_firebase_test/presentation/home/me/me.dart';
import 'package:flutter_firebase_test/presentation/home/more/more.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavController extends GetxController {
  // Observable current index
  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  // List of pages
  final List<Widget> pages = [
    const Homepage(),
    const Journal(),
    Chats(),
    const Profile(),
    const More(),
  ];

  // Update current index
  void updateIndex(int index) {
    _currentIndex.value = index;
  }

  // Reset to home page
  void resetValues() {
    _currentIndex.value = 0;
  }
}
