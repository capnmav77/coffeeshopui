import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Coffeeitem extends StatelessWidget {

  final String itemname;
  final String itemprice;
  final String caffeine;
  final String imagePath;
  // ignore: prefer_typing_uninitialized_variables
  final color; 
  void Function()? onPressed;


  Coffeeitem({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.caffeine,
    required this.imagePath,
    required this.color,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)
          ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //image 
            Image.asset(
              imagePath,
              height: 100,),
    
            //name
            Text("$itemname\ncaf content: ${caffeine}mg",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    
            //price 
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                "\$$itemprice",
                style: const TextStyle(
                  color: Colors.black ,
                  fontWeight: FontWeight.bold),
                ),
            )
    
          ],),
      ),
    );
  }
}