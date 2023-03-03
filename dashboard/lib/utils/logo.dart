import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget logo() {
  return Container(
    child: AutoSizeText(
      "Dashboard",
      style: GoogleFonts.quicksand(
          color: Colors.white, fontSize: 60, fontWeight: FontWeight.w300),
    ),
  );
}