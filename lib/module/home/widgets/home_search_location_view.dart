

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_logic.dart';

class HomeSearchLocationView extends GetView<HomeLogic> {
  const HomeSearchLocationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.searchController,
      decoration: InputDecoration(
        hintText: 'Search location',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}