import 'package:flutter/material.dart';
import 'package:flutterassignment/check_box.dart';
import 'package:flutterassignment/constants.dart';
import 'package:flutterassignment/final_screen.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> currentState=Constants.fruitsMap.keys.toList();
  String appBarTitle='Fruits';
  bool checkBoxBool=false;
  bool onVegetablesScreen=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Expanded(
              child: ListView.builder(
                  itemCount: currentState.length,
                  itemBuilder: (context, index){
                    // A bad way to achieve the latest state, a better way is by state management like Providers
                    return onVegetablesScreen?CustomCheckBox(objectName: currentState[index],):CustomCheckBox(objectName: currentState[index],);
                  }),
            ),
          ),
         ElevatedButton(onPressed: (){
           setState(() {
             if(!onVegetablesScreen){
               appBarTitle='Vegetables';
               currentState=Constants.vegetablesMap.keys.toList();
               onVegetablesScreen=true;
             }
             else{
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FinalScreen()));
             }
           });
          }, child: const Text('Next', style: TextStyle(color: Colors.black),))
        ],
      )
    );
  }
}
