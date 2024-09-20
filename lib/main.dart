import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> matches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final response = await http.get(Uri.parse('http://localhost:3200/matches')); // Replace with your API URL
    if (response.statusCode == 200) {
      setState(() {
        matches = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load matches');
    }
  }

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Football Accumulator Tips",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Football Accumulator Tips is the combination of several events where odds of each event is multiplied with each other to form a big odd. "
                "Here we provide several accumulator tips updated daily.",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify, // Aligns the content properly
              ),
              const SizedBox(height: 16.0),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Table(
                  border: TableBorder.all(color: Colors.grey.shade400),
                  columnWidths: const {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                  },
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Fixtures',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center, // Center-align table headers
                            ),
                          ),
                        ),
                        TableCell(
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
                        TableCell(
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
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Odds',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...matches.map((match) {
                      return TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(match['fixture'],
                                  textAlign: TextAlign.center), // Center-align table data
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(match['selection'],
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(match['league'],
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(match['odds'].toString(),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Football Accumulator Bet Explained\n\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Bold for heading
                      ),
                      TextSpan(
                        text:
                            "You might have seen or heard of someone who has won millions by just investing or betting a few thousand. "
                            "Have you ever wondered how that is possible? Well, this is possible through accumulator betting. "
                            "Here, we will give you all the information you need to know about accumulator bets and how accumulator betting works.\n\n",
                        style: TextStyle(),
                        // Apply justified alignment for paragraphs
                      ),
                      TextSpan(
                        text: "What is an accumulator bet?\n\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Bold for heading
                      ),
                      TextSpan(
                        text:
                            "An accumulator bet, also known as an “acca,” is a combination of multiple events where each event is multiplied with each other "
                            "to form a high-odd single bet. Unlike a single bet, an accumulator bet consists of at least two or more events.\n\n",
                        style: TextStyle(),
                        // Apply justified alignment for paragraphs
                      ),
                      TextSpan(
                        text: "How does an accumulator bet work?\n\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Bold for heading
                      ),
                      TextSpan(
                        text:
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
                            "Remember that you need to win all three bets to win the accumulator bet.\n\n",
                        style: TextStyle(),
                        // Apply justified alignment for paragraphs
                      ),
                      TextSpan(
                        text: "Pros and Cons\n\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Bold for heading
                      ),
                      TextSpan(
                        text:
                            "Accumulator bets offer high rewards but are riskier as you need all your selections to win for the bet to succeed. "
                            "The more selections you add, the higher the risk, but also the higher the reward.",
                        style: TextStyle(),
                        // Apply justified alignment for paragraphs
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify, // Justifies all RichText content
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
