import 'package:flutter/material.dart';
import 'package:flutterassignment/check_box.dart';
import 'package:flutterassignment/constants.dart';
import 'package:flutterassignment/final_screen.dart';
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<ThirdScreen> {
  List<String> currentState=Constants.vegetablesMap.keys.toList();
  String appBarTitle='Vegetables';
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
              height: 600,
              child: Expanded(
                child: ListView.builder(
                    itemCount: currentState.length,
                    itemBuilder: (context, index){
                      // A bad way to achieve the latest state, a better way is by state management like Providers
                      return CustomCheckBox(objectName: currentState[index],);
                    }),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FinalScreen()));
              },
                child: const Text('Next', style: TextStyle(color: Colors.black),))
          ],
        )
    );
  }
}