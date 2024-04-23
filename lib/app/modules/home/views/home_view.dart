import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:digitallibrary/app/components/navProfil.dart';
import 'package:digitallibrary/app/data/constans/constans.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Library"),
        backgroundColor: const Color(0XFFB282F0),
      ),
      body: Container(
        color: kPrimaryColor,
        width: widthFullBody,
        height: heightFullBody,
        // width: widthFullBody,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navProfil(
                  title: "Selamat Datang",
                  image: "assets/images/profil.png",
                  icon: FontAwesomeIcons.bell,
                  subtitle: controller.username.value.toString(),
                ),
                SizedBox(
                  height: heightFullBody * 0.04,
                ),
                InkWell(
                  onTap: () => controller.dashboardController.changeTabIndex(1),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    width: widthFullBody * 0.8,
                    height: heightFullBody * 0.18,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                        child: Image.asset("assets/images/logo-buku.png"),
                  ),
                ),
                SizedBox(
                  height: heightFullBody * 0.04,
                ),
                InkWell(
                  onTap: () => controller.dashboardController.changeTabIndex(2),
                  child: Container(
                    width: widthFullBody * 0.8,
                    height: heightFullBody * 0.18,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                        child: Image.asset("assets/images/logo-pinjam.png"),
                  ),
                ),
                SizedBox(
                  height: heightFullBody * 0.04,
                ),
                InkWell(
                  onTap: () => controller.dashboardController.changeTabIndex(2),
                  child: Container(
                    width: widthFullBody * 0.8,
                    height: heightFullBody * 0.18,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                        child: Image.asset("assets/images/logo-tersimpan.png"),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
