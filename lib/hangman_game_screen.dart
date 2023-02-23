import 'package:flutter/material.dart';
import 'package:senior_research_app_new/ui/colors.dart';
import 'package:senior_research_app_new/ui/widget/figure_image.dart';
import 'package:senior_research_app_new/ui/widget/letter.dart';
import 'package:senior_research_app_new/utils/game.dart';
import 'lose_screen.dart';
import 'win_screen.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //choosing the game word
  String word = "Flutter".toUpperCase();
  //find unique letters in a string

  //Create a list that contains the Alphabet, or you can just copy and paste it
  int correct = 0;
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                //let's make the figure widget
                //let's add the images to the asset folder
                //Okey now we will create a Game class
                //Now the figure will be built according to the number of tries
                figureImage(Game.tries >= 0, "assets/images/hang.png"),
                figureImage(Game.tries >= 1, "assets/images/head.png"),
                figureImage(Game.tries >= 2, "assets/images/body.png"),
                figureImage(Game.tries >= 3, "assets/images/ra.png"),
                figureImage(Game.tries >= 4, "assets/images/la.png"),
                figureImage(Game.tries >= 5, "assets/images/rl.png"),
                figureImage(Game.tries >= 6, "assets/images/ll.png"),
              ],
            ),
          ),

          //Now we will build the Hidden word widget
          //now let's go back to the Game class and add
          // a new variable to store the selected character
          /* and check if it's on the word */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          //Now let's build the Game keyboard
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                              if (Game.tries >= 6) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoseScreen()),
                                );
                              }
                            } else {
                              correct++;

                              //fix
                              var sampleStringAsList = word.split('');
                              var sampleStringAsSet =
                                  sampleStringAsList.toSet();
                              int characters = 0;
                              characters = sampleStringAsSet.length;

                              print(correct);
                              print(characters);
                              if (correct == characters) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WinScreen()),
                                );
                              }
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
