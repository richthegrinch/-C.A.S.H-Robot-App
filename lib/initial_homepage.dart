import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior_research_app_new/bluetooth.dart';

import 'brain_homepage.dart';
import 'health_homepage.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({Key? key, required this.title, required this.username})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          selectionColor: Colors.black87,
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/orangebunnyback.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 300,
              height: 20,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFfc6e03)),
                  backgroundColor: Color(0xffD6D6D6),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Progress Bar",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Welcome $username',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Where would you like to go?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xFFd7ff91),
                        textStyle: const TextStyle(fontSize: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        print("healthy");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HealthPage()),
                        );
                      },
                      child: const Text(
                        "Health",
                        style: TextStyle(color: Color(0xFF393d3d)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xFFff91eb),
                        textStyle: const TextStyle(fontSize: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        print("brainy");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BrainPage()),
                        );
                      },
                      child: const Text(
                        "Brain Challenges",
                        style: TextStyle(color: Color(0xFF393d3d)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xFF91fbff),
                        textStyle: const TextStyle(fontSize: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        print("lovely");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BluetoothApp()),
                        );
                      },
                      child: const Text(
                        "Interact with Bunny!",
                        style: TextStyle(color: Color(0xFF393d3d)),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Tasks Left:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        )),
      ),
    );
  }
}
