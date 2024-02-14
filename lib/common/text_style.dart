import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
      fontSize: fontSize.sp, color: color, fontWeight: fontWeight);
}
