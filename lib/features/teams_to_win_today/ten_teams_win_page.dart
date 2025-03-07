import 'package:flutter/material.dart';

class TenTeamsWinPage extends StatelessWidget {
  const TenTeamsWinPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy teams data
    final List<String> teams = [
      'Team A vs Team B - Odds: 2.0',
      'Team C vs Team D - Odds: 1.5',
      'Team E vs Team F - Odds: 3.2',
      'Team G vs Team H - Odds: 1.8',
      'Team I vs Team J - Odds: 1.6',
      'Team K vs Team L - Odds: 2.5',
      'Team M vs Team N - Odds: 2.8',
      'Team O vs Team P - Odds: 1.7',
      'Team Q vs Team R - Odds: 2.2',
      'Team S vs Team T - Odds: 1.9',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('10 Teams To WIN Today'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(teams[index]),
                trailing: const Icon(Icons.star),
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
