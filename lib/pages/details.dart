// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utils/text.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.image,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.release_date})
      : super(key: key);
  final String image;
  final String title;
  final String overview;
  final String popularity;
  final String release_date;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const modified_text(
            text: 'Details',
            color: Colors.green,
            size: 14,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              // width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            modified_text(text: title ?? 'N/A', color: Colors.white, size: 20),
            const SizedBox(height: 10),
            Text(
              'Overview',
              style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
            ),
            modified_text(
                text: overview ?? 'N/A', color: Colors.white, size: 16),
            const SizedBox(height: 10),
            Text(
              'Popularity',
              style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
            ),
            modified_text(
                text: popularity ?? 'N/A', color: Colors.white, size: 16),
            const SizedBox(height: 10),
            Text(
              'Release Date',
              style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
            ),
            modified_text(
                text: release_date ?? 'N/A', color: Colors.white, size: 16),
          ],
        ))));
  }
}
