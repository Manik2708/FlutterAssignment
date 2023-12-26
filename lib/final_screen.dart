import 'package:flutter/material.dart';
import 'package:flutterassignment/constants.dart';
class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final array=DataStore.getArray();
  late int finalPrice;
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
          const Text('Items Summary'),
          ListView.builder(
              itemCount: array.length,
              itemBuilder: (context, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(array[index]),
                  Text(DataStore.getPrice(array[index]).toString())
                ],
              );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TOTAL'),
              Text(finalPrice.toString())
            ],
          )
        ],
      ),
    );
  }
}
