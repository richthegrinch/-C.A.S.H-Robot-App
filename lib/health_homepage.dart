import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final int cupsOfWater = 0;

  String hoursofSleep = "Not entered";

  var sleepOptions = [
    "Not entered",
    "0-3",
    "3-5",
    "5-6",
    "7-9",
    "9-11",
    "more than 11",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health Page'),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/health_background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              const Text(
                "How many hours did you sleep?",
              ),
              DropdownButton(
                value: hoursofSleep,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: sleepOptions.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    hoursofSleep = newValue!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate back to first route when tapped.
                },
                child: const Text('Go back!'),
              ),
            ],
          ),
        ));
  }
}
