// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class modified_text extends StatelessWidget {
  const modified_text(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}
