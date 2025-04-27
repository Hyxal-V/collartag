import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFE5C890);
const Color secondaryColor = Color(0xFFEF9F76);
const Color textColor = Color(0xff252525);

const Color correctColor = Color(0xFF07DA8C);
final headText = GoogleFonts.inter(
    textStyle:
        TextStyle(color: textColor, fontSize: 60, fontWeight: FontWeight.w900));
final subHeadText = GoogleFonts.alexandria(
    textStyle:
        TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w400));
final paraText = GoogleFonts.alexandria(
    textStyle:
        TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.w400));

final paraBoldText = GoogleFonts.alexandria(
    textStyle:
        TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.w900));

final headTitleText = GoogleFonts.alexandria(
    textStyle:
        TextStyle(color: textColor, fontSize: 40, fontWeight: FontWeight.w900));
final downloadButton = ElevatedButton.styleFrom(
  backgroundColor: textColor, // Background color
  foregroundColor: primaryColor, // Text color
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero, // No rounded corners
  ),
);
final inputTextField = TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: const Color.fromARGB(255, 0, 0, 0));
final downloadButtonText = TextStyle(fontSize: 30);

Color pickRandomColor() {
  List<Color> _colors = [
    primaryColor,
    Color(0xFF07DA8C),
    Color(0xFFF9CEC3),
    Color(0xFFF43E5C),
    Color(0xFFFAB795)
  ];

  return _colors[Random().nextInt(_colors.length)];
}
