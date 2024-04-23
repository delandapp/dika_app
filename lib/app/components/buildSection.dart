import 'package:digitallibrary/app/components/starRating.dart';
import 'package:digitallibrary/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitallibrary/app/routes/app_pages.dart';
import 'package:get/get.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final List<DataBuku> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                  height: 20,
                ),
            MyBuku(data: data[index].buku!),
            const SizedBox(height: 10,)
          ],
        );
      },
    );
  }
}

class MyBuku extends StatelessWidget {
  const MyBuku({super.key, required this.data});
  final List<Buku> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.5, mainAxisSpacing: 10, crossAxisSpacing: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : data[index].bukuID.toString()}),
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10,bottom: 5,top: 5),
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Color(0xFFE60023),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 150,
                      width: 120,
                      child: Image.network(data[index].coverBuku.toString(),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(data[index].judul.toString(),style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(data[index].deskripsi.toString(),maxLines: 3,overflow: TextOverflow.ellipsis),
                  ),
                  StarRating(
                    starColor: const Color(0xFFE60023),
                    rating: data[index].rating!.toDouble(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
