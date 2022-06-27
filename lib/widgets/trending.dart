// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:technical_exam/pages/details.dart';
import 'package:technical_exam/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const modified_text(
            text: "Trending Movies", color: Colors.white, size: 26),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                image: 'https://image.tmdb.org/t/p/w500/' +
                                    trending[index]['poster_path'],
                                title: trending[index]['title'],
                                overview: trending[index]['overview'],
                                popularity:
                                    trending[index]['popularity'].toString(),
                                release_date:
                                    trending[index]['release_date'].toString(),
                              )),
                    );
                  },
                  child: SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['poster_path']))),
                          ),
                          Container(
                              child: modified_text(
                                  text: trending[index]['title'] ?? 'Loading',
                                  size: 16,
                                  color: Colors.white))
                        ],
                      )),
                );
              }),
        ),
      ]),
    );
  }
}
