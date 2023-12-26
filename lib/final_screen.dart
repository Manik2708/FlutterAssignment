import 'package:flutter/material.dart';
import 'package:flutterassignment/constants.dart';
class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final array=DataStore.getArray();
   int finalPrice=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<array.length;i++){
      finalPrice+=DataStore.getPrice(array[i]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text( 'Bill'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text('Items Summary', style: TextStyle(color: Colors.black),),
          SizedBox(
            height: 200,
            child: Expanded(
              child: ListView.builder(
                  itemCount: array.length,
                  itemBuilder: (context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(array[index], style: const TextStyle(color: Colors.black),),
                      Text(DataStore.getPrice(array[index]).toString(), style: const TextStyle(color: Colors.black),)
                    ],
                  );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TOTAL', style: TextStyle(color: Colors.black),),
              Text(finalPrice.toString(), style: const TextStyle(color: Colors.black),)
            ],
          )
        ],
      ),
    );
  }
}
