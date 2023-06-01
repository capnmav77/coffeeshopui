import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/model/cart_model.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 190, 105, 1),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 237, 190, 89),
        title: const Text("My Cart", style: TextStyle(color: Colors.black),),
      ),
      body: Consumer<CartModel> (builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 191, 153, 40),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][3]
                          ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text("\$ "+value.cartItems[index][1]),
                        trailing: IconButton(
                          icon :const Icon(Icons.remove),
                          onPressed: () => Provider.of<CartModel>(
                            context, listen: false).removeItemFromCart(index),
                          ),
                      ),  
                    ),
                  );
                }
              ),
            ),

            //paynow and total caffiene and total price button 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 195, 64),
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //for total amount 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Total price",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("\$ ${value.calculateTotal()}",style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      ],
                      //for total caffenine
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("caff. value",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${value.calculateTotalcaffeine()} mg",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      ],
                    ),
                    //pay now button
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color.fromARGB(255, 100, 75, 2)),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Row(
                        children: [
                          Text("payNow",
                          style: TextStyle(color:Color.fromARGB(255, 73, 53, 3), fontSize: 20,)
                          ),
                          Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 102, 61, 0),size: 16,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    ),
    );
  }
}