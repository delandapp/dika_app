import 'package:digitallibrary/app/components/buildSection.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pinjam Buku"),
        
        backgroundColor: const Color(0XFFB282F0),
      ),
      body: Container(
        color: Colors.white,
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: buildSection(data: state!)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
