import 'package:beritaku/news_data.dart';
import 'package:flutter/material.dart';

import 'news_detail.dart';

class NewsWidget extends StatelessWidget {
  final List<News> newses;

  const NewsWidget({Key? key, required this.newses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newses.length,
        itemBuilder: (context, index) {
          final news = newses[index];
          final splitDateTime = news.publishedAt!.split('T');
          final resultSplit = splitDateTime.first;

          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => NewsDetail(
                            news: news,
                          )));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(10),
              // ignore: sort_child_properties_last
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: news.image != null
                            ? Image.network(
                                news.image!,
                                fit: BoxFit.fill,
                                width: 50,
                                height: 50,
                              )
                            : Image.asset(
                                "assets/images/anonymous.png",
                                fit: BoxFit.fill,
                                width: 50,
                                height: 50,
                              ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                maxLines: 2,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    news.author == null
                                        ? "Anonim"
                                        : news.author!,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Text(
                      resultSplit.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          );
        });
  }
}
