import 'package:bank_ui/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database_helper/database_helper.dart';

class CategoryController extends GetxController {
  final categoryName = TextEditingController();
  final categoryType = TextEditingController();
  RxInt selectedColor = 0.obs;

  var categoriesIncome = <Category>[].obs;
  var categoriesSpent = <Category>[].obs;

  @override
  void onInit() {
    getCategoryIncome();
    getCategorySpent();
    super.onInit();
  }

  void addCategoryToDatabase() async {
    String name = categoryName.text;
    String type = categoryType.text;
    Category category =
        Category(name: name, type: type, color: selectedColor.value);

    await DatabaseHelper.instance.addCategory(category);
    categoryName.text = "";
    categoryType.text = "";
    selectedColor.value = 0;
    getCategoryIncome();
    getCategorySpent();
    Get.back();
  }

  void updateCategory(int id) async {
    final name = categoryName.text;
    final type = categoryType.text;

    Category category = Category(
      id: id,
      name: name,
      type: type,
      color: selectedColor.value,
    );
    await DatabaseHelper.instance.updateCategory(category);
    categoryName.text = "";
    categoryType.text = "";
    selectedColor.value = 0;
    getCategoryIncome();
    getCategorySpent();
    Get.back();
  }

  void deleteCategory(int id) async {
    Category category = Category(
      id: id,
    );
    await DatabaseHelper.instance.deleteCategory(category);
    getCategoryIncome();
    getCategorySpent();
    Get.back();
  }

  void getCategoryIncome() async {
    categoriesIncome.value = await DatabaseHelper.instance.getCategoryIncome();
    update();
  }

  void getCategorySpent() async {
    categoriesSpent.value = await DatabaseHelper.instance.getCategorySpent();
    update();
  }
}
