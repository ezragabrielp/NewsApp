import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/coding_bg.jpg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4.5,
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/87604313?v=4'),
                  ),
                )
              ]),
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Ezra Gabriel",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Mobile Flutter Developer",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    onTap: () async {
                      String url = "https://github.com/ezragabrielp";
                      var urlLauncher = await canLaunch(url);
                      if (urlLauncher) {
                        await launch(url);
                      } else {
                        print("URL can't be launched.");
                      }
                    },
                    child: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.blueGrey,
                      size: 32,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String url = "https://www.linkedin.com/in/ezra-gabriel/";
                      var urlLauncher = await canLaunch(url);
                      if (urlLauncher) {
                        await launch(url);
                      } else {
                        print("URL can't be launched.");
                      }
                    },
                    child: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blueGrey,
                      size: 32,
                    ),
                  ),
                  InkWell(
                    onTap: () async => await launch(
                        "https://wa.me/6281384404741?text=Hello Ezra"),
                    child: const Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.blueGrey,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I am a Computer Science graduate from Gunadarma University with a 3.23 GPA who have a high interest in Mobile Development with a robust problem-solving skill, a strong team player and have exceptional organizational skills.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
