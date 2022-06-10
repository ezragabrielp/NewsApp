import 'dart:convert';
import 'package:beritaku/widgets/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:beritaku/news_data.dart';
import 'package:beritaku/news_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../news_detail.dart';

// ignore: camel_case_types
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// ignore: camel_case_types
class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<News> _listNews = <News>[];

  Future<List<News>> _fetchPopularNews() async {
    Uri newsUrl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=d1f577d3cda04dac810825973d358f04");
    final response = await http.get(newsUrl);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception("Failed To Load News!");
    }
  }

  void _showPopularNews() async {
    final news = await _fetchPopularNews();
    setState(() {
      _listNews = news;
    });
  }

  @override
  void initState() {
    _showPopularNews();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 20, left: 20),
              // ignore: prefer_const_constructors
              child: Text("Berita Terbaru",
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Stack(children: [
              isLoading
                  ? CarouselSlider.builder(
                      itemCount: _listNews.length,
                      itemBuilder: (context, int itemIndex, int pageIndex) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                    builder: (context) => NewsDetail(
                                          news: _listNews[itemIndex],
                                        )));
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: _listNews[itemIndex].image != null
                                      ? Image.network(
                                          _listNews[itemIndex].image!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "assets/images/anonymous.png"),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      _listNews[itemIndex].title != null
                                          ? _listNews[itemIndex].title!
                                          : "Tidak Ada Judul",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  : const ShimmerSlider()
            ]),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 20, left: 20, top: 10),
              // ignore: prefer_const_constructors
              child: Text("Pilih Kategori Berita",
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // ignore: prefer_const_constructors
                            builder: (context) => newsList(
                                  category: "bisnis",
                                )));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    // ignore: prefer_const_constructors
                                    image: AssetImage(
                                        "assets/images/business_bg.jpg"),
                                    fit: BoxFit.fill,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.darken))),
                            width: 150,
                            height: 150,
                            // ignore: prefer_const_constructors
                            child: Center(
                              // ignore: prefer_const_constructors
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Icons.business,
                                    color: Colors.white,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    'Bisnis',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const newsList(category: "olahraga")));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    // ignore: prefer_const_constructors
                                    image: AssetImage(
                                        "assets/images/sport_bg.jpg"),
                                    fit: BoxFit.fill,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.2),
                                        BlendMode.darken))),
                            width: 150,
                            height: 150,
                            // ignore: prefer_const_constructors
                            child: Center(
                              // ignore: prefer_const_constructors
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Icons.sports_soccer,
                                    color: Colors.white,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    'Olahraga',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const newsList(category: "hiburan")));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image: AssetImage(
                                    "assets/images/entertainment_bg.jpg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.1),
                                    BlendMode.darken))),
                        width: 150,
                        height: 150,
                        // ignore: prefer_const_constructors
                        child: Center(
                          // ignore: prefer_const_constructors
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Hiburan',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const newsList(category: "teknologi")));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image: AssetImage("assets/images/tech_bg.jpg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.darken))),
                        // ignore: prefer_const_constructors
                        child: Center(
                          // ignore: prefer_const_constructors
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.computer,
                                color: Colors.white,
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Teknologi',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const newsList(category: "kesehatan")));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image:
                                    AssetImage("assets/images/health_bg.jpg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.darken))),
                        width: 150,
                        height: 150,
                        // ignore: prefer_const_constructors
                        child: Center(
                          // ignore: prefer_const_constructors
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.emergency,
                                color: Colors.white,
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Kesehatan',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const newsList(category: "sains")));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image:
                                    AssetImage("assets/images/science_bg.jpg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.darken))),
                        // ignore: prefer_const_constructors
                        child: Center(
                          // ignore: prefer_const_constructors
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.science,
                                color: Colors.white,
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Sains',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
