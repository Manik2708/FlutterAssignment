import 'package:flutter/material.dart';
import 'package:flutterassignment/constants.dart';
// FinalScreen is a StatefulWidget representing the final screen in the app
class FinalScreen extends StatefulWidget {
  // Constructor for FinalScreen
  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

// The state associated with the FinalScreen widget
class _FinalScreenState extends State<FinalScreen> {
  // Get the array of items from the DataStore
  final array = DataStore.getArray();

  // Variable to store the final calculated price
  int finalPrice = 0;

  @override
  void initState() {
    // Called when the widget is inserted into the tree
    super.initState();

    // Calculate the total price by summing up individual item prices
    for (int i = 0; i < array.length; i++) {
      finalPrice += DataStore.getPrice(array[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of the visual interface
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill'),
        centerTitle: true,
      ),
      // Column widget arranges its children in a vertical array
      body: Column(
        children: [
          // Display a text indicating items summary
          const Text('Items Summary', style: TextStyle(color: Colors.black),),

          // Expanded ensures that the ListView takes up all available vertical space
          Expanded(
            // ListView.builder creates a scrollable list of widgets based on the array
            child: ListView.builder(
              itemCount: array.length,
              itemBuilder: (context, index) {
                // Row widget arranges its children in a horizontal array with space between them
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Display the name of the item
                    Text(array[index], style: const TextStyle(color: Colors.black),),

                    // Display the price of the item
                    Text(DataStore.getPrice(array[index]).toString(), style: const TextStyle(color: Colors.black),)
                  ],
                );
              },
            ),
          ),

          // Row widget arranges its children in a horizontal array with space between them
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Display the total label
              const Text('TOTAL', style: TextStyle(color: Colors.black),),

              // Display the calculated total price
              Text(finalPrice.toString(), style: const TextStyle(color: Colors.black),)
            ],
          )
        ],
      ),
    );
  }
}
