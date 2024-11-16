import 'package:get/get.dart';

class SuggestionChipsController extends GetxController {
  var selectedChipIndex = 0.obs; // Observable for tracking selected chip index

  void updateSelectedChip(int index) {
    selectedChipIndex.value = index; // Update the selected index
  }
}
