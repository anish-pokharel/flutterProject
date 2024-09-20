import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Today Football Prediction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today Football Prediction'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Today Football Prediction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Today Football Accumulator Tips'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('10 Teams To WIN Today'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('BookMarker'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              border: TableBorder.all(color: Colors.grey.shade400),
              columnWidths: const {
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Fixtures',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Selection',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'League',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Odds',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[50],
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Croatia vs Poland'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Total: Over 2 Goals'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('UEFA Nations League'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('1.45'),
                    )),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2 A'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2 B'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2 C'),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2 D'),
                    )),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Football Accumulator Bet Explained\n\n"
                "You might have seen or heard of someone who has won millions by just investing or betting a few thousand. "
                "Have you ever wondered how that is possible? Well, this is possible through accumulator betting. "
                "Here, we will give you all the information you need to know about accumulator bets and how accumulator betting works.\n\n"
                "What is an accumulator bet?\n\n"
                "An accumulator bet, also known as an “acca,” is a combination of multiple events where each event is multiplied with each other "
                "to form a high-odd single bet. Unlike a single bet, an accumulator bet consists of at least two or more events.\n\n"
                "How does an accumulator bet work?\n\n"
                "Lets take a simple example to understand how an accumulator works. Suppose you have three football fixtures:\n\n"
                "1. Chelsea vs Fulham\n"
                "2. Barcelona vs Real Madrid\n"
                "3. United vs City\n\n"
                "Here are the odds for each event as given by a betting site:\n\n"
                "- Chelsea to win vs Fulham @ 1.6\n"
                "- Both teams to score in Barcelona vs Real Madrid @ 1.7\n"
                "- Over 3.5 Goals in United vs City @ 1.8\n\n"
                "If you combine all these events and form an accumulator bet, the total odds become 1.6 * 1.7 * 1.8, which equals 4.896.\n\n"
                "So, if you place a bet of \$10 on this accumulator bet, you get a return of \$48.96 if the bet wins. "
                "Remember that you need to win all three bets to win the accumulator bet.\n\n"
                "Pros and Cons\n\n"
                "Pros:\n\n"
                "1. You can earn big even with a small amount due to the multiplication of odds.\n"
                "2. Multiple events in an accumulator bet can make watching sports more exciting.\n\n"
                "Cons:\n\n"
                "1. Accumulator bets have a higher risk since all events must win to claim the payout.\n"
                "2. Even if most of your selection wins, losing one selection spoils the entire bet.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
