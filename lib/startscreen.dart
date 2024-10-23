import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:tictactoe/game_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void onStartButtonPressed(bool player) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GameScreen(
              player: player,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/background.png",
          fit: BoxFit.fill,
          key: Key("value"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "TIC-TAC-TOE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 56,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "Pick who goes first?",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => onStartButtonPressed(true),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: SvgPicture.asset(
                      "assets/O.svg",
                      width: 96,
                      height: 96,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () => onStartButtonPressed(false),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: SvgPicture.asset(
                      "assets/X.svg",
                      width: 96,
                      height: 96,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ],
    )));
  }
}
