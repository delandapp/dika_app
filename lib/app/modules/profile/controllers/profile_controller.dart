import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constans/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController with StateMixin{

  var isSwitched = false.obs;
  final loadingLogout = false.obs;

  void toggleSwitch() {
    isSwitched.toggle();
  }

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

  logout() async {
    loadingLogout(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      var response = await ApiProvider.instance().get(
          Endpoint.logout,options: Options(headers: {"Authorization": "Bearer $bearerToken"})
      );

      if (response.statusCode == 200) {
        
        StorageProvider.clearAll();
        Get.offAllNamed(Routes.LOGIN);
      } else {
      }
      loadingLogout(false);
    } on DioException catch (e) {
      loadingLogout(false);
      if (e.response != null) {
        if (e.response?.data != null) {
        }
      } else {
      }
    } catch (e) {
      loadingLogout(false);
    }
  }

  Future<void> _showMyDialog(final onPressed, String judul, String deskripsi, String nameButton) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF5F5F5),
          title: Text(
            'EpiQ! App',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
              color: const Color(0xFF41B54A),
            ),
          ),

          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(
                  height: 1,
                  child: ColoredBox(
                    color: Color(0xFFE5DADA),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  judul,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14.0
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  deskripsi,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: -0.2,
                      fontSize: 16.0
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: double.infinity,
              child: TextButton(
                autofocus: true,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF41B54A),
                  animationDuration: const  Duration(milliseconds: 300),
                ),
                onPressed: onPressed,
                child: Text(
                  nameButton,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
