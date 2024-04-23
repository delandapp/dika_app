import 'package:digitallibrary/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:digitallibrary/app/data/constans/endpoint.dart';
// import 'package:digitallibrary/app/data/models/response_bookPopular.dart';
// import 'package:digitallibrary/app/data/models/response_koleksi.dart';
// import 'package:digitallibrary/app/data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
// import '../../../data/models/response_book_popular.dart';
// import '../../../data/models/response_bookNew.dart';


class HomeController extends GetxController{
  //TODO: Implement HomeController
    final RxString username = StorageProvider.read(StorageKey.username).obs;
    final TextEditingController search = TextEditingController();
    final DashboardController dashboardController = Get.put(DashboardController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

}
