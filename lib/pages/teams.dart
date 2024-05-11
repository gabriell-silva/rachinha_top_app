import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> playersListObject =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final double initialValueToPlayersPerTeam =
        playersListObject["initialValueToPlayersPerTeam"] as double;

    final List<String> players = playersListObject["players"] as List<String>;

    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                child: Column(
                  children: [Text("Time $index"), Text(players[index])],
                ),
              );
            }));
  }
}
