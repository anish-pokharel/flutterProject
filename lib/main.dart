import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todayfootballprediction/features/bookmarkers/bookmarker_page.dart';
import 'package:todayfootballprediction/features/teams_to_win_today/ten_teams_win_page.dart';
import 'dart:convert';
import 'package:todayfootballprediction/features/today_football_accumulator_tips/accumulator_tips_page.dart';

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
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

 _navigateToHome() async {
  await Future.delayed(const Duration(seconds: 5), () {}); // Delay for 5 seconds

  if (mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Make sure to place your logo image here
          width: 200,
          height: 200,
        ),
      ),
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
    try {
      final response = await http.get(Uri.parse('https://footballbackend.vercel.app/matches'));
      if (response.statusCode == 200) {
        setState(() {
          matches = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load matches');
      }
    } catch (error) {
      // Log the error for debugging purposes
      // print('Error fetching matches: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Today Football Prediction',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
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
                  fontSize: 24.0,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Football Accumulator Tips is the combination of several events where odds of each event is multiplied to form a big odd. We provide several accumulator tips updated daily.",
                style: TextStyle(fontSize: 16.0, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16.0),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                _buildMatchTable(),
              const SizedBox(height: 16.0),
              _buildAccumulatorInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Today Football',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Prediction',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Today Football Accumulator Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccumulatorTipsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('10 Teams To WIN Today'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TenTeamsWinPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('BookMarker'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookmarkerPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Table _buildMatchTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300, width: 1.5),
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.blueAccent),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Fixtures',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Selection',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'League',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Odds',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        ...matches.map((match) {
          return TableRow(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(match['fixture'], textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(match['selection'], textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(match['league'], textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(match['odds'].toString(), textAlign: TextAlign.center),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildAccumulatorInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is a Football Accumulator?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          "Football Accumulator is a bet combining multiple selections into one bet. The odds of each event are multiplied to create a larger odd, resulting in bigger potential returns.",
          style: TextStyle(fontSize: 16.0, height: 1.5),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 16.0),
        Text(
          "Accumulator Tips Example:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          "Event 1: Team A to WIN\nEvent 2: Over 2.5 goals in Match B\nEvent 3: Team C to WIN\nTotal odds: 6.00",
          style: TextStyle(fontSize: 16.0, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
