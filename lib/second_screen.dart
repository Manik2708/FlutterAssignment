import 'package:flutter/material.dart';
import 'package:flutterassignment/check_box.dart';
import 'package:flutterassignment/constants.dart';
import 'package:flutterassignment/third_screen.dart';
// SecondScreen is a StatefulWidget representing the second screen in the app
class SecondScreen extends StatefulWidget {
  // Constructor for SecondScreen
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

// The state associated with the SecondScreen widget
class _SecondScreenState extends State<SecondScreen> {
  // List of strings representing the current state of fruits
  List<String> currentState = Constants.fruitsMap.keys.toList();

  // Title for the AppBar
  String appBarTitle = 'Fruits';

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of the visual interface
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      // Column widget arranges its children in a vertical array
      body: Column(
        children: [
          // Expanded ensures that the ListView takes up all available vertical space
          Expanded(
            // ListView.builder creates a scrollable list of widgets based on the current state
            child: ListView.builder(
              itemCount: currentState.length,
              itemBuilder: (context, index) {
                // CustomCheckBox is a widget representing a checkbox for a specific object
                // A better way to manage state is to use state management solutions like Providers
                return CustomCheckBox(objectName: currentState[index]);
              },
            ),
          ),
          // ElevatedButton is a button with a Material-style raised surface
          ElevatedButton(
            onPressed: () {
              // Navigate to the ThirdScreen when the button is pressed
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThirdScreen()));
            },
            child: const Text('Next', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
