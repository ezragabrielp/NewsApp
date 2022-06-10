import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        decoration: ShapeDecoration(
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        margin: const EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 20),
        padding: const EdgeInsets.all(10),
        height: 80,
      ),
    );
  }
}

class ShimmerSlider extends StatelessWidget {
  const ShimmerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(
            left: 45,
            right: 45,
          ),
          padding: const EdgeInsets.all(10),
          height: 200,
          decoration: ShapeDecoration(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ));
  }
}

class ShimmerDetail extends StatelessWidget {
  const ShimmerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: ListView(
        children: [
          Container(
              // ignore: prefer_const_constructors
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
              ),
              height: 210,
              decoration: ShapeDecoration(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
          Container(
              // ignore: prefer_const_constructors
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
              ),
              height: 100,
              decoration: ShapeDecoration(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
          Container(
              // ignore: prefer_const_constructors
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
              ),
              height: 300,
              decoration: ShapeDecoration(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
        ],
      ),
    );
  }
}

class ShimmerCardList extends StatelessWidget {
  const ShimmerCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              color: Colors.blueGrey,
              height: 20,
            ),
            Container(
              color: Colors.blueGrey,
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 20,
              color: Colors.blueGrey,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              height: 20,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
