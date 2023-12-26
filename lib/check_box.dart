import 'package:flutter/material.dart';

import 'constants.dart';
// CustomCheckBox is a StatefulWidget representing a custom checkbox with additional information
class CustomCheckBox extends StatefulWidget {
  // The name of the object associated with the checkbox
  final String objectName;

  // Constructor for CustomCheckBox
  const CustomCheckBox({Key? key, required this.objectName}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

// The state associated with the CustomCheckBox widget
class _CustomCheckBoxState extends State<CustomCheckBox> {
  // Boolean variable to track whether the checkbox is clicked or not
  bool ifClicked = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve the corresponding price based on the objectName from the Constants maps
    final correspondingPrice = Constants.fruitsMap.containsKey(widget.objectName)
        ? Constants.fruitsMap[widget.objectName]
        : Constants.vegetablesMap.containsKey(widget.objectName)
        ? Constants.vegetablesMap[widget.objectName]
        : 'Error';

    // Row widget arranges its children in a horizontal array with space between them
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Checkbox widget represents a Material Design checkbox
        Checkbox(
          value: ifClicked,
          onChanged: (value) {
            setState(() {
              // Update the ifClicked state based on the value of the checkbox
              if (value != null) {
                ifClicked = value;
              }
              // If the checkbox is checked, add the objectName to the selected things list
              if (value == true) {
                DataStore.setMapValue(widget.objectName);
              }
            });
          },
        ),
        // Display the objectName associated with the checkbox
        Text(widget.objectName, style: const TextStyle(color: Colors.black),),
        // Display the corresponding price
        Text(correspondingPrice.toString(), style: const TextStyle(color: Colors.black),)
      ],
    );
  }
}
