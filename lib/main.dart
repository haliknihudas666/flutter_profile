import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://nicolei.games/_next/image?url=%2Fassets%2Fnicolei.jpg&w=1920&q=75',
                imageBuilder: (context, image) {
                  return CircleAvatar(
                    radius: 100,
                    foregroundImage: image,
                  );
                },
              ),
              const Text(
                'Nicolei Esperida',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  thickness: 5,
                  color: Colors.white,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 25,
                ),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.amber[600]),
                  onTap: () async {
                    if (!await launch('tel:09121231234')) {
                      throw 'Could not launch website';
                    }
                  },
                  title: const Text(
                    '+63 9121231234',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ListTile(
                  leading: Icon(Icons.mail, color: Colors.amber[600]),
                  onTap: () async {
                    if (!await launch('mailto:important@nicolei.games')) {
                      throw 'Could not launch website';
                    }
                  },
                  title: const Text(
                    'important@nicolei.games',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
