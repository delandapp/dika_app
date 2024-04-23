import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitallibrary/app/components/myInput.dart';
import 'package:digitallibrary/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthfullbody = MediaQuery.of(context).size.width;
    final heightfullbody = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: widthfullbody * 0.1, vertical: heightfullbody * 0.1),
          width: widthfullbody,
          height: heightfullbody,
          decoration: const BoxDecoration(
            color: Color(0XFFE2DFDF),
          ),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColoredBox(
                  color: const Color(0xFFFFFFFF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightfullbody * 0.02,
                      ),
                      Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily:
                                  GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                      .fontFamily,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: heightfullbody * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Username",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                                  GoogleFonts.baloo2(fontWeight: FontWeight.normal)
                                      .fontFamily,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: myInput(
                          validator: controller.validator,
                          controller: controller,
                          controllerField: controller.email,
                          hintText: "Email",
                          prefixIcon: FontAwesomeIcons.user,
                        ),
                      ),
                      SizedBox(
                        height: heightfullbody * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                                  GoogleFonts.baloo2(fontWeight: FontWeight.normal)
                                      .fontFamily,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: myInput(
                          validator: controller.validatorPassword,
                          controller: controller,
                          controllerField: controller.password,
                          hintText: "Password",
                          isPassword: true,
                          prefixIcon: FontAwesomeIcons.key,
                        ),
                      ),
                      SizedBox(
                        height: heightfullbody * 0.06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => ElevatedButton(
                              onPressed: () {
                                controller.login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE6342A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.01),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.1,
                                    vertical:
                                        MediaQuery.of(context).size.height * 0.015),
                              ),
                              child: controller.loading.value
                                  ? const CircularProgressIndicator()
                                  : Text('LOGIN',
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.baloo2(
                                                  fontWeight: FontWeight.bold)
                                              .fontFamily)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF36A9E0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.01),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.1,
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.015),
                            ),
                            child: Text('REGISTER',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heightfullbody * 0.06,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
