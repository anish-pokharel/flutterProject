import 'package:flutter/material.dart';

class AccumulatorTipsPage extends StatelessWidget {
  const AccumulatorTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy accumulator tips data
    final List<String> tips = [
      'Accumulator Tip 1: Team A to win against Team B',
      'Accumulator Tip 2: Team C and Team D to draw',
      'Accumulator Tip 3: Over 2.5 goals in Team E vs Team F',
      'Accumulator Tip 4: Team G to win with both teams scoring',
      'Accumulator Tip 5: Team H to win and under 3.5 goals',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Accumulator Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(tips[index]),
                trailing: const Icon(Icons.check),
                onTap: () {
                  // Action on tap (if needed)
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
