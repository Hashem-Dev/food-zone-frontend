import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingPageController extends GetxController {
  final pageController = PageController();
  final RxInt _page = 0.obs;

  void setPage(int page) => _page.value = page;

  int get page => _page.value;

  void getNextSlide() {
    if (pageController.hasClients) {
      pageController.animateToPage(
        page + 1,
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void getLastSlide() {
    if (pageController.hasClients) {
      pageController.jumpToPage(3);
    }
  }

  @override
  void onInit() {
    pageController.initialPage;
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
