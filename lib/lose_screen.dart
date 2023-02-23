import 'package:flutter/material.dart';

import 'hangman_game_screen.dart';
import 'initial_homepage.dart';

class LoseScreen extends StatefulWidget {
  const LoseScreen({Key? key}) : super(key: key);

  @override
  _LoseScreenState createState() => _LoseScreenState();
}

class _LoseScreenState extends State<LoseScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Text("You lose"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: const Color(0xFFd95d6a),
              textStyle: const TextStyle(fontSize: 30),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeApp()),
              );
            },
            child: const Text('Try Again?'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: const Color(0xFFd95d6a),
              textStyle: const TextStyle(fontSize: 30),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          title: 'BunnyLyfe Home',
                          username: "name",
                        )),
              );
            },
            child: const Text('Home'),
          )
        ]));
  }
}
