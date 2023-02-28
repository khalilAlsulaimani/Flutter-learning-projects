import 'package:flutter/material.dart';

import 'game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';

  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Turn on/off two player mode ',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitched = newValue;
                });
              },
            ), //change player
            Text(
              'It\'s $activePlayer Turn'.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ), // player turn

            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: List.generate(
                    9,
                    (index) => InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: gameOver ? null : () => _onTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).shadowColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: Text(
                                Player.playerX.contains(index)
                                    ? 'X'
                                    : Player.playerO.contains(index)
                                        ? 'O'
                                        : ' ',
                                style: TextStyle(
                                    color: Player.playerX.contains(index)
                                        ? Colors.blue
                                        : Colors.pink,
                                    fontSize: 50),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.playerO = [];
                  Player.playerX = [];
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                  game = Game();
                  isSwitched = false;
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text("Restart the game"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ), //restart game
            //result
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {
    if ((!Player.playerX.contains(index) || Player.playerX.isEmpty) &&
        (!Player.playerO.contains(index) || Player.playerO.isEmpty)) {
      game.playGame(index, activePlayer);
      updateState();

      if (!isSwitched && !gameOver) {
        await game.autoPlay(activePlayer);
      }
    }
  }

  void updateState() {
    setState(() {
      turn++;
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != '') {
        gameOver = true;
        result = "$winnerPlayer Is The Winner";
      } else if (!gameOver && turn == 9) {
        result = 'its a draw';
      }
    });
  }
}
