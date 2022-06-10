import 'package:beritaku/news_data.dart';
import 'package:beritaku/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// ignore: camel_case_types
class NewsDetail extends StatefulWidget {
  final News news;

  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

// ignore: camel_case_types
class _NewsDetailState extends State<NewsDetail> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final splitDateTime = widget.news.publishedAt!.split('T');
    final resultSplit = splitDateTime.first;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Berita",
            // ignore: unnecessary_const
            style: const TextStyle(color: Colors.blueGrey),
          ),
          iconTheme: const IconThemeData(color: Colors.blueGrey),
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  _onShare(context, widget.news.url!);
                },
                child: const Icon(Icons.share),
              ),
            )
          ]),
      body: Stack(children: [
        isLoading
            ? Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                // ignore: sort_child_properties_last
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: widget.news.image != null
                          ? Image.network(widget.news.image!,
                              fit: BoxFit.contain)
                          : Image.asset("assets/images/anonymous.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultSplit.toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.news.title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.news.author == null
                              ? "Anonim"
                              : widget.news.author!,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        widget.news.content == null
                            ? "Tidak Tersedia"
                            : widget.news.content!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            : const ShimmerDetail()
      ]),
    );
  }

  void _onShare(BuildContext context, String text) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(text,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
