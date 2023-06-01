import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/components/coffee_item_tile.dart';
import 'package:statemanagement/model/cart_model.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context){
          return CartPage();
        },
        ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),

      backgroundColor: const Color.fromRGBO(230, 190, 105, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 28,
            ),

            //goodmorning 
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning.", style:TextStyle( fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            
            const SizedBox(
              height: 8,
            ),

            //lets order items for you 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:24.0),
              child: Text("lets order coffee for you..",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            ),

            const SizedBox(
              height: 40,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: Text(
                "Awesome beverages :",
                style: TextStyle(fontSize: 24 , color: Color.fromARGB(255, 0, 0, 0)),),
            ),


            //grid like pattern and the items in them to be displayed 
            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child){
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: const EdgeInsets.all(12.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.4,
                  ),
                itemBuilder: (context, index){
                  return Coffeeitem(  
                    itemname: value.shopItems[index][0],
                    itemprice: value.shopItems[index][1],
                    caffeine: value.shopItems[index][2],
                    imagePath: value.shopItems[index][3],
                    color: value.shopItems[index][4],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                    },
                  );
                });
              })
              )
          ],
        )
      )
    );
  }
}