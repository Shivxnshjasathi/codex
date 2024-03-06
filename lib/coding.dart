import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';

class CodingTestScreen extends StatefulWidget {
  @override
  _CodingTestScreenState createState() => _CodingTestScreenState();
}

class _CodingTestScreenState extends State<CodingTestScreen> {
  TextEditingController codeController = TextEditingController();
  String problemStatement =
      'Write a function that calculates the sum of two number.';
  String userCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 45, 48),
        automaticallyImplyLeading: false,
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
          SingleChildScrollView(
            child: Column(
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
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Problem Statement Section
                  Card(
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
                            problemStatement,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Code Editor Section
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '<Your Code>',
                            style: TextStyle(
                              color: Color.fromARGB(255, 43, 45, 48),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                controller: codeController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                onChanged: (code) {
                                  setState(() {
                                    userCode = code;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: '// Write your code here',
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Code Highlighting
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: HighlightView(
                        padding: const EdgeInsets.all(8),
                        userCode,
                        language: 'c++',
                        theme: atomOneDarkTheme,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: userCode.isEmpty
                        ? null
                        : () {
                            // code submission function.
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    '/Code Submitted:',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 43, 45, 48)),
                                  ),
                                  content: const Text(
                                    'Your code has been submitted successfully.',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 43, 45, 48)),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                    child: Container(
                      width: 400,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 43, 45, 48),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                        child: Text(
                          '</Problem Statement>',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  // Submit Button

                  const SizedBox(height: 16),

                  // Plagiarism Warning
                  const Text(
                    '// Warning: Plagiarism consequences apply!',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
