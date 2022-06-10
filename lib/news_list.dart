import 'dart:convert';
import 'dart:ffi';
import 'package:beritaku/news_detail.dart';
import 'package:beritaku/news_widget.dart';
import 'package:beritaku/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import 'news_data.dart';

class newsList extends StatefulWidget {
  const newsList({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<newsList> createState() => _newsListState();
}

// ignore: camel_case_types
class _newsListState extends State<newsList> {
  bool isLoading = false;
  List<News> _list = <News>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
    _showNews();
  }

  void _showNews() async {
    final news = await _fetchnews();
    setState(() {
      _list = news;
    });
  }

  Future<List<News>> _fetchnews() async {
    String categories;
    if (widget.category == "bisnis") {
      categories = "business";
    } else if (widget.category == "olahraga") {
      categories = "sports";
    } else if (widget.category == "hiburan") {
      categories = "entertainment";
    } else if (widget.category == "kesehatan") {
      categories = "health";
    } else if (widget.category == "sains") {
      categories = "science";
    } else {
      categories = "technology";
    }
    Uri newsUrl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=id&category=${categories}&apiKey=d1f577d3cda04dac810825973d358f04");
    final response = await http.get(newsUrl);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception("Failed to load News!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category.toUpperCase(),
            style: const TextStyle(
                color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          // ignore: prefer_const_constructors
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          //   // ignore: prefer_const_constructors
          iconTheme: const IconThemeData(color: Colors.blueGrey),
        ),
        body: Stack(
          children: [
            isLoading
                ? NewsWidget(newses: _list)
                : ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ShimmerList();
                    })
          ],
        ));
  }
}
