import 'package:flutter/material.dart';

import 'hangman_game_screen.dart';
import 'initial_homepage.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  _WinScreenState createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Text("You win"),
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
