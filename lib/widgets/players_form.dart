import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class PlayersForm extends StatefulWidget {
  const PlayersForm({super.key});

  @override
  State<PlayersForm> createState() => PlayersFormState();
}

class PlayersFormState extends State<PlayersForm> {
  List<String> players = [""];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      TextButton(
          onPressed: () {
            players.removeWhere((element) => element.isEmpty);

            Navigator.pushNamed(context, AppRoutes.teams, arguments: players);
          },
          child: const Text("Sortear Times")),
    ]);
  }
}
