import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_zone/config/api.dart';
import 'package:food_zone/core/utils/snack_bar.dart';
import 'package:food_zone/features/main/home/data/models/search_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OffersLogic extends GetxController {
  final PageController offerPageController = PageController();
  final CarouselController carouselController = CarouselController();
  final RxInt _index = 0.obs;

  void changeIndex(int page) => _index.value = page;

  int get index => _index.value;

  @override
  void onInit() {
    offerPageController;
    carouselController.addListener(() {
      return changeIndex((carouselController.position.pixels / 100).round());
    });
    super.onInit();
  }

  @override
  void dispose() {
    offerPageController.dispose();
    carouselController.dispose();
    super.dispose();
  }

  final RxBool _searchLoading = false.obs;

  bool get searchLoading => _searchLoading.value;

  final Rxn<SearchResponse> _searchResult = Rxn<SearchResponse>(null);

  SearchResponse? get searchResult => _searchResult.value;

  Future<void> search(String key) async {
    _searchLoading.value = true;
    final Uri url = Uri.parse('$baseUrl/search/global?key=$key');
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        showErrorSnackBar('Failed to search.');
        return;
      }
      _searchResult.value = searchResponseFromJson(response.body);
    } catch (error) {
      log(error.toString());
    } finally {
      _searchLoading.value = false;
    }
  }
}
