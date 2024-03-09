import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Jogo da Velha'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.gamepad), text: 'Jogo'),
                Tab(icon: Icon(Icons.history), text: 'Histórico'),
                Tab(icon: Icon(Icons.settings), text: 'Configurações'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GameBoard(),
              HistoryPage(),
              Center(
                child: Text('Conteúdo da aba Configurações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  bool isPlayer1Turn = true;
  List<String> history = [];

  void resetBoard() {
    setState(() {
      board = [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ];
      isPlayer1Turn = true;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '') {
      setState(() {
        board[row][col] = isPlayer1Turn ? 'X' : 'O';
        isPlayer1Turn = !isPlayer1Turn;
      });
      if (checkWinner(row, col)) {
        String winner = isPlayer1Turn ? 'Jogador 2' : 'Jogador 1';
        setState(() {
          history.add('$winner ganhou!');
        });
        resetBoard();
      } else if (isBoardFull()) {
        setState(() {
          history.add('Empate!');
        });
        resetBoard();
      }
    }
  }

  bool checkWinner(int row, int col) {
    String player = board[row][col];
    // Verificar linha
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }
    // Verificar coluna
    if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
      return true;
    }
    // Verificar diagonais
    if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
        (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
      return true;
    }
    return false;
  }

  bool isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int j = 0; j < 3; j++)
                GestureDetector(
                  onTap: () => makeMove(i, j),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[i][j],
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ElevatedButton(
          onPressed: resetBoard,
          child: Text('Reiniciar'),
        ),
      ],
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(gameHistory[index]),
        );
      },
    );
  }
}

List<String> gameHistory = [];
