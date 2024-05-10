import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final players = ModalRoute.of(context)!.settings.arguments as List<String>;
    
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                child: Center(child: Text(players[index])),
              );
            }));
  }
}
