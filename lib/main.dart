import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_flutter/coding.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '/Codex:',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: CodingScreen(),
    );
  }
}

class CodingScreen extends StatefulWidget {
  @override
  _CodingScreenState createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  TextEditingController codeController = TextEditingController();
  String problemStatement1 =
      'Write a function that calculates the sum of two numbers.';
  String problemStatement2 =
      'Write a function that takes a string as input and returns its reverse.';
  String problemStatement3 =
      'Implement a function to check if a given string is a palindrome.';
  String problemStatement4 =
      'Write a function to check if two strings are anagrams of each othe';
  String problemStatement5 =
      'Given a string, find the length of the longest substring without repeating characters.';
  String problemStatement6 =
      'Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 45, 48),
        title: const Text(
          '🖱️/Codex:',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to user profile page.
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 45, 48),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              const SizedBox(
                height: 180,
              ),
              SizedBox(height: 250, child: Image.asset("assets/1.png")),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '  <My Problems>',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Problem Statement Section
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: CodingTestScreen()));
                      },
                      child: problemtile(problemStatement1)),
                  const SizedBox(height: 10),
                  problemtile(problemStatement2),
                  const SizedBox(height: 10),
                  problemtile(problemStatement3),
                  const SizedBox(height: 10),
                  problemtile(problemStatement4),
                  const SizedBox(height: 10),
                  problemtile(problemStatement5),
                  const SizedBox(height: 10),
                  problemtile(problemStatement6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget problemtile(String problem) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '<Problem Statement>',
            style: TextStyle(
              color: Color.fromARGB(255, 43, 45, 48),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            problem,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
