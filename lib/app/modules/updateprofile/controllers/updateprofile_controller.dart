import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/constans/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

import '../../../data/models/response_profile.dart';

class UpdateprofileController extends GetxController with StateMixin{

var detailProfile = Rxn<DataProfile>();
final loading = false.obs;
final loadingLogout = false.obs;

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController teleponController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController namalengkapController = TextEditingController();

@override
void onInit() {
  super.onInit();
  getDataUser();
}

@override
void onReady() {
  super.onReady();
}

@override
void onClose() {
  super.onClose();
}

Future<void> getDataUser() async {
  detailProfile.value = null;
    change(null, status: RxStatus.loading());

    try {
     final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseDetailBuku = await ApiProvider.instance().get(Endpoint.profil,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseDetailBuku.statusCode == 200) {
        final ResponseProfile responseBuku = ResponseProfile.fromJson(responseDetailBuku.data);

        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          detailProfile(responseBuku.data);
          emailController.text = detailProfile.value!.email.toString();
          teleponController.text = detailProfile.value!.noTelp.toString();
          usernameController.text = detailProfile.value!.username.toString();
          namalengkapController.text = detailProfile.value!.namaLengkap.toString();
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
    if (e.response != null) {
      final responseData = e.response?.data;
      if (responseData != null) {
        final errorMessage = responseData['Message'] ?? "Unknown error";
        change(null, status: RxStatus.error(errorMessage));
      }
    } else {
      change(null, status: RxStatus.error(e.message));
    }
  } catch (e) {
    change(null, status: RxStatus.error(e.toString()));
  }
}

updateProfilePost() async {
  loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        var response = await ApiProvider.instance().put(Endpoint.updateProfile,
            data:
            {
              "Username" : usernameController.text.toString(),
              "NamaLengkap" : namalengkapController.text.toString(),
              "Email" : emailController.text.toString(),
              "NoTelepon" : teleponController.text.toString(),
            },options: Options(headers: {"Authorization": "Bearer $bearerToken"})
        );
        if (response.statusCode == 201) {
          final ResponseProfile responseBuku = ResponseProfile.fromJson(response.data);
          detailProfile(responseBuku.data);
          emailController.text = detailProfile.value!.email.toString();
          teleponController.text = detailProfile.value!.noTelp.toString();
          usernameController.text = detailProfile.value!.username.toString();
          namalengkapController.text = detailProfile.value!.namaLengkap.toString();
          change(null, status: RxStatus.success());
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.username, detailProfile.value!.username.toString());
          await StorageProvider.write(StorageKey.idUser, detailProfile.value!.id.toString());
          String username = usernameController.text.toString();
        _showMyDialog(
                (){
              getDataUser();
              Navigator.pop(Get.context!, 'OK');
            },
            "Update Profile Berhasil",
            "Update Profile Akun $username Berhasil",
            "Lanjut");
      } else {
        _showMyDialog(
                (){
              Navigator.pop(Get.context!, 'OK');
            },
            "Pemberitahuan",
            "Update Profile Gagal",
            "Ok"
        );
      }
    }
    loading(false);
  } on DioException catch (e) {
    loading(false);
    if (e.response != null) {
      if (e.response?.data != null) {
        _showMyDialog(
                (){
              Navigator.pop(Get.context!, 'OK');
            },
            "Pemberitahuan",
            "${e.response?.data?['Message']}",
            "Ok"
        );
      }
    } else {
      _showMyDialog(
            (){
          Navigator.pop(Get.context!, 'OK');
        },
        "Pemberitahuan",
        e.message ?? "",
        "OK",
      );
    }
  } catch (e) {
    loading(false);
    _showMyDialog(
          (){
        Navigator.pop(Get.context!, 'OK');
      },
      "Error",
      e.toString(),
      "OK",
    );
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
          'DIGITAL LIBRARY',
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
