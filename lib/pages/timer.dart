import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CountDownTimerPage(),
    );
  }
}

class CountDownTimerPage extends StatefulWidget {
  const CountDownTimerPage({super.key});

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const CountDownTimerPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CountDownTimerPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(8 * 60),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// Display stop watch time
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: _stopWatchTimer.rawTime.value,
          builder: (context, snap) {
            final value = snap.data!;
            final displayTime = StopWatchTimer.getDisplayTime(value,
                hours: false, milliSecond: false);
            return Column(
              children: <Widget>[
                Text(
                  displayTime,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),

        /// Button
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: _stopWatchTimer.onStartTimer,
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: _stopWatchTimer.onStopTimer,
                    child: const Text(
                      'Stop',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: _stopWatchTimer.onResetTimer,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  onPressed: () {
                    _stopWatchTimer.setPresetMinuteTime(1);
                  },
                  child: const Text(
                    '+1 Minuto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  onPressed: () {
                    _stopWatchTimer.setPresetMinuteTime(-1);
                  },
                  child: const Text(
                    '-1 Minuto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
