import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class RachaListPage extends StatefulWidget {
  const RachaListPage({super.key});

  @override
  State<RachaListPage> createState() => _RachaListPageState();
}

class _RachaListPageState extends State<RachaListPage> {
  List<String> players = [""];
  double initialValueToPlayersPerTeam = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista do Racha'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return TextField(
                    autofocus: true,
                    decoration: const InputDecoration(hintText: "Jogador(a)"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        players[index] = value;
                      });
                    },
                    onSubmitted: (value) {
                      String lastPlayerEntry = players[players.length - 1];

                      if (lastPlayerEntry.isNotEmpty) {
                        setState(() {
                          players.add("");
                        });
                      }
                    },
                  );
                },
              ),
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
              TextButton(
                  onPressed: () {
                    players.removeWhere((element) => element.isEmpty);

                    Navigator.pushNamed(context, AppRoutes.teams, arguments: {
                      "players": players,
                      "initialValueToPlayersPerTeam":
                          initialValueToPlayersPerTeam
                    });
                  },
                  child: const Text("Sortear Times")),
            ],
          ),
        ));
  }
}
