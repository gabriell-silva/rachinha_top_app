import 'package:flutter/material.dart';
import 'package:rachinha_top_app/widgets/players_form.dart';

class RachaListPage extends StatefulWidget {
  const RachaListPage({super.key});

  @override
  State<RachaListPage> createState() => _RachaListPageState();
}

class _RachaListPageState extends State<RachaListPage> {
  double currentSliderValue = 4;

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
                value: currentSliderValue,
                min: 1,
                max: 11,
                divisions: 10,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
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
