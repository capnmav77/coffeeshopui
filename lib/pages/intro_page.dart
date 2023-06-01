import 'package:flutter/material.dart';
import 'package:statemanagement/pages/home_page.dart';


// ignore: camel_case_types
class introPage extends StatelessWidget {
  const introPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(230, 190, 105, 1),
      //   appBar: AppBar(
      //     backgroundColor: const Color.fromRGBO(106, 216, 62, 1),
      //     centerTitle: true,
      //     title: const Text("hello world", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),),
      //   ),
      // ),
      body: Column(children: [
        //image
        Padding(padding: const EdgeInsets.only(left: 40,right: 40,bottom: 40, top: 80),
        child: Image.asset("images/coffee-cup.png"),
        ),

        //we deliver stuff to your home 
      const Padding(padding: EdgeInsets.all(24),
      child: Text(
        "we deliver coffee to your home anytime",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),

      const SizedBox(
        height: 20,
      ),

      //get started 
      GestureDetector(
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return const HomePage();
          },
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 151, 120, 48),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(24),
          child: const Text(
            "Get in",
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)
          ),
        ),
      ),

      ],
      ),
      ),
    );
  }
}