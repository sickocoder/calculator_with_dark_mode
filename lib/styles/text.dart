import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle tabText = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle unselectedTabText = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle operationAfterResult = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle result = GoogleFonts.poppins(
    fontSize: 72,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle numberPadSize = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle numberPadSizeRed = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );
}
