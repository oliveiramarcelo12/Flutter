import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Player {
  final String name;
  final String nationality;
  final String club;
  final String imageUrl;

  Player({
    required this.name,
    required this.nationality,
    required this.club,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  final List<Player> players = [
    Player(
      name: 'Pelé',
      nationality: 'Brasil',
      club: 'Santos, New York Cosmos',
      imageUrl: 'assets/pele.jpg',
    ),
    Player(
      name: 'Cristiano Ronaldo',
      nationality: 'Portugal',
      club: 'Sporting, Manchester United, Real Madrid, Juventus, Al Nasser',
      imageUrl: 'assets/cristiano_ronaldo.jpg',
    ),
    Player(
      name: 'Lionel Messi',
      nationality: 'Argentina',
      club: 'Barcelona, Paris Saint-Germain, Inter Miami',
      imageUrl: 'assets/lionel_messi.jpg',
    ),
    Player(
      name: 'Diego Maradona',
      nationality: 'Argentina',
      club: 'Boca Juniors, Barcelona, Napoli',
      imageUrl: 'assets/diego_maradona.jpg',
    ),
    Player(
      name: 'Zinedine Zidane',
      nationality: 'França',
      club: 'AS Cannes, Bordeaux, Juventus, Real Madrid',
      imageUrl: 'assets/zinedine_zidane.jpg',
    ),
    Player(
      name: 'Ronaldo Nazário',
      nationality: 'Brasil',
      club: 'Cruzeiro, PSV, Barcelona, Inter Milan, Real Madrid, AC Milan, Corinthians',
      imageUrl: 'assets/ronaldo_nazario.jpg',
    ),
    Player(
      name: 'Franz Beckenbauer',
      nationality: 'Alemanha',
      club: 'Bayern Munich, New York Cosmos, Hamburger SV',
      imageUrl: 'assets/franz_beckenbauer.jpg',
    ),
    Player(
      name: 'Johan Cruyff',
      nationality: 'Holanda',
      club: 'Ajax, Barcelona, Los Angeles Aztecs, Washington Diplomats, Levante',
      imageUrl: 'assets/johan_cruyff.jpg',
    ),
    Player(
      name: 'Roberto Baggio',
      nationality: 'Itália',
      club: 'Vicenza, Fiorentina, Juventus, AC Milan, Bologna, Inter Milan',
      imageUrl: 'assets/roberto_baggio.jpg',
    ),
    Player(
      name: 'George Best',
      nationality: 'Irlanda do Norte',
      club: 'Manchester United, Los Angeles Aztecs, Fulham, Bournemouth, Hibernian, San Jose Earthquakes',
      imageUrl: 'assets/george_best.jpg',
    ),
    Player(
      name: 'Ferenc Puskás',
      nationality: 'Hungria',
      club: 'Budapest Honvéd, Real Madrid, Vasas SC',
      imageUrl: 'assets/ferenc_puskas.jpg',
    ),
    Player(
      name: 'Michel Platini',
      nationality: 'França',
      club: 'Nancy, Saint-Étienne, Juventus',
      imageUrl: 'assets/michel_platini.jpg',
    ),
    Player(
      name: 'Alfredo Di Stéfano',
      nationality: 'Argentina',
      club: 'River Plate, Millonarios, Real Madrid, Espanyol',
      imageUrl: 'assets/alfredo_di_stefano.jpg',
    ),
    // Adicione mais jogadores conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Melhores Jogadores de Futebol'),
        ),
        body: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: ClipOval(
                    child: Image.asset(
                      player.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    player.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    '${player.nationality}, ${player.club}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
