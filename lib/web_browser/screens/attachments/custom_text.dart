import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  const CustomText(
      {required this.text, this.textAlign, this.textColor, super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      style: GoogleFonts.robotoSerif(
        color: textColor,
      ),
    );
  }
}
