import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.player}) : super(key: key);

  final bool player;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late bool turn = widget.player;

  final List<bool?> board = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  void onButtonClicked(int position) {
    if (board[position] != null) {
      return;
    }

    setState(() {
      board[position] = turn;
      turn = !turn;
    });

    checkGameEnd();
  }

  void checkGameEnd() {
    if (board[0] == board[1] && board[1] == board[2] && board[0] != null) {
      showWonDialog();
    } else if (board[3] == board[4] &&
        board[4] == board[5] &&
        board[3] != null) {
      showWonDialog();
    } else if (board[6] == board[7] &&
        board[7] == board[8] &&
        board[6] != null) {
      showWonDialog();
    } else if (board[0] == board[3] &&
        board[3] == board[6] &&
        board[0] != null) {
      showWonDialog();
    } else if (board[1] == board[4] &&
        board[4] == board[7] &&
        board[1] != null) {
      showWonDialog();
    } else if (board[2] == board[5] &&
        board[5] == board[8] &&
        board[2] != null) {
      showWonDialog();
    } else if (board[0] == board[4] &&
        board[4] == board[8] &&
        board[2] != null) {
      showWonDialog();
    } else if (board[2] == board[4] &&
        board[4] == board[6] &&
        board[2] != null) {
      showWonDialog();
    }

    if (board[0] != null &&
        board[1] != null &&
        board[2] != null &&
        board[3] != null &&
        board[4] != null &&
        board[5] != null &&
        board[6] != null &&
        board[7] != null &&
        board[8] != null) {
      showTieDialog();
    }
  }

  void showTieDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Tic Tac Toe"),
              content: Text("Game is draw"),
            )).then((value) => Navigator.of(context).pop());
  }

  void showWonDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Tic Tac Toe"),
              content: Text("${turn ? 'X' : 'O'} has won"),
            )).then((value) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [
              const Color(0xFF07C7F9),
              const Color(0xFF3189DC),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Player ${turn ? 'O' : 'X'}'s Turn",
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              children: [
                GridBox(
                  right: true,
                  bottom: true,
                  onClicked: () => onButtonClicked(0),
                  player: board[0],
                ),
                GridBox(
                  left: true,
                  bottom: true,
                  right: true,
                  onClicked: () => onButtonClicked(1),
                  player: board[1],
                ),
                GridBox(
                  left: true,
                  bottom: true,
                  onClicked: () => onButtonClicked(2),
                  player: board[2],
                ),
                GridBox(
                  right: true,
                  bottom: true,
                  onClicked: () => onButtonClicked(3),
                  player: board[3],
                ),
                GridBox(
                  top: true,
                  right: true,
                  bottom: true,
                  left: true,
                  onClicked: () => onButtonClicked(4),
                  player: board[4],
                ),
                GridBox(
                  left: true,
                  bottom: true,
                  onClicked: () => onButtonClicked(5),
                  player: board[5],
                ),
                GridBox(
                  right: true,
                  top: true,
                  onClicked: () => onButtonClicked(6),
                  player: board[6],
                ),
                GridBox(
                  right: true,
                  top: true,
                  left: true,
                  onClicked: () => onButtonClicked(7),
                  player: board[7],
                ),
                GridBox(
                  left: true,
                  top: true,
                  onClicked: () => onButtonClicked(8),
                  player: board[8],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class GridBox extends StatelessWidget {
  const GridBox({
    Key? key,
    this.left = false,
    this.top = false,
    this.right = false,
    this.bottom = false,
    required this.onClicked,
    required this.player,
  }) : super(key: key);

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final bool? player;

  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onClicked(),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              right: right
                  ? BorderSide(color: Colors.white, width: 2)
                  : BorderSide.none,
              left: left
                  ? BorderSide(color: Colors.white, width: 2)
                  : BorderSide.none,
              top: top
                  ? BorderSide(color: Colors.white, width: 2)
                  : BorderSide.none,
              bottom: bottom
                  ? BorderSide(color: Colors.white, width: 2)
                  : BorderSide.none,
            ),
          ),
          child: player != null
              ? SvgPicture.asset("assets/${player! ? 'O' : 'X'}.svg")
              : SizedBox.shrink(),
        ));
  }
}
