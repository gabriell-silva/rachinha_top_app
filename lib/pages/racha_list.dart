import 'package:flutter/material.dart';
import 'package:rachinha_top_app/widgets/players_form.dart';

class RachaListPage extends StatefulWidget {
  const RachaListPage({super.key});

  @override
  State<RachaListPage> createState() => _RachaListPageState();
}

class _RachaListPageState extends State<RachaListPage> {
  double initialValueToPlayersPerTeam = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista do Racha'),
      ),
      body: Column(
        children: [
          const PlayersForm(),
          Column(
            children: [
              const Text("Jogadores por time"),
              Slider(
                value: initialValueToPlayersPerTeam,
                min: 1,
                max: 11,
                divisions: 10,
                label: initialValueToPlayersPerTeam.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    initialValueToPlayersPerTeam = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
