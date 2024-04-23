import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldUpdateProfile extends StatelessWidget {
  final bool obsureText;
  final TextEditingController controller;
  final String labelText;
  final Widget? preficIcon;
  final Widget? surficeIcon;

  const CustomTextFieldUpdateProfile({
    super.key,
    required this.obsureText,
    required this.controller,
    required this.labelText,
    this.preficIcon,
    this.surficeIcon,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundInput = Color(0xFFF3F8FF);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            labelText,
            style: GoogleFonts.montserrat(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
          ),

          const SizedBox(
            height: 10,
          ),

          TextFormField(
            controller: controller,
            obscureText: obsureText,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              color: Colors.black.withOpacity(0.90),
            ),
            decoration: InputDecoration(
                prefixIcon: preficIcon,
                fillColor: backgroundInput,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.10)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.10)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.10)),
                hintText: 'Masukan Email',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.50),
                )),
          ),
        ],
      ),
    );
  }
}
