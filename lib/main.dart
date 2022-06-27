import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:technical_exam/utils/text.dart';
import 'package:technical_exam/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List trendingmovies = [];
  final String apikey = 'e7f3b3a650af4d956b192a337958b1c4';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2YzYjNhNjUwYWY0ZDk1NmIxOTJhMzM3OTU4YjFjNCIsInN1YiI6IjYyYjkzNzlkYTYxZGUxMDNiNTY5OGE0NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iMwnnRwM5kpYwT2KeBim3pGiCc-De4xcJbKK2yXDwLk';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const modified_text(
          text: 'Flutter Movie App',
          color: Colors.green,
          size: 14,
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
