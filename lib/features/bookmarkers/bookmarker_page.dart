import 'package:flutter/material.dart';

class BookmarkerPage extends StatelessWidget {
  const BookmarkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy bookmarks data
    final List<String> bookmarks = [
      'Match 1: Team A vs Team B',
      'Match 2: Team C vs Team D',
      'Match 3: Team E vs Team F',
      'Match 4: Team G vs Team H',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMarker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(bookmarks[index]),
                trailing: const Icon(Icons.delete),
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
